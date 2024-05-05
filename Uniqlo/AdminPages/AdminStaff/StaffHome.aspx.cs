using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminStaff
{
    public partial class StaffHome : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        protected void addStaffBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddStaff.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            var item = button.NamingContainer as RepeaterItem;
            var staffIdLabel = item.FindControl("staffID") as Label;
            Session["StaffID"] = staffIdLabel.Text;  // Store staff ID in session
            Response.Redirect("UpdateStaff.aspx");
        }

        protected void btnRemoveStaff_Click(object sender, EventArgs e)
        {
            int staffId = int.Parse(hiddenStaffId.Value);  // Retrieve the Staff ID from hidden field
            using (var db = new StaffDbContext())
            {
                var staff = db.Staff.Find(staffId);
                if (staff != null)
                {
                    db.Staff.Remove(staff);
                    db.SaveChanges();
                    Response.Redirect(Request.RawUrl);  // Refresh the page to reflect the changes
                }
            }
        }
    }
}