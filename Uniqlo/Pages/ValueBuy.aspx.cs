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
                var today = DateTime.Now;

                var productsWithDiscounts = (from p in context.Product
                                             join d in context.Discount on p.Product_ID equals d.Product_ID
                                             where d.Status == "Active" && d.Start_Date <= DateTime.Now && d.End_Date >= DateTime.Now
                                             join q in context.Quantity on p.Product_ID equals q.Product_ID
                                             join img in context.Image on q.Image_ID equals img.Image_ID
                                             select new
                                             {
                                                 ProductName = p.Product_Name,
                                                 Description = p.Description,
                                                 Price = p.Price,
                                                 DiscountAmount = d.Discount_Amount,
                                                 ImagePath = img.ImagePath,
                                                 ImageID = img.Image_ID
                                             }).Distinct().ToList();

                var results = productsWithDiscounts.ToList();
                DataList1.DataSource = results;
                DataList1.DataBind();
            }
        }
    }
}