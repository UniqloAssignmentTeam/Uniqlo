﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminCustomer
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addBtn_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string gender = ddlGender.SelectedValue;
            string contactNumber = txtContactNumber.Text;
            string address = txtAddress.Text;
            string state = txtState.Text;
            string city = txtCity.Text;
            string postcode = txtPostcode.Text;
            string country = txtCountry.Text;
            string email = txtEmail.Text;
            string password = Crypto.HashPassword(txtPassword.Text);

            string connectionString = cs;

            // Check if the email or contact number already exists in the database
            if (IsDuplicateEmail(email))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire({ title: 'Error', text: 'The email is already used by another customer.', icon: 'error', confirmButtonText: 'OK' });", true);
                return;
            }
            if (IsDuplicateContactNumber(contactNumber))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire({ title: 'Error', text: 'The contact number is already used by another customer.', icon: 'error', confirmButtonText: 'OK' });", true);
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Customer (Name, Gender, Contact_No, Address, State, City, Postcode, Country, Email, Password) VALUES (@Name, @Gender, @Contact_No, @Address, @State, @City, @Postcode, @Country, @Email, @Password)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Gender", gender);
                    command.Parameters.AddWithValue("@Contact_No", contactNumber);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@State", state);
                    command.Parameters.AddWithValue("@City", city);
                    command.Parameters.AddWithValue("@Postcode", postcode);
                    command.Parameters.AddWithValue("@Country", country);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            string script = @"
                    Swal.fire({
                        title: 'Success!',
                        text: 'Customer added successfully!',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = 'CustomerHome.aspx';
                        }
                    });";


            Session["CustomerAdded"] = "True";
            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);


        }

        // Method to check if the email already exists in the database
        private bool IsDuplicateEmail(string email)
        {
            string query = "SELECT COUNT(*) FROM Customer WHERE Email = @Email";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0; // If count > 0, email already exists
                }
            }
        }

        // Method to check if the contact number already exists in the database
        private bool IsDuplicateContactNumber(string contactNumber)
        {
            string query = "SELECT COUNT(*) FROM Customer WHERE Contact_No = @Contact_No";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Contact_No", contactNumber);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0; // If count > 0, contact number already exists
                }
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHome.aspx");
        }
    }
}