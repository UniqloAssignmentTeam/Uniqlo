using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("admin");
            Response.Redirect("~/AdminPages/adminLogin.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}