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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
            }
        }



        private void BindDataList()
        {
            using (var db = new ProductDbContext())
            {
                var today = DateTime.Today;

                var productDetails = db.Product
                    .Where(p => !p.IsDeleted && p.Category.Gender == "M")
                    .SelectMany( // Use SelectMany to flatten the results from the join
                        p => db.Discount
                            .Where(d => d.Product_ID == p.Product_ID // Ensure it's the right product
                                && d.Status == "Active" // Discount must be active
                                && d.Start_Date <= today // Start date must be on or before today
                                && d.End_Date >= today), // End date must be on or after today
                        (product, discount) => new {
                            Product_Id = product.Product_ID,
                            Product_Name = product.Product_Name,
                            Description = product.Description,
                            Price = product.Price,
                            Image_ID = product.Quantities.Select(q => q.Image_ID).FirstOrDefault(), // Assuming at least one quantity has an image
                            AverageRating = product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                            ReviewCount = product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                            Discount_Amount = product.Price - discount.Discount_Amount
                        }
                    )
                    .Take(4)
                    .ToList();

                dlValueBuy.RepeatColumns = productDetails.Count > 4 ? 4 : productDetails.Count;

                dlValueBuy.DataSource = productDetails;
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
    }
}