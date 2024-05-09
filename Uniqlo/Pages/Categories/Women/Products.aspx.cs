using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;

namespace Uniqlo.Pages.Categories.Women
{
    public partial class Tops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataList();
                BindDataList2();
            }
        }


        private void BindDataList()
        {
            using (var db = new ProductDbContext())
            {
                var today = DateTime.Today;
                var productDetails = db.Product
                    .Where(p => !p.IsDeleted)
                    .GroupJoin( // Simulate a left join using GroupJoin and DefaultIfEmpty
                        db.Discount,
                        product => product.Product_ID,
                        discount => discount.Product_ID,
                        (product, discounts) => new { Product = product, Discounts = discounts.DefaultIfEmpty() }
                    )
                    .SelectMany(
                        pd => pd.Discounts,
                        (pd, discount) => new {
                            ProductName = pd.Product.Product_Name,
                            Description = pd.Product.Description,
                            Price = pd.Product.Price,
                            Image_ID = pd.Product.Quantities.Select(q => q.Image_ID).FirstOrDefault(), // Assuming at least one quantity
                            AverageRating = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                            ReviewCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                            DiscountAmount = discount != null ? discount.Discount_Amount : 0 // Handle null discounts
                        }
                    )
                    .ToList();

                dataList.DataSource = productDetails;
                dataList.DataBind();
            }
        }        
        
        private void BindDataList2()
        {
            using (var db = new ProductDbContext())
            {
                var today = DateTime.Today;
                var productDetails = db.Product
                    .Where(p => !p.IsDeleted)
                    .GroupJoin(
                        db.Discount,
                        product => product.Product_ID,
                        discount => discount.Product_ID,
                        (product, discounts) => new { Product = product, Discounts = discounts.DefaultIfEmpty() }
                    )
                    .SelectMany(
                        pd => pd.Discounts,
                        (pd, discount) => new {
                            ProductName = pd.Product.Product_Name,
                            Description = pd.Product.Description,
                            Price = pd.Product.Price,
                            Image_ID = pd.Product.Quantities.Select(q => q.Image_ID).FirstOrDefault(),
                            OrderCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).Count(), // Count of orders for each product
                            AverageRating = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                            ReviewCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                            DiscountAmount = discount != null ? discount.Discount_Amount : 0
                        }
                    )
                    .OrderByDescending(p => p.OrderCount) // Order by the number of orders, descending
                    .Take(5) // Take only the top 5 products
                    .ToList();

                dataList.DataSource = productDetails;
                dataList.DataBind();
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