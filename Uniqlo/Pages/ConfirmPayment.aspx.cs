using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class ConfirmPayment : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtPaidBy.Text = (string)Session["PaymentMethod"];
                if (Session["PaymentMethod"].Equals("Credit Card") || Session["PaymentMethod"].Equals("Debit Card"))
                {
                    pnlCardDetails.Visible = true;
                    Card card = new Card();
                    card = (Card)Session["Card"];

                    txtCardHolderName.Text = card.CardHolderName;
                    txtCardType.Text = card.CardType;
                    txtCardNumber.Text = card.CardNumber;
                    txtExpiryDate.Text = card.ExpiryDate; 
                    txtCVV.Text = card.CVV;

                }
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

                if (Session["Customer_Id"] != null)
                {
                    string sql = "SELECT * FROM Customer WHERE Customer_Id =@Customer_Id";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@Customer_Id", Session["Customer_Id"]);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtName.Text = (string)dr["Name"];
                        txtEmail.Text = (string)dr["Email"];
                        txtContact.Text = (string)dr["Contact_No"];
                    }
                }

                if (Session["ShippingAddress"] != null)
                {
                    Address shippingAddress = new Address();
                    shippingAddress = (Address)Session["ShippingAddress"];
                    txtCountry.Text = shippingAddress.Country;
                    txtAddress.Text = shippingAddress.AddressLine;
                    txtPostcode.Text = shippingAddress.Postcode;
                    txtState.Text = shippingAddress.State;
                    txtCity.Text = shippingAddress.City;
                }

                if (Session["DeliveryNote"] != null)
                {
                    txtDeliveryInstruction.Text = (string)Session["DeliveryNote"];
                }

            }
        }
    }
}