using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Dynamic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Uniqlo.Pages
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                // Retrieve and bind cart data if it's supposed to be displayed
                if (Session["Cart"] != null)
                {
                    List<CartItem> cart = (List<CartItem>)Session["Cart"];
                    CartRepeater.DataSource = cart;
                    CartRepeater.DataBind();

                    // Calculate total prices as done previously
                    decimal totalPrice = cart.Sum(item => item.Item_Price);
                    lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");

                    decimal deliveryCharge = totalPrice > 150 ? 15m : 0m;
                    lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");

                    decimal grandTotal = totalPrice + deliveryCharge;
                    lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");

                }
            }
        }

       
        protected void PaymentMethod_Changed(object sender, EventArgs e)
        {
            // Cast sender to RadioButton
            var selectedPaymentMethod = (RadioButton)sender;

            // Check which radio button was selected
            if (selectedPaymentMethod == rbCreditCard)
            {
                cardInfo.Visible = true;
                Session["PaymentMethod"] = rbCreditCard.Text;

            }
            else if(selectedPaymentMethod == rbDebitCard)
            {
                cardInfo.Visible = true;
                Session["PaymentMethod"] = rbDebitCard.Text;
            }
            else if (selectedPaymentMethod == rbCash)
            {
                cardInfo.Visible = false;
                Session["PaymentMethod"] = rbCash.Text;
            }
        }

        protected void lnkPlaceOrder_Click(object sender, EventArgs e)
        {

            bool isSelected = rbCash.Checked || rbCreditCard.Checked || rbDebitCard.Checked;
            if (!isSelected)
            {
                // Handle the error
                lblError.Visible = true; // Make the label visible
                lblError.Text = "Please select a payment method.";
                return;
            }

            Card card = new Card
            {
                CardHolderName = txtCardHolderName.Text,
                CardType = ddlCardType.SelectedValue,
                CardNumber = txtCardNumber.Text,
                ExpiryDate = txtCardExpiry.Text,
                CVV = txtCardCvv.Text
            };

            Session["Card"] = card;

            // Then redirect to the confirmation page
            if(Page.IsValid)
                Response.Redirect("ConfirmPayment.aspx");
        }
    }
}