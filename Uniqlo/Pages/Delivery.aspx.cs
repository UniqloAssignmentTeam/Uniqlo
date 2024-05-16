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
            //Deny not registered customer
            if (Session["Customer_Id"] == null)
            {
                // Register SweetAlert script to show when no Customer_Id is found
                string showAlertScript = @"
            Swal.fire({
                title: 'Not Logged In',
                text: 'You have not logged in. Please log in to continue.',
                icon: 'warning',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'Login.aspx';
                }
            });
        ";
                ClientScript.RegisterStartupScript(this.GetType(), "showAlert", showAlertScript, true);

                return; // Stop further execution of this method
            }


            if (!Page.IsPostBack)
            {
               
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                
                Session["Cart"] = cart;

                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();  

                decimal totalPrice = cart.Sum(item => item.Item_Price);
                lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");
                Session["TotalPrice"] = totalPrice;

                decimal deliveryCharge = totalPrice > 150 ? 0m : 20m;
                lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");
                Session["ShippingFee"] = deliveryCharge;

                decimal grandTotal = totalPrice + deliveryCharge;
                lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");
                Session["GrandTotal"]= grandTotal;  

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

                    // Check if the address is not null before populating the text boxes
                        txtAddress.Text = dr["Address"].ToString();
                        if (txtAddress.Text.Equals("NULL"))
                            txtAddress.Text = "";
 
                        txtState.Text = dr["State"].ToString();
                    if (txtState.Text.Equals("NULL"))
                        txtState.Text = "";

                    txtCity.Text = dr["City"].ToString();
                    if (txtCity.Text.Equals("NULL"))
                        txtCity.Text = "";

                    txtPostcode.Text = dr["Postcode"].ToString();
                    if (txtPostcode.Text.Equals("NULL"))
                        txtPostcode.Text = "";

                    txtCountry.Text = dr["Country"].ToString();
                    if (txtCountry.Text.Equals("NULL"))
                        txtCountry.Text = "";
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