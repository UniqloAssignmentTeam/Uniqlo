using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace Uniqlo.AdminPages
{
    public partial class adminLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);
        int i;


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

                //check user
                string checkUser = "SELECT* FROM Staff WHERE email=@email and password=@password";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                checkCmd.Parameters.AddWithValue("@email", email);
                checkCmd.Parameters.AddWithValue("@password", password);
                SqlDataReader read = checkCmd.ExecuteReader();

                if (read.Read())
                {

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                 
                    con.Close();
                }


            }

        }
    }

}