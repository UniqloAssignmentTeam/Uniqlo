using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;
using System.Drawing;

namespace Uniqlo.Pages
{
    public partial class SignUp : System.Web.UI.Page
    {
        string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //no error
                //retrieve member details
                //validate member details

                int id = 123;
                string name = txtName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text.Trim();
                string phoneNumber = txtPhone.Text;
                string gender = ddlGender.SelectedItem.Value;


                //sql statement 
                string sql = "INSERT INTO Customer(Customer_ID,Name,Gender,Contact_No,Email,Password) VALUES (@id,@Name,@Gender,@contactno,@email,@password)";

                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                 
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("email", email);
                cmd.Parameters.AddWithValue("password", password);
                cmd.Parameters.AddWithValue("contactno",phoneNumber);
                cmd.Parameters.AddWithValue("@Gender", gender);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("Login.aspx");
            

            }
        }

        protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {

        }
    }
}