using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using crypto;

namespace Uniqlo.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            if (Page.IsValid)
            {
                string email = txtEmail.Text;
                string password = txtPassword.Text.Trim();

                string checkUser = "SELECT Customer_ID, Name, Gender, Contact_No, Email, Password from Customer where email=@Email";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                checkCmd.Parameters.AddWithValue("@Email", email);
                SqlDataReader read = checkCmd.ExecuteReader();

                if (read.Read())
                {
                    string hashedPasswordFromDB = read["Password"].ToString();

                    if (Crypto.VerifyPassword(hashedPasswordFromDB, password))
                    {
                        // Passwords match, login successful
                        Session["Customer_ID"] = read["Customer_ID"].ToString();
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        // Passwords do not match
                        DisplayAlert("Invalid email or password.", "error");
                    }
                }
                else
                {
                    // User not found
                    DisplayAlert("Invalid email or password.", "error");
                }

                con.Close();
            }
        }

        private void DisplayAlert(string message, string type)
        {
            string script = $"Swal.fire({{ title: '{message}', icon: '{type}' }});";
            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }
    }
}
