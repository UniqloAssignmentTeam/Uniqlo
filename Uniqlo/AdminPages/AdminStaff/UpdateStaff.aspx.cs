﻿using System;
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
        string cs = Global.CS;
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
                        ShowErrorAlert("Failed to load staff details.");
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
                        ShowErrorAlert("Staff not found.");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowErrorAlert("Error accessing database.");
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txtResetPassword.Text == null)
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();

                            string query = "UPDATE Staff SET Name = @Name, Email = @Email, Contact_No = @Contact_No, Gender = @Gender, Role = @Role WHERE Staff_ID = @Staff_ID";
                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.AddWithValue("@Name", staffName.Text);
                                cmd.Parameters.AddWithValue("@Email", email.Text);
                                cmd.Parameters.AddWithValue("@Contact_No", contactNumber.Text);
                                cmd.Parameters.AddWithValue("@Gender", staffGender.SelectedValue);
                                cmd.Parameters.AddWithValue("@Role", staffRole.SelectedValue);

                                cmd.Parameters.AddWithValue("@Staff_ID", int.Parse(staffID.Text));

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    // Set session variable to indicate success
                                    Session["StaffUpdated"] = true;
                                    string encryptedStaffId = EncryptionHelper.Encrypt(staffID.Text);
                                    ShowSuccessAlert("Staff details updated successfully.");
                                
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ShowErrorAlert("Failed to update staff details.");
                    }
                }
                else
                {
                    try
                    {
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
                                    ShowSuccessAlert("Staff details updated successfully.");
                                  
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ShowErrorAlert("Failed to update staff details.");
                    }
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
                ShowErrorAlert("Failed to redirect to staff home.");
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

        private void ShowErrorAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorAlert", $"Swal.fire({{ title: 'Error!', text: '{message}', icon: 'error', confirmButtonText: 'OK' }});", true);
        }

        private void ShowSuccessAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessAlert", $"Swal.fire({{ title: 'Success!', text: '{message}', icon: 'success', confirmButtonText: 'OK' }}).then((result) => {{ if (result.isConfirmed) {{ window.location.href = 'StaffHome.aspx'; }} }});", true);
        }

    }
}
