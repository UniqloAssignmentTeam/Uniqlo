using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.Reports
{
    public partial class ReportHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["StaffRole"].Equals("Manager"))
            {
                // Redirect to adminLogin.aspx if the session role is invalid or not set
                Response.Redirect("../adminLogin.aspx");
                Session["Unauthorized"] = true;
            }
        }
    }
}