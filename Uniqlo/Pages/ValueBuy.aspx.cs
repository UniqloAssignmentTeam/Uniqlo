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
            using (var context = new ProductDbContext())
            {
                // Using DateTime.Now outside the LINQ query to avoid multiple calls which might give slight differences during execution.
                var today = DateTime.Now;

                // Fetching products with active discounts
                var productsWithActiveDiscounts = (from p in context.Product
                                                   join d in context.Discount on p.Product_ID equals d.Product_ID
                                                   where d.Status == "Active" && d.Start_Date <= today && d.End_Date >= today
                                                   join q in context.Quantity on p.Product_ID equals q.Product_ID
                                                   join img in context.Image on q.Image_ID equals img.Image_ID
                                                   select new
                                                   {
                                                       Product_Name = p.Product_Name, // Changed to ProductName to match common naming conventions
                                                       Description = p.Description,
                                                       Price = p.Price,
                                                       Discount_Amount = d.Discount_Amount,
                                                       Image_ID=img.Image_ID,
                                                       AverageRating = (from q in p.Quantities
                                                                        from ol in q.OrderLists
                                                                        from r in ol.Reviews
                                                                        select (int?)r.Rating).Average() ?? 0,
                                                       ReviewCount = (from q in p.Quantities
                                                                      from ol in q.OrderLists
                                                                      from r in ol.Reviews
                                                                      select r).Count()


                                                   }).Distinct().ToList();

                // Setting the DataList data source
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

    }
}