using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages.Categories.Men
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
                    .Where(p => !p.IsDeleted && p.Category.Gender == "M")
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

        private void BindDataList2()
        {
            using (var db = new ProductDbContext())
            {
                var today = DateTime.Today;
                var productDetails = db.Product
                    .Where(p => !p.IsDeleted && p.Category.Gender == "M")
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
                    string selectedCategory = ddlCategory.SelectedValue;
                    string selectedSort = ddlSort.SelectedValue;

                    // Start with a base query that can be modified according to filters and sorting
                    var productQuery = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "M");

                    // Apply category filter
                    if (!string.IsNullOrEmpty(selectedCategory))
                    {
                        productQuery = productQuery.Where(p => p.Category.Name == selectedCategory);
                    }

                    // Transform the products to include discount information
                    var discountQuery = productQuery
                        .GroupJoin(
                            db.Discount,
                            product => product.Product_ID,
                            discount => discount.Product_ID,
                            (product, discounts) => new { Product = product, Discounts = discounts.DefaultIfEmpty() }
                        )
                        .SelectMany(
                            pd => pd.Discounts.DefaultIfEmpty(),
                            (pd, discount) => new
                            {
                                ProductId = pd.Product.Product_ID,
                                ProductName = pd.Product.Product_Name,
                                Description = pd.Product.Description,
                                Price = pd.Product.Price,
                                Image_ID = pd.Product.Quantities.Select(q => q.Image_ID).FirstOrDefault(),
                                AverageRating = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).DefaultIfEmpty().Average(r => (int?)r.Rating) ?? 0,
                                ReviewCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                                DiscountAmount = discount != null ? discount.Discount_Amount : 0,
                                DiscountedPrice = pd.Product.Price - (discount != null ? discount.Discount_Amount : 0)
                            }
                        );

                    // Apply sorting based on price
                    if (!string.IsNullOrEmpty(selectedSort))
                    {
                        switch (selectedSort)
                        {
                            case "lowToHigh":
                                discountQuery = discountQuery.OrderBy(p => p.DiscountedPrice);
                                break;
                            case "highToLow":
                                discountQuery = discountQuery.OrderByDescending(p => p.DiscountedPrice);
                                break;
                        }
                    }

                    var productList = discountQuery.ToList();
                    dataList.DataSource = productList;
                    dataList.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when filtering products.');", true);
            }
        }




        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterProducts();
        }



        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string searchText = searchBox.Text;


                using (var db = new ProductDbContext())
                {
                    var today = DateTime.Today;
                    var productDetails = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "M" && p.Product_Name.Contains(searchText))
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
                        ).ToList();


                    dataList.DataSource = productDetails;
                    dataList.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while searching the product name.');", true);

            }
        }
    }
}
