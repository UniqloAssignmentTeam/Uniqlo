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
            int prodId = int.Parse(hiddenProductId.Value);  // Retrieve the Staff ID from hidden field
            using (var db = new ProductDbContext())
            {
                var product = db.Product.Find(prodId);
                if (product != null)
                {
                    db.Product.Remove(product);
                    db.SaveChanges();
                    Response.Redirect(Request.RawUrl);  // Refresh the page to reflect the changes
                }
            }
        }

        private void BindRepeater()
        {
            using (var db = new ProductDbContext())
            {
                var productList = db.Product.Include(p => p.Category).ToList();

                prodRepeater.DataSource = productList;
                prodRepeater.DataBind();
            }
        }
    }
}