using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo
{
    public partial class Uniqlo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer_ID"] == null || Session["Email"] == null)
            {
                
                hlLogin.Visible = true;
                hlLogout.Visible = false;
                hlProfile.Visible = false;
                
              
                
            }
            else
            {
                hlLogin.Visible = false;
                hlLogout.Visible = true;
                hlProfile.Visible=true;
            }
        }

    }
}