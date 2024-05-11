using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //dummy session
            Session["selectedProduct"] = new Product
            {
                Product_ID = 1,
                Category_ID = 1,
                Product_Name = "Dummy Product",
                Description = "This is a dummy product for testing purposes.",
                Price = 9.99,
                IsDeleted = false
            }; ;

        }
    }
}