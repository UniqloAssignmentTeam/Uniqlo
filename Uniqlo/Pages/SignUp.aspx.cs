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
using static System.Net.Mime.MediaTypeNames;
using Uniqlo.AdminPages;
using Newtonsoft.Json;
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


            string recaptchaResponse = Request.Form["recaptchaResponse"];
            bool isReCaptchaValid = ValidateReCaptcha(recaptchaResponse);
            if (isReCaptchaValid)
            {
                if (fileProfilePhoto.PostedFile != null)
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
                    string insertUser = "INSERT INTO Customer(Name, Gender, Contact_No, Address, State, City, Postcode, Country, Email, Password,Activation_Code, is_active) VALUES(@Name, @Gender, @ContactNo, @Address, @State, @City, @Postcode, @Country, @Email, @Password, @ Activation_Code, @is_active)";
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
                    insertCmd.Parameters.AddWithValue("@Activation_Code", Activation_Code);
                    insertCmd.Parameters.AddWithValue("@is_active", 0);
                    insertCmd.ExecuteNonQuery();

                    MailMessage mail = new MailMessage();
                    mail.To.Add(txtEmail.Text.ToString());
                    mail.From = new MailAddress("bengyee.oh@gmail.com");
                    mail.Subject = "Thank you for registering with us.";

                    string emailBody = "";

                    emailBody += "<h1>Hello" + txtName.Text.ToString() + ",</h1>";
                    emailBody += "Click the link below to activate your account.</br>";
                    emailBody += "<p><a href='" + "https://localhost:44369/SignUp.aspx?Activation_Code=" + Activation_Code + "&Email=" + txtEmail.Text.ToString() + "'> Click here to activate</p>";
                    emailBody += "Thank you and have a nice day";

                    mail.Body = emailBody;
                    mail.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Port =587 ; //25 265 587
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Credentials = new System.Net.NetworkCredential("bengyee.oh@gmail.com", "pues rhde cdsd jxyu");
                    smtp.EnableSsl = true;
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
            else
            {


            }


        }

        private bool ValidateReCaptcha(string recaptchaResponse)
        {
            string secretKey = "6LcQr9gpAAAAABBoiRNDyntbjoJqz0rQxSE5t1re"; // Replace it with your secret key
            string apiUrl = "https://www.google.com/recaptcha/api/siteverify";
            string result = string.Empty;

            using (var client = new WebClient())
            {
                var parameters = new NameValueCollection();
                parameters.Add("secret", secretKey);
                parameters.Add("response", recaptchaResponse);

                var response = client.UploadValues(apiUrl, "POST", parameters);
                result = System.Text.Encoding.UTF8.GetString(response);
            }

            var obj = JsonConvert.DeserializeObject<dynamic>(result);
            return obj.success;
        }

    }

    }

