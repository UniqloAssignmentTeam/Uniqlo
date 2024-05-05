using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminProduct
{
    public partial class ColorTableControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            this.Visible = false; // Or use other logic to handle the deletion
        }
    }
}