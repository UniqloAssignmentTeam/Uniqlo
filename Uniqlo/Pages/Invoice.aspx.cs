using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cart"] != null)
                {
                    List<CartItem> cart = (List<CartItem>)Session["Cart"];
                    rptCartItems.DataSource = cart;
                    rptCartItems.DataBind();
                    
                }

                decimal totalPrice = (decimal)Session["TotalPrice"];
                lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");

                decimal deliveryCharge = (decimal)Session["ShippingFee"];
                lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");

                decimal grandTotal = (decimal)Session["GrandTotal"];
                lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");
            }
        }
    }
}