using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages.Categories.Men
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkTops_Click(object sender, EventArgs e)
        {
            Session["SelectedCategory"] = "MenTop";
        }

        protected void lnkBottoms_Click(object sender, EventArgs e)
        {
            Session["SelectedCategory"] = "MenBottom";
        }
    }
}