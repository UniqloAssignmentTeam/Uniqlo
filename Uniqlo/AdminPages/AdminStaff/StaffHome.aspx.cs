using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using static Uniqlo.Staff;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace Uniqlo.AdminPages.AdminStaff
{

    public partial class StaffHome : System.Web.UI.Page
    {

        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindRepeater();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to load page. Please try again.');", true);
            }

        }
        protected void addStaffBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("StaffAdd.aspx");
            }catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to redirect to the add page. Please try again.');", true);
            }
           
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                var button = sender as Button;
                var item = button.NamingContainer as RepeaterItem;
                var staffIdLabel = item.FindControl("staffID") as Label;
                if (staffIdLabel != null)
                {
                    Session["StaffID"] = staffIdLabel.Text;
                    Response.Redirect("UpdateStaff.aspx");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to redirect to the update page. Please try again.');", true);
            }
        }

        protected void btnRemoveStaff_Click(object sender, EventArgs e)
        {
            try
            {
                int staffId = int.Parse(hiddenStaffId.Value);
                using (var db = new StaffDbContext())
                {
                    var staff = db.Staff.Find(staffId);
                    if (staff != null)
                    {
                        db.Staff.Remove(staff);
                        db.SaveChanges();
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }


            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to remove staff. Please try again.');", true);
            }
        }

        private void BindRepeater()
        {
            try
            {
                using (var db = new StaffDbContext())
                {
                    var staffList = db.Staff.ToList();
                    staffRepeater.DataSource = staffList;
                    staffRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to load staff details page. Please try again.');", true);
            }
        }

        protected void roleSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFilteredStaffList();
        }

        protected void genderSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFilteredStaffList();
        }

        private void BindFilteredStaffList()
        {
            try
            {
                using (var db = new StaffDbContext())
                {
                    string selectedRole = roleSortDDL.SelectedValue;
                    string selectedGender = genderSortDDL.SelectedValue;

                    IQueryable<Staff> query = db.Staff;

                    if (!string.IsNullOrEmpty(selectedRole) && selectedRole != "All Roles")
                    {
                        query = query.Where(s => s.Role == selectedRole);
                    }

                    if (!string.IsNullOrEmpty(selectedGender) && selectedGender != "All Genders")
                    {
                        query = query.Where(s => s.Gender == selectedGender);
                    }

                    var staffList = query.ToList();
                    staffRepeater.DataSource = staffList;
                    staffRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "scriptError", "alert('Failed to load filtered staff list. Please try again.');", true);
            }
        }

        protected void excelBtn_Click(object sender, EventArgs e)
        {
            ExportStaffsToExcel();
        }

        private void ExportStaffsToExcel()
        {
            string connectionString = Global.CS; // Ensure this is correctly defined
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();  // Ensure the connection is opened before executing the command

                StringBuilder query = new StringBuilder("SELECT Staff_ID, Name, Gender, Contact_No, Email, Role FROM Staff");
                List<SqlParameter> parameters = new List<SqlParameter>();

                string genderFilter = genderSortDDL.SelectedValue;
                string roleFilter = roleSortDDL.SelectedValue;
                bool hasGenderFilter = !string.IsNullOrEmpty(genderFilter) && genderFilter != "All Genders";
                bool hasRoleFilter = !string.IsNullOrEmpty(roleFilter) && roleFilter != "All Roles";

                if (hasGenderFilter || hasRoleFilter)
                {
                    query.Append(" WHERE");
                    if (hasGenderFilter)
                    {
                        query.Append(" Gender = @Gender");
                        parameters.Add(new SqlParameter("@Gender", genderFilter));
                    }

                    if (hasRoleFilter)
                    {
                        if (hasGenderFilter)
                        {
                            query.Append(" AND");
                        }
                        query.Append(" Role = @Role");
                        parameters.Add(new SqlParameter("@Role", roleFilter));
                    }
                }

                using (SqlCommand cmd = new SqlCommand(query.ToString(), conn))
                {
                    cmd.Parameters.AddRange(parameters.ToArray());
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        using (ExcelPackage pck = new ExcelPackage())
                        {
                            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Staff");
                            ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                            var memoryStream = new MemoryStream();
                            pck.SaveAs(memoryStream);
                            memoryStream.Position = 0;

                            HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Staff.xlsx");
                            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                            HttpContext.Current.Response.End();
                        }
                    }
                }
            }
        }
        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            try
            {


                string searchText = searchBox.Text;
                var results = SearchDatabase(searchText);  // Call the method that performs the search
                staffRepeater.DataSource = results;
                staffRepeater.DataBind();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while searching the product name.');", true);

            }
        }

        public List<Staff> SearchDatabase(string searchText)
        {

            using (var db = new StaffDbContext())
            {
                var query = db.Staff
                                .Where(s => s.Name.Contains(searchText))
                                .ToList();
                return query;
            }
        }


        protected void ValidateStaffGender_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Ensure that a product other than the default "--Select Product--" is chosen
            if (genderSortDDL.SelectedValue != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void ValidateStaffRole_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Ensure that a product other than the default "--Select Product--" is chosen
            if (roleSortDDL.SelectedValue != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnSendCode_Click(object sender, EventArgs e)
        {
            // Use .Text to get the text from an asp:TextBox
            string userEmailText = userEmail.Text; // Correct property access

            string verificationCode = GenerateVerificationCode(); // Generate a random verification code
            Session["VerificationCode"] = verificationCode; // Store the code in session to verify later

            try
            {
                SmtpClient smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com", // Set your SMTP server here
                    Port = 587,
                    EnableSsl = true,
                    Credentials = new System.Net.NetworkCredential("jefferooi123@gmail.com", "1234567890pl,okm")
                };

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("jefferooi123@gmail.com");
                    mail.To.Add(userEmailText); // Now using the correct text
                    mail.Subject = "Verification Code";
                    mail.Body = "Your verification code is: " + verificationCode;
                    smtp.Send(mail);
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Verification code sent to your email.');", true);
                btnRemoveStaff.Enabled = true; // Enable the remove button after code is sent
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('Failed to send verification code. Error: " + ex.Message + "');", true);
            }
        }

        private string GenerateVerificationCode()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString(); // Generate a 6-digit code
        }







    }
}