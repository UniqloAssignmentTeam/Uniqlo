using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.Staff;

namespace Uniqlo.AdminPages
{
    public partial class UpdateStaff : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string staffId = Request.QueryString["StaffID"];
                if (!string.IsNullOrEmpty(staffId))
                {
                    try
                    {
                        LoadStaffDetails(int.Parse(staffId));
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "loadError", "alert('Failed to load staff details.');", true);
                        // Log the exception message: ex.Message
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
                        password.Text = staff.Password;
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
                // Log the exception message: ex.Message
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

                            db.SaveChanges();
                           
                                Response.Redirect("StaffHome.aspx");
                           
                           
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
                    // Log the exception message: ex.Message
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
            // Ensure that a product other than the default "--Select Product--" is chosen
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
            // Ensure that a product other than the default "--Select Product--" is chosen
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