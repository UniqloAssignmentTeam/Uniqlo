using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Uniqlo.Pages
{
    public partial class test : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "recaptchaError", "alert('reCAPTCHA verification failed. Please try again.');", true);
        }
        

       



        protected void btnSignUp_Click(object sender, EventArgs e)
        {
           
            string recaptchaResponse = Request.Form["recaptchaResponse"];
            bool isReCaptchaValid = ValidateReCaptcha(recaptchaResponse);


            if (!isReCaptchaValid)
            {
               
                Response.Redirect("Login.aspx");
            }
              

         



        }

        public bool ValidateReCaptcha(string response)
        {
            try
            {
                string secret = "6Lc38NgpAAAAAPvAX0lGe0Zc1plkSyMvdEaMA3sL";
                using (var client = new WebClient())
                {
                    string reply = client.DownloadString($"https://www.google.com/recaptcha/api/siteverify?secret={secret}&response={response}");
                    var captchaResponse = JsonConvert.DeserializeObject<CaptchaResponse>(reply);
                    return captchaResponse.Success;
                }
            }
            catch (WebException ex)
            {
                // Log exception or handle it appropriately
                System.Diagnostics.Debug.WriteLine("ReCAPTCHA validation error: " + ex.Message);
                return false;
            }
            catch (JsonException ex)
            {
                // Handle JSON parsing error
                System.Diagnostics.Debug.WriteLine("JSON parsing error: " + ex.Message);
                return false;
            }
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