using System;
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

            Session["CustomerAdded"] = "True";
            Response.Redirect("CustomerHome.aspx");
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHome.aspx");
        }
    }
}