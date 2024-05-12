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
using Newtonsoft.Json;

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
            string captchaResponse = Request.Form["g-recaptcha-response"];

            if (ValidateCaptcha(captchaResponse))
            {
                con.Open();
            SqlCommand checkEmail = new SqlCommand("SELECT Email from Customer WHERE Email='" + txtEmail.Text.ToString() + "'",con);
            SqlDataReader read = checkEmail.ExecuteReader();


            if (read.HasRows)
            {
                lblErrorMsg.Text = "Email address is already exists. Please try with different email address";
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                con.Close();
            }
            else
            {
                con.Close() ;
                Random random = new Random();
                int myRandom = random.Next(10000000, 999999999);
                string Activation_Code = myRandom.ToString();

                con.Open();
                string insertUser = "INSERT INTO Customer(Name, Gender, Contact_No, Address, State, City, Postcode, Country, Email, Password) VALUES(@Name, @Gender, @ContactNo, @Address, @State, @City, @Postcode, @Country, @Email, @Password)";
                SqlCommand insertCmd = new SqlCommand(insertUser, con);
                insertCmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                insertCmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                insertCmd.Parameters.AddWithValue("@ContactNo", txtPhone.Text);
                insertCmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                insertCmd.Parameters.AddWithValue("@State", txtState.Text);
                insertCmd.Parameters.AddWithValue("@City", txtCity.Text);
                insertCmd.Parameters.AddWithValue("@Postcode", txtPostcode.Text);
                insertCmd.Parameters.AddWithValue("@Country", txtCountry.Text);
                insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                //insertCmd.Parameters.AddWithValue("@ProfileImage", fileProfilePhoto);
                //insertCmd.Parameters.AddWithValue("@Activation_Code", Activation_Code);
                //insertCmd.Parameters.AddWithValue("@is_active", 0);
                insertCmd.ExecuteNonQuery();

                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text.ToString());
                mail.From = new MailAddress("bengyee.oh@gmail.com");
                mail.Subject = "Thank you for registering with us.";

                string emailBody = "";

                emailBody += "<h1>Hello"+ txtName.Text.ToString() + ",</h1>";
                emailBody += "Click the link below to activate your account.</br>";
                emailBody += "<p><a href='"+ "https://localhost:44369/SignUp.aspx?Activation_Code=" + Activation_Code+ "&Email=" + txtEmail.Text.ToString()+ "'> Click here to activate</p>";
                emailBody += "Thank you and have a nice day";

                mail.Body = emailBody;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587; //25 265
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential("bengyee.oh@gmail.com","Abc031221");
                smtp.Send(mail);

                lblErrorMsg.Text = "You are registered successfully. Please check your email Inbox/Spam folder for activation code";
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                con.Close();
                }
            }
            else
            {
                // CAPTCHA validation failed, show an alert
                ClientScript.RegisterStartupScript(this.GetType(), "recaptchaError", "alert('reCAPTCHA verification failed. Please try again.');", true);
            }


        }

        public bool ValidateCaptcha(string response)
        {
            string secret = "6Lc38NgpAAAAAPvAX0lGe0Zc1plkSyMvdEaMA3sL";
            var client = new WebClient();
            var reply =
                client.DownloadString(
                    $"https://www.google.com/recaptcha/api/siteverify?secret={secret}&response={response}");

            var captchaResponse = JsonConvert.DeserializeObject<CaptchaResponse>(reply);

            return captchaResponse.Success;
        }

        public class CaptchaResponse
        {
            [JsonProperty("success")]
            public bool Success { get; set; }

            [JsonProperty("error-codes")]
            public List<string> ErrorCodes { get; set; }
        }

    }

    }

