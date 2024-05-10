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
                using (var db = new StaffDbContext())
                {
                    
                    
                   

                    // Explicitly using Uniqlo namespace for Staff
                    Staff newStaff = new Staff
                    {


                       
                        Name = staffName.Text, // Make sure control IDs match
                        Email = email.Text,
                        Gender = staffGender.SelectedValue,
                        Contact_No = contactNumber.Text,
                        Password = password.Text,
                        Role = staffRole.SelectedValue

                    };

                    db.Staff.Add(newStaff);
                    db.SaveChanges();

                    Response.Redirect("StaffHome.aspx");
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string name = args.Value;

           




        }
    }
}