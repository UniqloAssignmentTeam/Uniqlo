using System;
using System.Linq;
using System.Web.UI;
using static Uniqlo.Staff;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Uniqlo.AdminPages
{
    public partial class UpdateStaff : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string staffId = EncryptionHelper.Decrypt(Request.QueryString["StaffID"]);
                if (!string.IsNullOrEmpty(staffId))
                {
                    try
                    {
                        LoadStaffDetails(int.Parse(staffId));
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "loadError", "alert('Failed to load staff details.');", true);
                    }
                }
            }
        }

        private void LoadStaffDetails(int staffId)
        {
            try
            {
                using (var db = new StaffDbContext())
                {
                    var staff = db.Staff.FirstOrDefault(s => s.Staff_ID == staffId);
                    if (staff != null)
                    {
                        staffID.Text = staff.Staff_ID.ToString();
                        staffName.Text = staff.Name;
                        email.Text = staff.Email;
                        contactNumber.Text = staff.Contact_No;
                        staffGender.SelectedValue = staff.Gender;
                        staffRole.SelectedValue = staff.Role;
                       
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "notFoundError", "alert('Staff not found.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "dbError", "alert('Error accessing database.');", true);
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string cs = ConfigurationManager.ConnectionStrings["StaffDbConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();

                        string query = "UPDATE Staff SET Name = @Name, Email = @Email, Contact_No = @Contact_No, Gender = @Gender, Role = @Role, Password = @Password WHERE Staff_ID = @Staff_ID";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", staffName.Text);
                            cmd.Parameters.AddWithValue("@Email", email.Text);
                            cmd.Parameters.AddWithValue("@Contact_No", contactNumber.Text);
                            cmd.Parameters.AddWithValue("@Gender", staffGender.SelectedValue);
                            cmd.Parameters.AddWithValue("@Role", staffRole.SelectedValue);
                            cmd.Parameters.AddWithValue("@Password", Crypto.HashPassword(txtResetPassword.Text));
                            cmd.Parameters.AddWithValue("@Staff_ID", int.Parse(staffID.Text));

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                // Set session variable to indicate success
                                Session["StaffUpdated"] = true;
                                string encryptedStaffId = EncryptionHelper.Encrypt(staffID.Text);
                                Response.Redirect("UpdateStaff.aspx?StaffID=" + encryptedStaffId);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "saveError", "alert('Failed to update staff details.');", true);
                }
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("StaffHome.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "saveError", "alert('Failed to redirect to staff home.');", true);
            }
        }

        protected void ValidateStaffGender_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (staffGender.SelectedValue != "")
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
            if (staffRole.SelectedValue != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}
