using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminCustomer
{
    public partial class UpdateCustomer : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if customer ID is passed in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["Customer_ID"]))
                {
                    //Retrieve the customer ID from the query string
                    string customerId = Request.QueryString["Customer_ID"];
                    txtCustId.Text = customerId;

                    // Call a method to bind customer data based on the customer ID
                   BindCustomerData(customerId);
                }
            }
        }

        private void BindCustomerData(string customerId)
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Customer WHERE Customer_ID = @CustomerId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtName.Text = reader["Name"].ToString();
                        ddlGender.SelectedValue = reader["Gender"].ToString();
                        txtContactNumber.Text = reader["Contact_No"].ToString();
                        txtAddress.Text = reader["Address"].ToString();
                        txtState.Text = reader["State"].ToString();
                        txtCity.Text = reader["City"].ToString();
                        txtPostcode.Text = reader["Postcode"].ToString();
                        txtCountry.Text = reader["Country"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                    }
                    reader.Close();
                }
            }
        }

        // Event handler for the UPDATE button click
        protected void updateBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Customer SET Name = @Name, Gender = @Gender, Contact_No = @Contact_No, " +
                               "Address = @Address, State = @State, City = @City, Postcode = @Postcode, " +
                               "Country = @Country, Email = @Email, password = @password WHERE Customer_ID = @Customer_Id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Contact_No", txtContactNumber.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@State", txtState.Text);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text);
                    cmd.Parameters.AddWithValue("@Postcode", txtPostcode.Text);
                    cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@password", Crypto.HashPassword(txtResetPassword.Text));
                    cmd.Parameters.AddWithValue("@Customer_Id", txtCustId.Text);
                    
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // Set a session variable to indicate that the customer was updated
                        Session["CustomerUpdated"] = "True";
                        Response.Redirect("CustomerHome.aspx    ");
                    }
                }
            }
        }

        // Event handler for the CANCEL button click
        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            // Redirect the user to the CustomerHome.aspx page
            Response.Redirect("CustomerHome.aspx");
        }
    }
}