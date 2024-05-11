using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using OfficeOpenXml;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using OfficeOpenXml.Style;
using System.Text.RegularExpressions;

namespace Uniqlo.AdminPages.AdminOrder
{
    public partial class OrderHome : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }


        private void BindRepeater()
        {
            using (var db = new OrderDbContext())
            {
                var orders = db.Order
                    .Include(o => o.Customer)
                    .Include(o => o.OrderLists)
                    .Include(o => o.Payments)
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
            }
        }


        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportProductsToExcel();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterOrdersByPaymentStatus();
        }


        protected void FilterOrdersByPaymentStatus()
        {
            using (var db = new OrderDbContext())
            {
                string selectedStatus = ddlStatus.SelectedValue;
                bool showAll = string.IsNullOrEmpty(selectedStatus);

                // Start by including all necessary entities
                var orderQuery = db.Order
                    .Include(o => o.Customer)
                    .Include(o => o.OrderLists)
                    .Include(o => o.Payments)
                    .AsQueryable();

                if (!showAll)
                {
                    // Apply filtering only when a specific status is selected
                    orderQuery = orderQuery
                        .Where(o => o.Payments.Any(p => p.Payment_Status == selectedStatus));
                }

                // Projection is the same in both cases, do it after filtering
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
                    .ToList(); // Execute the query

                orderRepeater.DataSource = orders;
                orderRepeater.DataBind();
            }
        }






        
        private void ExportProductsToExcel()
        {
            string connectionString = Global.CS; // Ensure this is correctly defined
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();  // Ensure the connection is opened before executing the command

                // Start building the base query
                StringBuilder query = new StringBuilder(@"SELECT o.Order_ID, c.Name, SUM(ol.Qty) AS TotalQty, p.Total_Payment, p.Payment_DateTime, p.Payment_Status 
                                                  FROM Orders o 
                                                  JOIN Customer c ON o.Customer_ID = c.Customer_ID
                                                  JOIN OrderList ol ON o.Order_ID = ol.Order_ID
                                                  JOIN Payment p ON o.Order_ID = p.Order_ID");

                // Initialize a SqlCommand with an empty query string
                using (SqlCommand cmd = new SqlCommand("", conn))
                {
                    // Retrieve the selected values from the dropdowns
                    string selectedStatus= ddlStatus.SelectedValue;

                    // Check if there are any conditions to add based on dropdown selection
                    if (!string.IsNullOrEmpty(selectedStatus) && selectedStatus != "All Status")
                    {
                        query.Append(" WHERE p.Payment_Status = @PaymentStatus");
                        cmd.Parameters.AddWithValue("@PaymentStatus", selectedStatus);
                    }

                    query.Append(" GROUP BY o.Order_ID, c.Name, p.Total_Payment, p.Payment_DateTime, p.Payment_Status;");


                    // Set the SqlCommand's CommandText to the built query
                    cmd.CommandText = query.ToString();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        using (ExcelPackage pck = new ExcelPackage())
                        {
                            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Orders");
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
        
    }
}