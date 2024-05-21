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
            string customerId = txtCustId.Text;
            string name = txtName.Text;
            string gender = ddlGender.SelectedValue;
            string contactNumber = txtContactNumber.Text;
            string address = txtAddress.Text;
            string state = txtState.Text;
            string city = txtCity.Text;
            string postcode = txtPostcode.Text;
            string country = txtCountry.Text;
            string email = txtEmail.Text;
            string newPassword = txtResetPassword.Text;
            string password = string.IsNullOrEmpty(newPassword) ? null : Crypto.HashPassword(newPassword);

            // Check if the provided email or contact number already exist for other customers
            if (IsDuplicateEmailForOtherCustomers(email, customerId))
            {
                // Add SweetAlert notification for duplicate email
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire({ title: 'Error', text: 'The email is already used by another customer.', icon: 'error', confirmButtonText: 'OK' });", true);
                return; // Stop further execution
            }

            if (IsDuplicateContactNumberForOtherCustomers(contactNumber, customerId))
            {
                // Add SweetAlert notification for duplicate contact number
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire({ title: 'Error', text: 'The contact number is already used by another customer.', icon: 'error', confirmButtonText: 'OK' });", true);
                return; // Stop further execution
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Customer SET Name = @Name, Gender = @Gender, Contact_No = @Contact_No, " +
                               "Address = @Address, State = @State, City = @City, Postcode = @Postcode, " +
                               "Country = @Country, Email = @Email";

                if (!string.IsNullOrEmpty(password))
                {
                    query += ", Password = @Password";
                }

                query += " WHERE Customer_ID = @Customer_Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Contact_No", contactNumber);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@State", state);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@Postcode", postcode);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Customer_Id", customerId);

                    if (!string.IsNullOrEmpty(password))
                    {
                        cmd.Parameters.AddWithValue("@Password", password);
                    }

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        string script = @"
                                        Swal.fire({
                                            title: 'Success!',
                                            text: 'Customer updated successfully!',
                                            icon: 'success',
                                            confirmButtonText: 'OK'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location.href = 'CustomerHome.aspx';
                                            }
                                        });";

                        Session["CustomerUpdated"] = "True";

                        ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
                       
                    }
                }
            }
        }

        // Method to check if the provided email already exists for other customers
        private bool IsDuplicateEmailForOtherCustomers(string email, string customerId)
        {
            string query = "SELECT COUNT(*) FROM Customer WHERE Email = @Email AND Customer_ID != @Customer_Id";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Customer_Id", customerId);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0; // If count > 0, email already exists for other customers
                }
            }
        }

        // Method to check if the provided contact number already exists for other customers
        private bool IsDuplicateContactNumberForOtherCustomers(string contactNumber, string customerId)
        {
            string query = "SELECT COUNT(*) FROM Customer WHERE Contact_No = @Contact_No AND Customer_ID != @Customer_Id";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Contact_No", contactNumber);
                    command.Parameters.AddWithValue("@Customer_Id", customerId);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0; // If count > 0, contact number already exists for other customers
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