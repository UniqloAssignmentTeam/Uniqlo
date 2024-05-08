using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace Uniqlo.AdminPages.AdminDiscount
{
    public partial class DiscountHome : System.Web.UI.Page
    {
        string cs=Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }
        protected void addDiscountBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("addDiscount.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            var item = button.NamingContainer as RepeaterItem;
            var discountIdLabel = item.FindControl("discountId") as Label;
            Session["discountId"] = discountIdLabel.Text;  
            Response.Redirect("UpdateDiscount.aspx");
        }
        
        protected void btnRemoveDiscount_Click(object sender, EventArgs e)
        {
            int discountId = int.Parse(hiddenDiscountId.Value); 
            using (var db = new DiscountDbContext())
            {
                var discount = db.Discount.Find(discountId);
                if (discount != null)
                {
                    db.Discount.Remove(discount);
                    db.SaveChanges();
                    Response.Redirect("DiscountHome.aspx");
                }
            }
        }

        private void BindRepeater()
        {
            using (var db = new DiscountDbContext())
            {
                var discountList = db.Discount.Include("Product").ToList(); // Ensure that you include the Product navigation property
                discountRepeater.DataSource = discountList;
                discountRepeater.DataBind();
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportDiscountsToExcel();
        }

        protected void statusSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var db = new DiscountDbContext())
            {
                string selectedStatus = statusSortDDL.SelectedValue;

                // Determine if the selected value is empty or the placeholder item.
                // Adjust this check if your "--Select Status--" has a specific value.
                bool showAll = string.IsNullOrEmpty(selectedStatus);

                var discountQuery = db.Discount.AsQueryable(); // Start with a queryable to conditionally build query.

                if (!showAll)
                {
                    // Apply filter only if a specific status is selected.
                    discountQuery = discountQuery.Include("Product").Where(d => d.Status == selectedStatus);
                }
                else
                {
                    // Optionally include related products even when showing all, if needed.
                    discountQuery = discountQuery.Include("Product");
                }

                // Execute the query and bind the results to the repeater.
                var discountList = discountQuery.ToList();
                discountRepeater.DataSource = discountList;
                discountRepeater.DataBind();
            }
        }

      


public void ExportDiscountsToExcel()
        {
            try
            {
                string connectionString = cs;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"SELECT d.Discount_ID, d.Discount_Amount, d.Status, d.Start_Date, d.End_Date, d.Product_ID, 
            p.Product_Name FROM Discount d JOIN Product p ON d.Product_ID = p.Product_ID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            using (ExcelPackage pck = new ExcelPackage())
                            {
                                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Discounts");
                                ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                                // Formatting logic here
                                var memoryStream = new MemoryStream();
                                pck.SaveAs(memoryStream);

                                HttpContext.Current.Response.ContentType = "application/vnd.openxmlforts-officedocument.spreadsheetml.sheet";
                                HttpContext.Current.Response.AddHeader("content-disposition", "attachment;  filename=Discounts.xlsx");
                                HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                                HttpContext.Current.Response.End();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle the exception here
                Console.WriteLine("Error: " + ex.Message);
            }
        }


    }
}