using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Uniqlo.Pages
{
    public partial class EditProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            try
            {
                SaveUserProfile();
                // Ensure the script is registered at the correct point in the page lifecycle
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showSuccessMessage", "showSuccessMessage('Profile updated successfully!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showErrorMessage", $"showErrorMessage('Error updating profile: {ex.Message}');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Navigate back to the previous page
            Response.Redirect("/Pages/Profile.aspx"); // Change to the actual previous page URL
        }

        private void LoadUserProfile()
        {
            string sessionValue = Session["Customer_ID"] as string;

            if (int.TryParse(sessionValue, out int custId))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString;
                string query = "SELECT Name, Email, Contact_No, Address, Postcode, City, State, Country FROM Customer WHERE Customer_ID = @Customer_ID";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Customer_ID", custId); // Replace with the actual customer ID

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            txtFullName.Text = reader["Name"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtPhone.Text = reader["Contact_No"].ToString();
                            txtAddress.Text = reader["Address"].ToString();
                            txtPostcode.Text = reader["Postcode"].ToString();
                            txtCity.Text = reader["City"].ToString();
                            txtState.Text = reader["State"].ToString();
                            txtCountry.Text = reader["Country"].ToString();
                        }
                    }
                }
            }
        }

        private void SaveUserProfile()
        {
            string sessionValue = Session["Customer_ID"] as string;

            if (int.TryParse(sessionValue, out int custId))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString;
                string query = "UPDATE Customer SET Name = @Name, Email = @Email, Contact_No = @Contact_No, Address = @Address, Postcode = @Postcode, City = @City, State = @State, Country = @Country WHERE Customer_ID = @Customer_ID";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtFullName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Contact_No", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@Postcode", txtPostcode.Text);
                        cmd.Parameters.AddWithValue("@City", txtCity.Text);
                        cmd.Parameters.AddWithValue("@State", txtState.Text);
                        cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                        cmd.Parameters.AddWithValue("@Customer_ID", custId); // Replace with the actual customer ID

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "SuccessAlert", "Swal.fire({ icon: 'success', title: 'Profile Updated', text: 'Your profile has been updated successfully!' });", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ErrorAlert", "Swal.fire({ icon: 'error', title: 'Error', text: 'Invalid customer ID.' });", true);
            }
        }
    }
}
