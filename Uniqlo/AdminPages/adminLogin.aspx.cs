using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class adminLogin : System.Web.UI.Page
    {
        string cs = Global.CS;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            if (Page.IsValid)
            {
                //string email = txtEmail.Text;
                //string password = txtPassword.Text.Trim();

                //check user
                string checkUser = "SELECT* FROM Staff WHERE email=@email and password=@password";
                SqlCommand checkCmd = new SqlCommand(checkUser, con);
                //checkCmd.Parameters.AddWithValue("@email", email);
                //checkCmd.Parameters.AddWithValue("@password", password);
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