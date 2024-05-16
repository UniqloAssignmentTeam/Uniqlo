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
using static Uniqlo.Discount;
using System.Text;

namespace Uniqlo.AdminPages.AdminDiscount
{
    public partial class DiscountHome : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["StaffRole"] == null)
                {
                    // Redirect to adminLogin.aspx if the session role is invalid or not set
                    Response.Redirect("../adminLogin.aspx");
                    Session["Unauthorized"] = true;
                }
                BindRepeater();
               
            }
          
        }

        protected void addDiscountBtn_Click(object sender, EventArgs e)
        {
            RedirectTo("addDiscount.aspx");
        }

        protected void update_Click(object sender, EventArgs e)
        {
            HandleDiscountUpdate(sender);
        }

        protected void btnRemoveDiscount_Click(object sender, EventArgs e)
        {
            RemoveDiscount();
        }

        protected void BtnExport_Click(object sender, EventArgs e)
        {
            ExportProductsToExcel();
        }

        

        protected void cancelRemoveDiscount_Click(object sender, EventArgs e)
        {
            RedirectTo("DiscountHome.aspx");
        }

        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            SearchDiscounts();
        }

        private void BindRepeater()
        {
            try
            {
                using (var db = new DiscountDbContext())
                {
                    var discounts = db.Discount.Include("Product").ToList();
                    discountRepeater.DataSource = discounts;
                    discountRepeater.DataBind();

                    // Show the label if there are no discounts

                    noDiscount.Visible = discounts.Count == 0;


                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "displayError", "showAlert('error', 'Error!', 'An error occurred while displaying the discount.');", true);
            }
        }



        private void HandleDiscountUpdate(object sender)
        {
            var button = sender as Button;
            var item = button?.NamingContainer as RepeaterItem;
            var discountIdLabel = item?.FindControl("discountId") as Label;

            if (int.TryParse(discountIdLabel?.Text, out int discountId))
            {
                Session["discountId"] = discountId;
                RedirectTo("UpdateDiscount.aspx");
            }
            else
            {
                AlertError("Invalid operation.");
            }
        }

        private void RemoveDiscount()
        {
            int discountId = Convert.ToInt32(hiddenDiscountId.Value);
            using (var db = new DiscountDbContext())
            {
                var discount = db.Discount.Find(discountId);
                if (discount != null)
                {
                    db.Discount.Remove(discount);
                    db.SaveChanges();
                    ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess", "showDeleteSuccess();", true);
                }
                else
                {
                    AlertError("Discount not found.");
                }
            }
        }


        private void SearchDiscounts()
        {
            try
            {
                using (var db = new DiscountDbContext())
                {
                    string searchText = searchBox.Text.Trim();
                    var results = db.Discount.Include(d => d.Product)
                                    .Where(d => d.Product.Product_Name.Contains(searchText) && d.Product.IsDeleted == false)
                                    .ToList();

                    discountRepeater.DataSource = results;
                    discountRepeater.DataBind();

                    // Show the label if there are no search results
                    noDiscount.Visible = results.Count == 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "searchError", "showAlert('error', 'Error!', 'An error occurred while searching the discounts.');", true);
            }
        }





        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportProductsToExcel();
        }
        private void ExportProductsToExcel()
        {
            try
            {
                string connectionString = Global.CS; 
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open(); 

                   
                    StringBuilder query = new StringBuilder(@"SELECT d.Discount_ID, d.Discount_Amount, d.Status, d.Start_Date, d.End_Date, d.Product_ID, 
            p.Product_Name FROM Discount d JOIN Product p ON d.Product_ID = p.Product_ID");

                   
                    using (SqlCommand cmd = new SqlCommand("", conn))
                    {
                        
                        string selectedCategory = statusSortDDL.SelectedValue;

                     
                        if (!string.IsNullOrEmpty(selectedCategory) && selectedCategory != "Status")
                        {
                            query.Append(" WHERE d.Status = @Status");
                            cmd.Parameters.AddWithValue("@Status", selectedCategory);
                        }

                
                        cmd.CommandText = query.ToString();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            using (ExcelPackage pck = new ExcelPackage())
                            {
                                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Discount");
                                ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                                var memoryStream = new MemoryStream();
                                pck.SaveAs(memoryStream);
                                memoryStream.Position = 0;

                        

                                
                                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Discount.xlsx");
                                HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                                HttpContext.Current.Response.End();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while downloading the discount.');", true);
              
            }
        }



        protected void statusSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (var db = new DiscountDbContext())
                {
                    string selectedStatus = statusSortDDL.SelectedValue;
                    var discountQuery = db.Discount.AsQueryable();
                    if (!string.IsNullOrEmpty(selectedStatus))
                    {
                        discountQuery = discountQuery.Include("Product").Where(d => d.Status == selectedStatus);
                    }
                    else
                    {
                        discountQuery = discountQuery.Include("Product");
                    }
                    var discountList = discountQuery.ToList();
                    discountRepeater.DataSource = discountList;
                    discountRepeater.DataBind();
                    noDiscount.Visible = discountList.Count == 0;
                }
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while sorting the discount.');", true);
                // Handle the error
            }
        }
        private void RedirectTo(string url)
        {
            try
            {
                Response.Redirect(url);
            }
            catch (Exception)
            {
                AlertError("Failed to redirect.");
            }
        }
      
        private void AlertError(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertError", "showAlert('error', 'Error!', '" + message + "');", true);
        }


    }
}



