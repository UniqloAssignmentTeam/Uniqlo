using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.Product;

namespace Uniqlo.AdminPages
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string prodID = Request.QueryString["ProdID"];
                if (!string.IsNullOrEmpty(prodID))
                {
                    LoadProdDetails(int.Parse(prodID));
                }
            }
        }

        private void LoadProdDetails(int prodID)
        {
            using (var db = new ProductDbContext())
            {
                var product = db.product.FirstOrDefault(p => p.Product_ID == prodID);
                if (product != null)
                {
                    /*
                    staffID.Text = staff.Staff_ID.ToString();
                    staffName.Text = staff.Name;
                    email.Text = staff.Email;
                    contactNumber.Text = staff.Contact_No;
                    staffGender.SelectedValue = staff.Gender;
                    staffRole.SelectedValue = staff.Role;
                    */

                }
            }
        }
    }
}