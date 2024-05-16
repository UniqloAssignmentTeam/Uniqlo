using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Staff;

namespace Uniqlo.AdminPages.AdminStaff
{
    public partial class StaffAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string hashedPassword = Crypto.HashPassword(password.Text);

                // Define your connection string
                string connectionString = Global.CS;

                // Define your SQL query with parameters
                string query = @"INSERT INTO Staff (Name, Email, Gender, Contact_No, Password, Role)
                         VALUES (@Name, @Email, @Gender, @Contact_No, @Password, @Role)";

                // Create and open a SqlConnection
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SqlCommand with the query and connection
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the command
                        command.Parameters.AddWithValue("@Name", staffName.Text);
                        command.Parameters.AddWithValue("@Email", email.Text);
                        command.Parameters.AddWithValue("@Gender", staffGender.SelectedValue);
                        command.Parameters.AddWithValue("@Contact_No", contactNumber.Text);
                        command.Parameters.AddWithValue("@Password", hashedPassword);
                        command.Parameters.AddWithValue("@Role", staffRole.SelectedValue);

                        // Open the connection
                        connection.Open();

                        // Execute the command
                        int rowsAffected = command.ExecuteNonQuery();

                        // Close the connection
                        connection.Close();

                        // Check if the insert was successful
                        if (rowsAffected > 0)
                        {
                            // Set session variable to indicate success
                            Session["StaffAdded"] = true;
                            Response.Redirect("StaffAdd.aspx"); // Refresh page to trigger SweetAlert
                        }
                        else
                        {
                           
                        }
                    }
                }
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/AdminPages/AdminStaff/StaffHome.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred while redirecting to staff home.');", true);
            }
        }
    }
}
