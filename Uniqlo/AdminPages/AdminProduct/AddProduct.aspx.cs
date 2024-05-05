using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Uniqlo.AdminPages.AdminProduct;

namespace Uniqlo.AdminPages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        UniqloEntities db = new UniqloEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your logic here
            // Example: Update a label or perform a database operation based on the selected value
            string selectedValue = DropDownList1.SelectedValue;
            // Example action: Label1.Text = "You selected: " + selectedValue;
        }

        protected void btnAddColor_Click(object sender, EventArgs e)
        {
            string color = newColorInput.Text.Trim();
            if (!string.IsNullOrEmpty(color))
            {
                //var colorTableControl = (ColorTableControl)LoadControl("~/AdminPages/AdminProduct/ColorTableControl.ascx");
                //colorTableControl.SetColorName(color);
                //phColorTables.Controls.Add(colorTableControl);
                //newColorInput.Text = "";
            }
            else
            {
                // Optionally, handle the error for empty color
            }
        }
    }
}