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
using System.Net.NetworkInformation;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;
using static System.Net.Mime.MediaTypeNames;
using Uniqlo.AdminPages;
using Newtonsoft.Json;
using System.Web.Script.Serialization;
using System.Web.Services.Description;
using System.Collections.Specialized;

namespace Uniqlo.Pages
{
    public partial class SignUp : System.Web.UI.Page
    {


        // string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
     

       


        protected void btnSignUp_Click(object sender, EventArgs e)
        {




            /*if (fileProfilePhoto.PostedFile != null)
            {
                string strpath = Path.GetExtension(fileProfilePhoto.PostedFile.FileName);
                if (strpath != ".jpg" && strpath != ".jpeg" && strpath != ".gif" && strpath != ".png")
                {
                    lblUploadMess.Text = " This file type is not supported.Please try with another file ";
                    lblUploadMess.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblUploadMess.Text = " Profile Photo is saved ";
                    lblUploadMess.ForeColor = System.Drawing.Color.Green;
                }
            
            string fileimg = Path.GetFileName(fileProfilePhoto.PostedFile.FileName);
                fileProfilePhoto.SaveAs(Server.MapPath("~/Images/ProfilePhoto/") + fileimg);
            */
            string recaptchaResponse = Request.Form["g-recaptcha-response"];
            if (!ValidateReCaptcha(recaptchaResponse))
            {

                captchaLbl.Visible = true;
                return;

            }

            con.Open();
            SqlCommand checkEmail = new SqlCommand("SELECT Email from Customer WHERE Email='" + txtEmail.Text.ToString() + "'", con);
            SqlDataReader read = checkEmail.ExecuteReader();


            if (read.HasRows)
            {
                lblErrorMsg.Text = "Email address is already exists. Please try with different email address";
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
            else
            {
                con.Close();
                Random random = new Random();
                int myRandom = random.Next(10000000, 999999999);
                string Activation_Code = myRandom.ToString();

                con.Open();
                string insertUser = "INSERT INTO Customer(Name, Gender, Contact_No,  Email, Password) VALUES(@Name, @Gender, @ContactNo, @Email, @Password)";
                SqlCommand insertCmd = new SqlCommand(insertUser, con);
                insertCmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                insertCmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                insertCmd.Parameters.AddWithValue("@ContactNo", txtPhone.Text);
             
                insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                //insertCmd.Parameters.AddWithValue("@ProfileImage",fileProfilePhoto.FileName);
                insertCmd.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
                //MailMessage mail = new MailMessage();
                //mail.To.Add(txtEmail.Text.ToString());
                //mail.From = new MailAddress("bengyee.oh@gmail.com");
                // mail.Subject = "Thank you for registering with us.";

                // string emailBody = "";

                // emailBody += "<h1>Hello" + txtName.Text.ToString() + ",</h1>";
                //emailBody += "Click the link below to activate your account.</br>";
                //emailBody += "<p><a href='" + "https://localhost:44369/SignUp.aspx?Activation_Code=" + Activation_Code + "&Email=" + txtEmail.Text.ToString() + "'> Click here to activate</p>";
                //emailBody += "Thank you and have a nice day";

                //mail.Body = emailBody;
                //mail.IsBodyHtml = true;

                //Configure SMTP Settings
                //SmtpClient smtp = new SmtpClient();
                //smtp.Port =587 ; //25 265 587
                //smtp.EnableSsl = true;
                //smtp.UseDefaultCredentials = false;
                //smtp.Host = "smtp.gmail.com";
                //smtp.Credentials = new NetworkCredential("bengyee.oh@gmail.com", "pues rhde cdsd jxyu");
                //smtp.EnableSsl = true;

                //Send the email
                //smtp.Send(mail);

                //lblErrorMsg.Text = "You are registered successfully. Please login to your account";
                // lblErrorMsg.ForeColor = System.Drawing.Color.Red;

                con.Close();
            }
        }

        private bool ValidateReCaptcha(string recaptchaResponse)
        {
            string secretKey = "6LeFetopAAAAACQXt-A76Wr9EV_OlGTrwkFDfr2f";
            string apiUrl = "https://www.google.com/recaptcha/api/siteverify";
            WebClient client = new WebClient();
            NameValueCollection values = new NameValueCollection
    {
        { "secret", secretKey },
        { "response", recaptchaResponse }
    };

            try
            {
                byte[] response = client.UploadValues(apiUrl, values);
                string JSON = System.Text.Encoding.UTF8.GetString(response);

                var captchaResponse = new JavaScriptSerializer().Deserialize<Dictionary<string, object>>(JSON);
                if (captchaResponse.ContainsKey("success") && (bool)captchaResponse["success"])
                {
                    return true;
                }

                // Log any errors (optional but useful for troubleshooting)
                if (captchaResponse.ContainsKey("error-codes"))
                {
                    var errorCodes = (List<object>)captchaResponse["error-codes"];
                    foreach (var code in errorCodes)
                    {
                        // Log each error code
                        Console.WriteLine("reCAPTCHA error: " + code.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle exceptions from calling the reCAPTCHA service
                Console.WriteLine("Error calling reCAPTCHA: " + ex.Message);
            }

            return false;
        }

    }

}