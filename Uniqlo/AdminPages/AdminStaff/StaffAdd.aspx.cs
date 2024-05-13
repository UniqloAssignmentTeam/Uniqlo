using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Uniqlo;
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
                try
                {
                    using (var db = new StaffDbContext())
                    {
                        Staff newStaff = new Staff
                        {
                            Name = staffName.Text,
                            Email = email.Text,
                            Gender = staffGender.SelectedValue,
                            Contact_No = contactNumber.Text,
                            Password = password.Text, // Consider hashing this before storing
                            Role = staffRole.SelectedValue
                        };

                        db.Staff.Add(newStaff);
                        db.SaveChanges();

                        // Redirect only on successful add
                        Response.Redirect("StaffHome.aspx");
                    }
                }
                catch (Exception ex)
                {
                    
                    // Optionally display error message on the page
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred while adding new staff.');", true);
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string name = args.Value;
            if (string.IsNullOrWhiteSpace(name) || name.Any(char.IsDigit))
            {
                args.IsValid = false;
               
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/AdminPages/AdminStaff/StaffHome.aspx");
            }catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred while redirecting to staff home.');", true);
            }
           
        }
    }

}