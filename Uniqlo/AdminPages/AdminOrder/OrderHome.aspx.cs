using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using System.Web;

namespace Uniqlo.AdminPages.AdminOrder
{
    public partial class OrderHome : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffRole"]==null)
                {
                    // Redirect to adminLogin.aspx if the session role is invalid or not set
                    Response.Redirect("../adminLogin.aspx");
                    Session["Unauthorized"] = true;
                }
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            try
            {
                using (var db = new OrderDbContext())
                {
                    string selectedStatus = ddlStatus.SelectedValue;
                    bool showAll = string.IsNullOrEmpty(selectedStatus);

                    var orderQuery = db.Order
                        .Where(o => !o.IsDeleted)
                        .Include(o => o.Customer)
                        .Include(o => o.OrderLists)
                        .Include(o => o.Payments)
                        .AsQueryable();

                    if (!showAll)
                    {
                        orderQuery = orderQuery
                            .Where(o => o.Payments.Any(p => p.Payment_Status == selectedStatus));
                    }

                    var orders = orderQuery
                        .Select(o => new
                        {
                            OrderId = o.Order_ID,
                            CustomerName = o.Customer.Name,
                            OrderListTotalItems = o.OrderLists.Sum(ol => ol.Qty),
                            PaymentTotalAmount = o.Payments.Sum(p => p.Total_Payment),
                            PaymentDate = o.Payments.Select(p => p.Payment_DateTime).FirstOrDefault(),
                            PaymentStatus = o.Payments.Select(p => p.Payment_Status).FirstOrDefault()
                        })
                        .ToList();

                    orderRepeater.DataSource = orders;
                    orderRepeater.DataBind();
                    noDiscount.Visible = orders.Count == 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"alert('An error occurred when retrieving orders: {ex.Message}');", true);
            }
        }

        protected void btnRemoveOrder_Click(object sender, EventArgs e)
        {
            int orderId = int.Parse(hiddenOrderId.Value);

            try
            {
                using (var db = new OrderDbContext())
                {
                    var order = db.Order.Find(orderId);
                    if (order != null)
                    {
                        order.IsDeleted = true;

                        var payment = db.Payment.FirstOrDefault(p => p.Order_ID == orderId);
                        if (payment != null)
                        {
                            var delivery = db.Delivery.Find(payment.Delivery_ID);
                            if (delivery != null)
                            {
                                db.Delivery.Remove(delivery);
                            }

                            db.Payment.Remove(payment);
                        }

                        db.SaveChanges();

                        ScriptManager.RegisterStartupScript(this, GetType(), "showDeleteSuccess", "showDeleteSuccess();", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterOrdersByPaymentStatus();
        }

        protected void FilterOrdersByPaymentStatus()
        {
            try
            {
                using (var db = new OrderDbContext())
                {
                    string selectedStatus = ddlStatus.SelectedValue;
                    bool showAll = string.IsNullOrEmpty(selectedStatus);

                    var orderQuery = db.Order
                        .Where(o => !o.IsDeleted)
                        .Include(o => o.Customer)
                        .Include(o => o.OrderLists)
                        .Include(o => o.Payments)
                        .AsQueryable();

                    if (!showAll)
                    {
                        orderQuery = orderQuery
                            .Where(o => o.Payments.Any(p => p.Payment_Status == selectedStatus));
                    }

                    var orders = orderQuery
                        .Select(o => new
                        {
                            OrderId = o.Order_ID,
                            CustomerName = o.Customer.Name,
                            OrderListTotalItems = o.OrderLists.Sum(ol => ol.Qty),
                            PaymentTotalAmount = o.Payments.Sum(p => p.Total_Payment),
                            PaymentDate = o.Payments.Select(p => p.Payment_DateTime).FirstOrDefault(),
                            PaymentStatus = o.Payments.Select(p => p.Payment_Status).FirstOrDefault()
                        })
                        .ToList();

                    orderRepeater.DataSource = orders;
                    orderRepeater.DataBind();
                    noDiscount.Visible = orders.Count == 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Filtering orders.');", true);
            }
        }

        private void SearchDatabase(string searchText = "")
        {
            try
            {
                using (var db = new OrderDbContext())
                {
                    var orders = db.Order
                        .Include(o => o.Customer)
                        .Include(o => o.OrderLists)
                        .Include(o => o.Payments)
                        .Where(o => o.Customer.Name.Contains(searchText) && !o.IsDeleted)
                        .Select(o => new
                        {
                            OrderId = o.Order_ID,
                            CustomerName = o.Customer.Name,
                            OrderListTotalItems = o.OrderLists.Sum(ol => ol.Qty),
                            PaymentTotalAmount = o.Payments.Sum(p => p.Total_Payment),
                            PaymentDate = o.Payments.Select(p => p.Payment_DateTime).FirstOrDefault(),
                            PaymentStatus = o.Payments.Select(p => p.Payment_Status).FirstOrDefault()
                        })
                        .ToList();

                    orderRepeater.DataSource = orders;
                    orderRepeater.DataBind();
                    noDiscount.Visible = orders.Count == 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Searching Customer Name.');", true);
            }
        }

        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            SearchDatabase(searchBox.Text);
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportProductsToExcel();
        }

        private void ExportProductsToExcel()
        {
            string connectionString = Global.CS;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    StringBuilder query = new StringBuilder(@"SELECT o.Order_ID, c.Name, SUM(ol.Qty) AS TotalQty, p.Total_Payment, p.Payment_DateTime, p.Payment_Status 
                                                      FROM Orders o 
                                                      JOIN Customer c ON o.Customer_ID = c.Customer_ID
                                                      JOIN OrderList ol ON o.Order_ID = ol.Order_ID
                                                      JOIN Payment p ON o.Order_ID = p.Order_ID");

                    using (SqlCommand cmd = new SqlCommand("", conn))
                    {
                        string selectedStatus = ddlStatus.SelectedValue;

                        if (!string.IsNullOrEmpty(selectedStatus) && selectedStatus != "All Status")
                        {
                            query.Append(" WHERE p.Payment_Status = @PaymentStatus");
                            cmd.Parameters.AddWithValue("@PaymentStatus", selectedStatus);
                        }

                        query.Append(" GROUP BY o.Order_ID, c.Name, p.Total_Payment, p.Payment_DateTime, p.Payment_Status;");

                        cmd.CommandText = query.ToString();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            using (OfficeOpenXml.ExcelPackage pck = new OfficeOpenXml.ExcelPackage())
                            {
                                OfficeOpenXml.ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Orders");
                                ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                                var memoryStream = new MemoryStream();
                                pck.SaveAs(memoryStream);
                                memoryStream.Position = 0;

                                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Orders.xlsx");
                                HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                                HttpContext.Current.Response.End();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Export Orders.');", true);
            }
        }
    }
}
