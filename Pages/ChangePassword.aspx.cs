using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["UniqloEntities"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Customer WHERE Email ='" + txtEmail.Text + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    dr.Read();
                    string email = dr["Email"].ToString();
                    string password = dr["Password"].ToString();
                    StringBuilder sb = new StringBuilder();
                    sb.AppendLine("Email" + email);
                    sb.AppendLine("Password" + password);
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("bengyee.oh@gmail.com", "abc123");
                    MailMessage msg = new MailMessage();
                    msg.To.Add("bengyee.oh@gmail.com");
                    msg.From = new MailAddress("Uniqlo");
                    msg.Body = sb.ToString();
                    client.Send(msg);
                    lblMsg.Text = "Your password has been sent to registered email";
                }
                else
                {
                    lblMsg.Text = "Invalid Email Address";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "ERROR:" + ex.Message.ToString();
            }
            {

            }


        }


    }
}