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
            string recaptchaResponse = Request.Form["g-recaptcha-response"];

            if (!ValidateReCaptcha(recaptchaResponse))
            {
                captchaLbl.Visible = true;
                return;
            }

            try
            {
                con.Open();
                SqlCommand checkEmail = new SqlCommand("SELECT Email FROM Customer WHERE Email = @Email", con);
                checkEmail.Parameters.AddWithValue("@Email", txtEmail.Text);
                SqlDataReader read = checkEmail.ExecuteReader();

                if (read.HasRows)
                {
                    lblErrorMsg.Text = "Email address already exists. Please try with a different email address.";
                    lblErrorMsg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    read.Close(); // Close the reader before executing another command
                    Random random = new Random();
                    int myRandom = random.Next(10000000, 999999999);
                    string Activation_Code = myRandom.ToString();

                    string insertUser = "INSERT INTO Customer (Name, Gender, Contact_No, Email, Password) VALUES (@Name, @Gender, @ContactNo, @Email, @Password)";
                    SqlCommand insertCmd = new SqlCommand(insertUser, con);
                    insertCmd.Parameters.AddWithValue("@Name", txtName.Text);
                    insertCmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    insertCmd.Parameters.AddWithValue("@ContactNo", txtPhone.Text);
                    insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    insertCmd.ExecuteNonQuery();

                  
                    Response.Redirect("/Pages/Login.aspx");
                }
            }
            catch (Exception ex)
            {
                // Log the error (optional)
                lblErrorMsg.Text = "An error occurred: " + ex.Message;
                lblErrorMsg.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
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
                        Console.WriteLine("reCAPTCHA error: " + code.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error calling reCAPTCHA: " + ex.Message);
            }

            return false;
        }

        private void ShowSuccessMessage()
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
        }


    }

}