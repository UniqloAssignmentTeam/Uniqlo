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
    public partial class Products : System.Web.UI.Page
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
            try
            {
                using (var db = new ProductDbContext())
                {
                    var today = DateTime.Today;
                    var productDetails = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "W")
                        .GroupJoin( // Simulate a left join using GroupJoin and DefaultIfEmpty
                            db.Discount,
                            product => product.Product_ID,
                            discount => discount.Product_ID,
                            (product, discounts) => new { Product = product, Discounts = discounts.DefaultIfEmpty() }
                        )
                        .SelectMany(
                            pd => pd.Discounts,
                            (pd, discount) => new {
                                ProductId = pd.Product.Product_ID,
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

                    dataList.RepeatColumns = productDetails.Count > 4 ? 4 : productDetails.Count;
                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Retrieving product.');", true);
            }

        }

        private void BindDataList2()
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var today = DateTime.Today;
                    var productDetails = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "W")
                        .GroupJoin(
                            db.Discount,
                            product => product.Product_ID,
                            discount => discount.Product_ID,
                            (product, discounts) => new { Product = product, Discounts = discounts.DefaultIfEmpty() }
                        )
                        .SelectMany(
                            pd => pd.Discounts,
                            (pd, discount) => new {
                                ProductId = pd.Product.Product_ID,
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
                        .Take(4) // Take only the top 5 products
                        .ToList();

                    carouselDataList.DataSource = productDetails;
                    carouselDataList.DataBind();


                    carouselDataList.RepeatColumns = productDetails.Count > 4 ? 4 : productDetails.Count;
                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Retrieving product.');", true);
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

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterProducts();
        }



        private void FilterProducts()
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    string selectedSort = ddlSort.SelectedValue;
                    var today = DateTime.Today;

                    // Filter products that have an active discount
                    var productQuery = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "W")
                        .Join(
                            db.Discount.Where(d => d.Status == "Active" && d.Start_Date <= today && d.End_Date >= today),
                            product => product.Product_ID,
                            discount => discount.Product_ID,
                            (product, discount) => new {
                                ProductId = product.Product_ID,
                                ProductName = product.Product_Name,
                                Description = product.Description,
                                Price = product.Price,
                                DiscountAmount = discount.Discount_Amount,
                                Image_ID = product.Quantities.Select(q => q.Image_ID).FirstOrDefault(),
                                AverageRating = product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                                ReviewCount = product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count()
                            }
                        );

                    // Apply sorting based on user selection
                    switch (selectedSort)
                    {
                        case "lowToHigh":
                            productQuery = productQuery.OrderBy(p => p.DiscountAmount);
                            break;
                        case "highToLow":
                            productQuery = productQuery.OrderByDescending(p => p.DiscountAmount);
                            break;
                    }

                    var productList = productQuery.ToList();
                    dataList.DataSource = productList;
                    dataList.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when filtering products.');", true);
            }
        }


    }
}