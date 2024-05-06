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
                List<CartItem> cart = new List<CartItem>
                {
                new CartItem { ProductId = 1, ProductName = "T-Shirt", Price = 19.99m, Quantity = 2 },
                new CartItem { ProductId = 2, ProductName = "Jeans", Price = 39.99m, Quantity = 1 },
                new CartItem { ProductId = 3, ProductName = "Jacket", Price = 99.99m, Quantity = 1 },
                new CartItem { ProductId = 4, ProductName = "Sneakers", Price = 59.99m, Quantity = 1 }
                };


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