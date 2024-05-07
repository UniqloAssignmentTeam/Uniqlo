using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class Delivery : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //dummy cart
                List<CartItem> cart = new List<CartItem>
                {
                    new CartItem { Quantity_Id = 1, Name = "T-shirt", Price = 15.99m, Color = "Red", Size = "M", Quantity = 2 },
                    new CartItem { Quantity_Id = 2, Name = "Jeans", Price = 40.50m, Color = "Blue", Size = "32", Quantity = 1 },
                    new CartItem { Quantity_Id = 3, Name = "Sneakers", Price = 60.00m, Color = "White", Size = "9", Quantity = 1 },
                    new CartItem { Quantity_Id = 4, Name = "Jacket", Price = 99.95m, Color = "Black", Size = "L", Quantity = 1 },
                    new CartItem { Quantity_Id = 5, Name = "Cap", Price = 12.99m, Color = "Green", Size = "One size", Quantity = 3 }
                };
                
                Session["Cart"] = cart;

                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();

                decimal totalPrice = cart.Sum(item => item.Item_Price);
                lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");
                Session["TotalPrice"] = totalPrice;

                decimal deliveryCharge = totalPrice > 150 ? 0m : 15m;
                lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");
                Session["ShippingFee"] = deliveryCharge;

                decimal grandTotal = totalPrice + deliveryCharge;
                lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");
                Session["GrandTotal"]= grandTotal;  
              
                //dummy sesssion
                Session["Customer_Id"] = "1";


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
        }

        protected void btnProceedToPayment_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Address shippingAddress = new Address
                {
                    Country = txtCountry.Text,
                    AddressLine = txtAddress.Text,
                    Postcode = txtPostcode.Text,
                    State = txtState.Text,
                    City = txtCity.Text
                };
                Session["ShippingAddress"] = shippingAddress;
                Session["DeliveryNote"] = txtDelivery_Note.Text;
                Response.Redirect("Payment.aspx");
            }
        }

    }
}