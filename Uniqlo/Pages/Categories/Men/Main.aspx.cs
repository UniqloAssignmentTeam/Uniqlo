using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;

namespace Uniqlo.Pages.Categories.Men
{
    
    public partial class Main : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
            }
        }

        private void BindDataList()
        {
            using (var context = new ProductDbContext())
            {
                var today = DateTime.Now; // Today's date for active discount checks
                string targetCategoryName = "Bottom"; // Category you want to filter by
                string targetCategoryGender = "M";


                var productsWithActiveDiscounts = (from p in context.Product
                                                   join d in context.Discount on p.Product_ID equals d.Product_ID
                                                   where d.Status == "Active" && d.Start_Date <= today && d.End_Date >= today
                                                   join q in context.Quantity on p.Product_ID equals q.Product_ID
                                                   join img in context.Image on q.Image_ID equals img.Image_ID
                                                   join c in context.Category on p.Category_ID equals c.Category_ID
                                                   where c.Name == targetCategoryName && c.Gender == targetCategoryGender // Filtering by category name and gender
                                                   select new
                                                   {
                                                       ProductName = p.Product_Name,
                                                       Description = p.Description,
                                                       Price = p.Price,
                                                       DiscountAmount = d.Discount_Amount,
                                                       ImagePath = img.ImagePath,
                                                       AverageRating = (from q in p.Quantities
                                                                        from ol in q.OrderLists
                                                                        from r in ol.Reviews
                                                                        select (int?)r.Rating).Average() ?? 0,
                                                       ReviewCount = (from q in p.Quantities
                                                                      from ol in q.OrderLists
                                                                      from r in ol.Reviews
                                                                      select r).Count()
                                                   }).Distinct().ToList();

                // Set the DataList data source
                dlValueBuy.DataSource = productsWithActiveDiscounts;
                dlValueBuy.DataBind();
            }
        }

        public string GenerateStars(double rating)
        {
            var fullStars = (int)rating; // Number of full stars
            var halfStar = rating % 1 != 0; // Check if there is a half star
            var noStars = 5 - fullStars - (halfStar ? 1 : 0); // Remaining empty stars
            var html = string.Empty;

            // Add full stars
            for (int i = 0; i < fullStars; i++)
            {
                html += "<i class='fas fa-star star'></i>";
            }

            // Add half star
            if (halfStar)
            {
                html += "<i class='fas fa-star-half-alt star'></i>";
            }

            // Add empty stars
            for (int i = 0; i < noStars; i++)
            {
                html += "<i class='far fa-star star'></i>";
            }

            return html;
        }
        protected void lnkTops_Click(object sender, EventArgs e)
        {
            Session["SelectedCategory"] = "MenTop";
        }

        protected void lnkBottoms_Click(object sender, EventArgs e)
        {
            Session["SelectedCategory"] = "MenBottom";
        }
    }
}