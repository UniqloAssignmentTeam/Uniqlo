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
                    new CartItem { Quantity_Id = 1, Name = "T-shirt", Price = 15.99m, Color = "Red", Size = "M", Item_Price = 15.99m, Quantity = 2 },
                    new CartItem { Quantity_Id = 2, Name = "Jeans", Price = 40.50m, Color = "Blue", Size = "32", Item_Price = 40.50m, Quantity = 1 },
                    new CartItem { Quantity_Id = 3, Name = "Sneakers", Price = 60.00m, Color = "White", Size = "9", Item_Price = 60.00m, Quantity = 1 },
                    new CartItem { Quantity_Id = 4, Name = "Jacket", Price = 99.95m, Color = "Black", Size = "L", Item_Price = 99.95m, Quantity = 1 },
                    new CartItem { Quantity_Id = 5, Name = "Cap", Price = 12.99m, Color = "Green", Size = "One size", Item_Price = 12.99m, Quantity = 3 }
                };

                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();

                decimal totalPrice = cart.Sum(item => item.Item_Price * item.Quantity);
                lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");

                decimal deliveryCharge = 0m;
                if (totalPrice > 150)
                {
                    deliveryCharge = 15m;
                }
                lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");

                decimal grandTotal = totalPrice + deliveryCharge;
                lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");

                bool found = false;

                string sql = "SELECT * FROM Customer WHERE Customer_Id =@Customer_Id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Customer_Id", "1");
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtName.Text = (string)dr["Name"];
                    txtEmail.Text = (string)dr["Email"];
                    txtContact.Text = (string)dr["Contact_No"];

                }

            }
        }

        
    }
}