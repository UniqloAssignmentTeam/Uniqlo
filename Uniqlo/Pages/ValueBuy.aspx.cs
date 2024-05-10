using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo;
using static Uniqlo.Product;
using System.Data.Entity;
using System.Security.Cryptography.X509Certificates;

namespace Uniqlo.Pages
{
    public partial class ValueBuy : System.Web.UI.Page
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
                    .Where(p => !p.IsDeleted)
                    .SelectMany( // Use SelectMany to flatten the results from the join
                        p => db.Discount
                            .Where(d => d.Product_ID == p.Product_ID // Ensure it's the right product
                                && d.Status == "Active" // Discount must be active
                                && d.Start_Date <= today // Start date must be on or before today
                                && d.End_Date >= today), // End date must be on or after today
                        (product, discount) => new {
                            Product_Name = product.Product_Name,
                            Description = product.Description,
                            Price = product.Price,
                            Image_ID = product.Quantities.Select(q => q.Image_ID).FirstOrDefault(), // Assuming at least one quantity has an image
                            AverageRating = product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                            ReviewCount = product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                            Discount_Amount = product.Price- discount.Discount_Amount
                        }
                    )
                    .ToList();

                dlValueBuy.RepeatColumns = productDetails.Count > 4 ? 4 : productDetails.Count;
                dlValueBuy.DataSource = productDetails;
                dlValueBuy.DataBind();
            }
        }
        protected void genderSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new ProductDbContext())
            {
                string selectedGender = genderSortDDL.SelectedValue;
                var today = DateTime.Today; // Use Today instead of Now for date comparison without time

                var productsQuery = context.Product
                    .Where(p => !p.IsDeleted && p.Category.Gender == selectedGender)
                    .Join(context.Discount,
                          p => p.Product_ID,
                          d => d.Product_ID,
                          (p, d) => new { p, d })
                    .Where(pd => pd.d.Status == "Active" && pd.d.Start_Date <= today && pd.d.End_Date >= today)
                    .Select(pd => new {
                        Product_Name = pd.p.Product_Name,
                        Description = pd.p.Description,
                        Price = pd.p.Price,
                        Discount_Amount = pd.p.Price - pd.d.Discount_Amount,
                        Image_ID = pd.p.Quantities.FirstOrDefault().Image.Image_ID, // Assuming each product has at least one image
                    });

                dlValueBuy.DataSource = productsQuery.Distinct().ToList();
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