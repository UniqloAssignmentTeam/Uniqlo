using System;
using System.Net.Mail;
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
                staffIdlbl.Text = Request.QueryString["StaffId"];
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
                if (!int.TryParse(Request.QueryString["StaffId"], out staffId))
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
                    mail.Subject = "Verification Code";
                    mail.Body = "Your verification code is: " + verificationCode;
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
