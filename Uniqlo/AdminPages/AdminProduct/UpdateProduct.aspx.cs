using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.Product;
using System.Data.Entity;

namespace Uniqlo.AdminPages
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    BindFormView();
                }
            }

        }

        private void BindFormView()
        {
            using (var db = new ProductDbContext())
            {
                var productList = db.Product.Include(p => p.Category).ToList();

                formView.DataSource = productList;
                formView.DataBind();
            }
        }




        protected void updateButton_Click(object sender, EventArgs e)
        {

        }
    }
}