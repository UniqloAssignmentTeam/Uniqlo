using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminDiscount
{
    public partial class Discount1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ListItem item1 = new ListItem("Item 1", "1");
                item1.Attributes["style"] = "color: red; font-weight: bold;";

                ListItem item2 = new ListItem("Item 2", "2");
                item2.Attributes["style"] = "color: blue; font-style: italic;";

                DropDownList1.Items.Add(item1);
                DropDownList1.Items.Add(item2);
            }

        }

        protected void BtnDiscountAdd(object sender, EventArgs e)
        {
            Response.Redirect("addDiscount.aspx");
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}