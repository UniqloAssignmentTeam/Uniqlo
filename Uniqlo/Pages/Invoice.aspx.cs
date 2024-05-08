using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class Invoice : System.Web.UI.Page
    {
        string connectionString = Global.CS;
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

            int paymentId = Convert.ToInt32(Session["PaymentId"]);
            lblPaymentId.Text = paymentId.ToString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Payment_DateTime FROM Payment WHERE Payment_Id = @Payment_Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Payment_Id", paymentId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblDateTime.Text = Convert.ToDateTime(reader["Payment_DateTime"]).ToString("yyyy-MM-dd HH:mm:ss");
                        }
                    }
                }
            }

            int customerId = Convert.ToInt32(Session["Customer_Id"]);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Name, Email, Contact_No FROM Customer WHERE Customer_Id = @CustomerId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblCustomerName.Text = reader["Name"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblEmail2.Text = reader["Email"].ToString();
                            lblContactNo.Text = reader["Contact_No"].ToString();
                        }
                    }
                }
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // This query joins the required tables to directly fetch address details using Payment_Id
                string query = @"
        SELECT sa.Address, sa.City, sa.State, sa.PostCode, sa.Country 
        FROM Payment p
        JOIN Delivery d ON p.Delivery_Id = d.Delivery_Id
        JOIN Shipping_Address sa ON d.Address_Id = sa.Address_Id
        WHERE p.Payment_Id = @Payment_Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Payment_Id", paymentId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblAddress.Text = $"{reader["Address"].ToString()}, {reader["City"].ToString()}, {reader["State"].ToString()}, {reader["PostCode"].ToString()}, {reader["Country"].ToString()}";
                        }
                        else
                        {
                            // Handle the case where no data is returned
                            lblAddress.Text = "Address not found.";
                        }
                    }
                }
            }


        }
    }
}