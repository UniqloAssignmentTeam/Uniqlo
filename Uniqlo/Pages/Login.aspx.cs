using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Web.Security;
using System.Security.Policy;
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

                string checkUser = "SELECT Customer_ID, Name, Gender, Contact_No, Email, Password from Customer where email=@email";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                checkCmd.Parameters.AddWithValue("@email", email);
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
                        errorMSG.Text = "Invalid email or password.";
                        errorMSG.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    // User not found
                    errorMSG.Text = "Invalid email or password.";
                    errorMSG.ForeColor = System.Drawing.Color.Red;
                }

                con.Close();
            }
        }

    }

}