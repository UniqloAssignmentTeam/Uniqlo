using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages.Categories.Women
{
    public partial class yay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string selectedSize = (string)Session["selectedSize"];
            string selectedColor = (string)Session["selectedColor"];

            Label1.Text = selectedSize;
            Label2.Text = selectedColor;
        }
    }
}