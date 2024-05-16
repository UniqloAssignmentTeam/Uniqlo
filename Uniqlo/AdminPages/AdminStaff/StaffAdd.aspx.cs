using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Staff;

namespace Uniqlo.AdminPages.AdminStaff
{
    public partial class StaffAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string hashedPassword = Crypto.HashPassword(password.Text);
                
                    using (var db = new StaffDbContext())
                    {
                        Staff newStaff = new Staff
                        {
                            Name = staffName.Text,
                            Email = email.Text,
                            Gender = staffGender.SelectedValue,
                            Contact_No = contactNumber.Text,
                            Password = hashedPassword,
                            Role = staffRole.SelectedValue
                        };

                        db.Staff.Add(newStaff);
                        db.SaveChanges();

                        // Set session variable to indicate success
                        Session["StaffAdded"] = true;
                        Response.Redirect("StaffAdd.aspx"); // Refresh page to trigger SweetAlert
                    }
                
                
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/AdminPages/AdminStaff/StaffHome.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred while redirecting to staff home.');", true);
            }
        }
    }
}
