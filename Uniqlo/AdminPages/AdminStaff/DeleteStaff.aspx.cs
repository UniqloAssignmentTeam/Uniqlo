using System;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.UI;
using static Uniqlo.Staff;

namespace Uniqlo.AdminPages.AdminStaff
{
    public partial class DeleteStaff : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                staffIdlbl.Text = EncryptionHelper.Decrypt(Request.QueryString["StaffId"]);
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffHome.aspx");
        }

        protected void btnCheckCode_Click(object sender, EventArgs e)
        {
            string inputCode = txtVerificationCode.Text;
            string storedCode = Session["VerificationCode"] as string;

            if (string.IsNullOrWhiteSpace(storedCode))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Session expired. Please resend the verification code.";
                return;
            }

            if (inputCode == storedCode)
            {
                int staffId;
                if (!int.TryParse(EncryptionHelper.Decrypt(Request.QueryString["StaffId"]), out staffId))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid staff ID.";
                    return;
                }

                try
                {
                    using (var db = new StaffDbContext())
                    {
                        var staff = db.Staff.Find(staffId);
                        if (staff != null)
                        {
                            db.Staff.Remove(staff);
                            db.SaveChanges();
                            // Show SweetAlert on success
                            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessAlert", "showSuccessAlert();", true);
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Staff not found.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Failed to remove staff. Please try again. Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid verification code. Please try again.";
                txtVerificationCode.Text = ""; // Optionally clear the incorrect code
            }
        }

        protected void btnSendCode_Click(object sender, EventArgs e)
        {
            DateTime? lastRequestTime = Session["LastRequestTime"] as DateTime?;
            if (lastRequestTime != null && (DateTime.Now - lastRequestTime.Value).TotalSeconds < 30)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please wait for 30 seconds before requesting a new code.";
                return;
            }

            string userEmailText = userEmail.Text;
            string verificationCode = GenerateVerificationCode();
            Session["VerificationCode"] = verificationCode;
            Session["LastRequestTime"] = DateTime.Now; // Update the last request time

            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    Credentials = new System.Net.NetworkCredential("jefferozf-pm21@student.tarc.edu.my", "030116070949")
                };

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("jefferozf-pm21@student.tarc.edu.my");
                    mail.To.Add(userEmailText);
                    mail.Subject = "Your Uniqlo Verification Code";
                    mail.IsBodyHtml = true;

                    string logoUrl = Server.MapPath("/Images/Uniqlo-Logos.png");
                    string emailBody = $@"
                                        <!DOCTYPE html>
                                        <html>
                                        <head>
                                            <style>
                                                .container {{
                                                    font-family: Arial, sans-serif;
                                                    color: #333;
                                                    line-height: 1.6;
                                                    max-width: 600px;
                                                    margin: auto;
                                                    border: 1px solid #ddd;
                                                    border-radius: 10px;
                                                    overflow: hidden;
                                                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                                                }}
                                                .header {{
                                                    background-color: #f8f8f8;
                                                    padding: 20px;
                                                    text-align: center;
                                                    border-bottom: 1px solid #ddd;
                                                }}
                                                .header p {{
                                                    margin: 0;
                                                    font-size: 16px;
                                                }}
                                                .content {{
                                                    padding: 20px;
                                                }}
                                                .content p {{
                                                    margin: 0 0 10px;
                                                }}
                                                .content .verification-code {{
                                                    font-size: 24px;
                                                    font-weight: bold;
                                                    color: #d9534f;
                                                    text-align: center;
                                                    margin: 20px 0;
                                                }}
                                                .content img {{
                                                    max-width: 100%;
                                                    height: auto;
                                                    border: 1px solid #ddd;
                                                    border-radius: 5px;
                                                    margin: 10px 0;
                                                }}
                                                .thank-you {{
                                                    margin: 20px 0;
                                                    text-align: center;
                                                }}
                                                .thank-you img {{
                                                    width: 100px;
                                                    height: auto;
                                                    margin-top: 10px;
                                                }}
                                                .footer {{
                                                    background-color: #f8f8f8;
                                                    padding: 10px;
                                                    text-align: center;
                                                    border-top: 1px solid #ddd;
                                                    font-size: 12px;
                                                    color: #777;
                                                }}
                                            </style>
                                        </head>
                                        <body>
                                            <div class='container'>
                                                <div class='content'>
                                                    <p>Dear Customer,</p>
                                                    <p>Thank you for choosing Uniqlo. Please use the following verification code to complete your registration:</p>
                                                    <p class='verification-code'>{verificationCode}</p>
                                                    <p>If you did not request this code, please ignore this email.</p>
                                                    <div class='thank-you'>
                                                        <p>Thank you for supporting our company!</p>
                                                        <img src='cid:companyLogo' alt='Company Logo' />
                                                    </div>
                                                </div>
                                                <div class='footer'>
                                                    <p>&copy; 2024 Uniqlo. All rights reserved.</p>
                                                </div>
                                            </div>
                                        </body>
                                        </html>";


                    mail.Body = emailBody;

                    // Embed Uniqlo logo
                    LinkedResource companyLogo = new LinkedResource(logoUrl, "image/png")
                    {
                        ContentId = "companyLogo"
                    };
                    AlternateView avHtml = AlternateView.CreateAlternateViewFromString(mail.Body, null, MediaTypeNames.Text.Html);
                    avHtml.LinkedResources.Add(companyLogo);
                    mail.AlternateViews.Add(avHtml);

                    smtp.Send(mail);
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Verification code sent to your email.";
                btnRemoveStaff.Enabled = true;
                txtVerificationCode.Visible = true; // Show the verification code TextBox

                // Start the countdown timer on the client-side
                ScriptManager.RegisterStartupScript(this, GetType(), "startCountdown", "startCountdown(30);", true);
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Failed to send verification code. Please enter a valid email.";
            }
        }

        private string GenerateVerificationCode()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }
    }
}
