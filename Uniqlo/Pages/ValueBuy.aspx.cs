using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo;
using static Uniqlo.Product;

namespace Uniqlo.Pages
{
    public partial class ValueBuy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (var context = new ProductDbContext())
                {
                    var productInfo = from p in context.Product
                                      join d in context.Discount on p.Product_ID equals d.Product_ID into pd
                                      from d in pd.DefaultIfEmpty() // Handling products with no discount
                                      select new
                                      {
                                          ProductId = p.Product_ID,
                                          ProductName = p.Product_Name,
                                          Description = p.Description,
                                          Price = p.Price,
                                          DiscountAmount = d != null ? (double?)d.Discount_Amount : null
                                      };

                    var productWithRatings = from p in productInfo
                                             join r in context.Review on p.ProductId equals r.OrderList_ID into pr // Assuming a direct relationship for demonstration
                                             from r in pr.DefaultIfEmpty()
                                             select new
                                             {
                                                 p.ProductId,
                                                 p.ProductName,
                                                 p.Description,
                                                 p.Price,
                                                 p.DiscountAmount,
                                                 Rating = r != null ? (int?)r.Rating : null
                                             };

                    DataList1.DataSource = productWithRatings.ToList();
                    DataList1.DataBind();
                }
            }

        }

       


    }
}