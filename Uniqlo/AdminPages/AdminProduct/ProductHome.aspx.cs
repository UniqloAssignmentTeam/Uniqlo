using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;
using System.Data.Entity;
using OfficeOpenXml;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using static Uniqlo.Staff;

namespace Uniqlo.AdminPages.AdminProduct
{
    public partial class ProductHome : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
            string eventTarget = Request["__EVENTTARGET"];
            string eventArgument = Request["__EVENTARGUMENT"];

            if (eventTarget == "DeleteConfirmed")
            {
                DeleteConfirmed(eventArgument);
            }
        }

        protected void addProdBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }


        protected void btnRemoveProduct_Click(object sender, CommandEventArgs e)
        {
            int prodId = Convert.ToInt32(e.CommandArgument);
            ScriptManager.RegisterStartupScript(this, GetType(), "confirmDeleteScript", $"confirmDelete('DeleteConfirmed', '{prodId}');", true);
        }

        protected void DeleteConfirmed(string args)
        {
            if (int.TryParse(args, out int prodId))
            {
                ProductDbContext db = null;
                System.Data.Entity.DbContextTransaction transaction = null;
                try
                {
                    db = new ProductDbContext();
                    transaction = db.Database.BeginTransaction();

                    var product = db.Product.Find(prodId);
                    if (product != null)
                    {
                        product.IsDeleted = true;
                        var discounts = db.Discount.Where(d => d.Product_ID == prodId).ToList();
                        foreach (var discount in discounts)
                        {
                            discount.Status = "Inactive";
                        }

                        var quantities = db.Quantity.Where(q => q.Product_ID == prodId).ToList();
                        foreach (var quantity in quantities)
                        {
                            quantity.Qty = 0;

                            db.SaveChanges();
                            Response.Redirect(Request.RawUrl);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error!', 'Product not found.', 'error');", true);
                    }
                }
                catch (Exception ex)
                {
                    if (transaction != null) transaction.Rollback();  // Explicitly roll back the transaction on error
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error!', 'An error occurred: " + ex.Message.Replace("'", "\\'") + "', 'error');", true);
                }
                finally
                {
                    if (db != null) db.Dispose();
                }
            }
        }



        private void BindRepeater()
        {
            using (var db = new ProductDbContext())
            {
                var productList = db.Product.Include(p => p.Category).Where(p => !p.IsDeleted).ToList();

                prodRepeater.DataSource = productList;
                prodRepeater.DataBind();
                noDiscount.Visible = productList.Count == 0;
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            ExportProductsToExcel();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterProducts();
        }

        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterProducts();
        }

        private void FilterProducts()
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    string selectedCategory = ddlCategory.SelectedValue;
                    string selectedGender = ddlGender.SelectedValue;

                    var productQuery = db.Product.Include(p => p.Category).AsQueryable();

                    if (!string.IsNullOrEmpty(selectedCategory))
                    {
                        productQuery = productQuery.Where(p => p.Category.Name == selectedCategory);
                    }

                    if (!string.IsNullOrEmpty(selectedGender))
                    {
                        productQuery = productQuery.Where(p => p.Category.Gender == selectedGender);
                    }

                    productQuery = productQuery.Where(p => p.IsDeleted == false);

                    var productList = productQuery.ToList();
                    prodRepeater.DataSource = productList;
                    prodRepeater.DataBind();
                    noDiscount.Visible = productList.Count == 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Filtering product.');", true);
            }
        }

        private void ExportProductsToExcel()
        {
            string connectionString = Global.CS;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    StringBuilder query = new StringBuilder(@"SELECT p.Product_ID, p.Product_Name, p.Description, p.Price, c.Name, c.Gender 
                                                              FROM Product p 
                                                              JOIN Category c ON p.Category_ID = c.Category_ID 
                                                              WHERE p.IsDeleted = 0");

                    using (SqlCommand cmd = new SqlCommand("", conn))
                    {
                        string selectedCategory = ddlCategory.SelectedValue;
                        string selectedGender = ddlGender.SelectedValue;

                        if (!string.IsNullOrEmpty(selectedCategory) && selectedCategory != "All Categories")
                        {
                            query.Append(" AND c.Name = @Category");
                            cmd.Parameters.AddWithValue("@Category", selectedCategory);
                        }
                        if (!string.IsNullOrEmpty(selectedGender) && selectedGender != "All Genders")
                        {
                            query.Append(" AND c.Gender = @Gender");
                            cmd.Parameters.AddWithValue("@Gender", selectedGender);
                        }

                        cmd.CommandText = query.ToString();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            using (ExcelPackage pck = new ExcelPackage())
                            {
                                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Products");
                                ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                                var memoryStream = new MemoryStream();
                                pck.SaveAs(memoryStream);
                                memoryStream.Position = 0;

                                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Products.xlsx");
                                HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                                HttpContext.Current.Response.End();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Export product.');", true);
            }
        }

        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string searchText = searchBox.Text;
                var results = SearchDatabase(searchText);
                prodRepeater.DataSource = results;
                prodRepeater.DataBind();
                noDiscount.Visible = results.Count == 0;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while searching the product name.');", true);
            }
        }

        public List<Product> SearchDatabase(string searchText)
        {
            using (var db = new ProductDbContext())
            {
                var productList = db.Product.Include(p => p.Category).Where(p => p.IsDeleted == false && p.Product_Name.Contains(searchText)).ToList();
                return productList;
            }
        }
    }
}
