using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string errorMessage = "";

            // Check reCAPTCHA
            string recaptchaResponse = Request.Form["g-recaptcha-response"];
            if (!ValidateReCaptcha(recaptchaResponse))
            {
                errorMessage += "Captcha Invalid. Please Try Again.<br/>";
            }

            // Check if email exists
            con.Open();
            SqlCommand checkEmail = new SqlCommand("SELECT Email FROM Customer WHERE Email=@Email", con);
            checkEmail.Parameters.AddWithValue("@Email", txtEmail.Text);
            SqlDataReader read = checkEmail.ExecuteReader();

            if (read.HasRows)
            {
                errorMessage += "Email address already exists. Please try with a different email address.<br/>";
            }
            con.Close();

            // Perform field validations
            if (!Page.IsValid)
            {
                foreach (BaseValidator validator in Page.Validators)
                {
                    if (!validator.IsValid)
                    {
                        errorMessage += validator.ErrorMessage + "<br/>";
                    }
                }
            }

            // If there are errors, show them in a SweetAlert
            if (!string.IsNullOrEmpty(errorMessage))
            {
                ShowSweetAlert("Error", errorMessage, "error");
                return;
            }

            // If no errors, proceed with sign up
            try
            {
                Random random = new Random();
                int myRandom = random.Next(10000000, 999999999);
                string Activation_Code = myRandom.ToString();

                con.Open();
                string insertUser = "INSERT INTO Customer (Name, Gender, Contact_No, Email, Password) VALUES (@Name, @Gender, @ContactNo, @Email, @Password)";
                SqlCommand insertCmd = new SqlCommand(insertUser, con);
                insertCmd.Parameters.AddWithValue("@Name", txtName.Text);
                insertCmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                insertCmd.Parameters.AddWithValue("@ContactNo", txtPhone.Text);
                insertCmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                insertCmd.ExecuteNonQuery();
                con.Close();

                ShowSweetAlert("Success", "Sign up successful! Please login to your account.", "success", "Login.aspx");
            }
            catch (Exception ex)
            {
                ShowSweetAlert("Error", "An error occurred: " + ex.Message, "error");
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

        private void ShowSweetAlert(string title, string message, string icon, string redirectUrl = "")
        {
            string script = $"Swal.fire({{ title: '{title}', html: '{message}', icon: '{icon}' }}).then((result) => {{ if (result.isConfirmed && '{redirectUrl}' !== '') {{ window.location.href = '{redirectUrl}'; }} }});";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowSweetAlert", script, true);
        }
    }
}
