using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;
using System.Data.Entity;


namespace Uniqlo.AdminPages.AdminProduct
{
    public partial class ProductHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               BindRepeater();
            }
        }
       

        protected void addProdBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void btnRemoveProduct_Click(object sender, EventArgs e)
        {
            int prodId = int.Parse(hiddenProductId.Value);

            using (var db = new ProductDbContext())
            {
                var product = db.Product.Find(prodId);
                if (product != null)
                {
                    product.IsDeleted = Convert.ToBoolean(1);
                    

                    var discounts = db.Discount.Where(d => d.Product_ID == prodId).ToList();
                    foreach (var discount in discounts)
                    {
                        discount.Status = "Inactive";
                    }

                    db.SaveChanges();

                    // Redirect to refresh the page and reflect changes
                    Response.Redirect(Request.RawUrl);
                }
            }
        }




        private void BindRepeater()
        {
            using (var db = new ProductDbContext())
            {
                var productList = db.Product.Include(p => p.Category).Where(p => !p.IsDeleted).ToList();

                prodRepeater.DataSource = productList;
                prodRepeater.DataBind();
            }
        }


    }
}