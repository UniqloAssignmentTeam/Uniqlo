using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Org.BouncyCastle.Crypto.Generators;

namespace Uniqlo.AdminPages
{
    public partial class adminLogin : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Unauthorized"] != null) { 
                if ((bool)Session["Unauthorized"])
                {
                //pop up You are not authorized to view this page
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                string connectionString = cs;
                string query = "SELECT Password, Role FROM Staff WHERE Email = @Email";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            string hashedPasswordFromDB = reader["Password"].ToString();
                            string role = reader["Role"].ToString();

                            if (Crypto.VerifyPassword(password, hashedPasswordFromDB))
                            {
                                // Staff login successful
                                Session["StaffRole"] = role;
                                Response.Redirect("Dashboard.aspx");
                            }
                            else
                            {
                                // Incorrect password
                                lblError.Text = "Invalid email or password. Please try again.";
                                lblError.Visible = true;
                            }
                        }
                        else
                        {
                            // No user found with the given email
                            lblError.Text = "Invalid email or password. Please try again.";
                            lblError.Visible = true;
                        }
                    }
                }
            }
            else
            {
                // Email or password field is empty
                lblError.Text = "Please enter both email and password.";
                lblError.Visible = true;
            }
        }
    }
}