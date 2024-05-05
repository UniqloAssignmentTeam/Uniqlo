using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Uniqlo;

namespace Uniqlo.AdminPages
{
    public partial class AddStaff : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (var db = new StaffDbContext())
                {
                    // Calculate new Staff_ID
                    int newStaffId = db.Staffs.Any() ? db.Staffs.Max(s => s.Staff_ID) + 1 : 1;
                    string gender;
                    if (staffGender.SelectedValue == "Male")
                    {
                        gender = "M";
                    }
                    else
                    {
                        gender = "F";
                    }
                    
                    // Explicitly using Uniqlo namespace for Staff
                    Staff newStaff = new Staff
                    {


                        Staff_ID = newStaffId,
                        Name = staffName.Text, // Make sure control IDs match
                        Email = email.Text,
                        Gender = gender,
                        Contact_No = contactNumber.Text,
                        Password = password.Text,
                        Role = staffRole.SelectedValue
                      
                    };

                    db.Staffs.Add(newStaff);
                    db.SaveChanges();

                    Response.Redirect("StaffHome.aspx");
                }
            }
        }
    }
}