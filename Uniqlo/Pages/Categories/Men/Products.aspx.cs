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
            try
            {
                using (var db = new ProductDbContext())
                {
                    var today = DateTime.Today;
                    var productDetails = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "M")
                        .GroupJoin(
                            db.Discount.Where(d => d.Start_Date <= today && d.End_Date >= today && d.Status == "Active"),
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
                                AverageRating = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                                ReviewCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                                DiscountAmount = discount != null ? discount.Discount_Amount : 0
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
                string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'An error occurred when retrieving product details.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });";
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", script, true);
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
                        .Where(p => !p.IsDeleted && p.Category.Gender == "M")
                        .GroupJoin(
                            db.Discount.Where(d => d.Start_Date <= today && d.End_Date >= today && d.Status == "Active"),
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
                                OrderCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).Count(),
                                AverageRating = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                                ReviewCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                                DiscountAmount = discount != null ? discount.Discount_Amount : 0
                            }
                        )
                        .OrderByDescending(p => p.OrderCount)
                        .Take(4)
                        .ToList();

                    carouselDataList.DataSource = productDetails;
                    carouselDataList.DataBind();
                    carouselDataList.RepeatColumns = productDetails.Count > 4 ? 4 : productDetails.Count;
                }
            }
            catch (Exception ex)
            {
                string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'An error occurred when retrieving product details.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });";
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", script, true);
            }
        }

        public string GenerateStars(double rating)
        {
            var fullStars = (int)rating;
            var halfStar = rating % 1 != 0;
            var noStars = 5 - fullStars - (halfStar ? 1 : 0);
            var html = string.Empty;

            for (int i = 0; i < fullStars; i++)
            {
                html += "<i class='fas fa-star star'></i>";
            }

            if (halfStar)
            {
                html += "<i class='fas fa-star-half-alt star'></i>";
            }

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
                var today = DateTime.Today;
                using (var db = new ProductDbContext())
                {
                    string selectedCategory = ddlCategory.SelectedValue;
                    string selectedSort = ddlSort.SelectedValue;

                    var productQuery = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "M");

                    if (!string.IsNullOrEmpty(selectedCategory))
                    {
                        productQuery = productQuery.Where(p => p.Category.Name == selectedCategory);
                    }

                    var discountQuery = productQuery
                        .GroupJoin(
                            db.Discount.Where(d => d.Start_Date <= today && d.End_Date >= today && d.Status == "Active"),
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
                string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'An error occurred when filtering products.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });";
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", script, true);
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
                var today = DateTime.Today;

                using (var db = new ProductDbContext())
                {
                    var productDetails = db.Product
                        .Where(p => !p.IsDeleted && p.Category.Gender == "M" && p.Product_Name.Contains(searchText))
                        .GroupJoin(
                            db.Discount.Where(d => d.Start_Date <= today && d.End_Date >= today && d.Status == "Active"),
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
                                AverageRating = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                                ReviewCount = pd.Product.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                                DiscountAmount = discount != null ? discount.Discount_Amount : 0
                            }
                        ).ToList();

                    dataList.DataSource = productDetails;
                    dataList.DataBind();
                }
            }
            catch (Exception ex)
            {
                string script = @"
                Swal.fire({
                    title: 'Error',
                    text: 'An error occurred while searching the product name.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });";
                ScriptManager.RegisterStartupScript(this, GetType(), "error", script, true);
            }
        }
    }
}
