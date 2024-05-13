﻿using OfficeOpenXml;
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
                    discountRepeater.DataSource = db.Discount.Include("Product").ToList();
                    discountRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                AlertError("An error occurred while displaying the discount.");
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
            int discountId = int.Parse(hiddenDiscountId.Value);
            using (var db = new DiscountDbContext())
            {
                var discount = db.Discount.Find(discountId);
                if (discount != null)
                {
                    db.Discount.Remove(discount);
                    db.SaveChanges();
                    RedirectTo("DiscountHome.aspx");
                }
                else
                {
                    AlertError("Discount not found.");
                }
            }
        }

      

        private void SearchDiscounts()
        {
            using (var db = new DiscountDbContext())
            {
                string searchText = searchBox.Text.Trim();
                var results = db.Discount.Include(d => d.Product)
                                .Where(d => d.Product.Product_Name.Contains(searchText) && !d.Product.IsDeleted)
                                .ToList();

                discountRepeater.DataSource = results;
                discountRepeater.DataBind();
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
                string connectionString = Global.CS; // Ensure this is correctly defined
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();  // Ensure the connection is opened before executing the command

                    // Start building the base query
                    StringBuilder query = new StringBuilder(@"SELECT d.Discount_ID, d.Discount_Amount, d.Status, d.Start_Date, d.End_Date, d.Product_ID, 
        p.Product_Name FROM Discount d JOIN Product p ON d.Product_ID = p.Product_ID");

                    // Initialize a SqlCommand with an empty query string
                    using (SqlCommand cmd = new SqlCommand("", conn))
                    {
                        // Retrieve the selected values from the dropdowns
                        string selectedCategory = statusSortDDL.SelectedValue;


                        // Check if there are any conditions to add based on dropdown selection
                        if (!string.IsNullOrEmpty(selectedCategory) && selectedCategory != "Status")
                        {
                            query.Append(" WHERE d.Status = @Status");
                            cmd.Parameters.AddWithValue("@Status", selectedCategory);
                        }


                        // Set the SqlCommand's CommandText to the built query
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
                // Handle or log the error
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
            ScriptManager.RegisterStartupScript(this, GetType(), "error", $"alert('{message}');", true);
        }

    }
    }



