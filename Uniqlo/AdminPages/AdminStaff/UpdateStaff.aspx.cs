using System;
using System.Linq;
using System.Web.UI;
using static Uniqlo.Staff;
using System.Web.UI.WebControls;

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
                    using (var db = new StaffDbContext())
                    {
                        int staffId = int.Parse(staffID.Text);
                        var staff = db.Staff.FirstOrDefault(s => s.Staff_ID == staffId);
                        if (staff != null)
                        {
                            staff.Name = staffName.Text;
                            staff.Email = email.Text;
                            staff.Contact_No = contactNumber.Text;
                            staff.Gender = staffGender.SelectedValue;
                            staff.Role = staffRole.SelectedValue;
                            staff.Password = txtResetPassword.Text;
                            db.SaveChanges();

                            // Set session variable to indicate success
                            Session["StaffUpdated"] = true;
                            string encryptedStaffId = EncryptionHelper.Encrypt(staffId.ToString());
                            Response.Redirect("UpdateStaff.aspx?StaffID=" + encryptedStaffId); // Refresh page to trigger SweetAlert
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "updateError", "alert('Staff not found.');", true);
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
