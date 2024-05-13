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

namespace Uniqlo.Pages
{
    public partial class SignUp : System.Web.UI.Page
    {


        // string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountryDropDown();
            }
        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindStateDropDown(ddlCountry.SelectedValue);
        }
        private void BindCountryDropDown()
        {
            // Here you can fetch country list from a database or any other source
            List<string> countries = new List<string> { "Malaysia", "Singapore", "USA", "Canada", "UK", "Australia", "India" };

            ddlCountry.DataSource = countries;
            ddlCountry.DataBind();


        }

        private void BindStateDropDown(string country)
        {
            // Here you can fetch state list based on the selected country from a database or any other source
            List<string> states = new List<string>();
            if (country == "Malaysia")
            {
                states.Add("Johor");
                states.Add("Kedah");
                states.Add("Kelantan");
                states.Add("Malacca");
                states.Add("Negeri Sembilan");
                states.Add("Pahang");
                states.Add("Penang");
                states.Add("Perak");
                states.Add("Perlis");
                states.Add("Selangor");
                states.Add("Sabah");
                states.Add("Sarawak");
                states.Add("Terengganu");
                states.Add("Kuala Lumpur");
                states.Add("Labuan");
                states.Add("Putrajaya");

            }
            if (country == "USA")
            {
                states.Add("California");
                states.Add("Texas");
                states.Add("New York");
            }
            else if (country == "Canada")
            {
                states.Add("Ontario");
                states.Add("Quebec");
                states.Add("British Columbia");
            }
            else if (country == "UK")
            {
                states.Add("England");
                states.Add("Scotland");
                states.Add("Wales");
                states.Add("Northern Ireland");
            }
            else if (country == "Australia")
            {
                states.Add("New South Wales");
                states.Add("Queensland");
                states.Add("Victoria");
                states.Add("Western Australia");
            }
            else if (country == "India")
            {
                states.Add("Maharashtra");
                states.Add("Uttar Pradesh");
                states.Add("Tamil Nadu");
                states.Add("Karnataka");
            }

            ddlState.DataSource = states;
            ddlState.DataBind();
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
                    string insertUser = "INSERT INTO Customer(Name, Gender, Contact_No, Address, State, City, Postcode, Country, Email, Password) VALUES(@Name, @Gender, @ContactNo, @Address, @State, @City, @Postcode, @Country, @Email, @Password)";
                    SqlCommand insertCmd = new SqlCommand(insertUser, con);
                    insertCmd.Parameters.AddWithValue("@Name", txtName.Text.ToString());
                    insertCmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                    insertCmd.Parameters.AddWithValue("@ContactNo", txtPhone.Text);
                    insertCmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    insertCmd.Parameters.AddWithValue("@State", ddlState.Text);
                    insertCmd.Parameters.AddWithValue("@City", txtCity.Text);
                    insertCmd.Parameters.AddWithValue("@Postcode", txtPostcode.Text);
                    insertCmd.Parameters.AddWithValue("@Country", ddlCountry.Text);
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



    }

}