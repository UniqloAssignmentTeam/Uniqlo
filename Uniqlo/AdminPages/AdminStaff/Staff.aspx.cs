using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Xml.Linq;
using System.Data;
using System.Data.Entity;
using Uniqlo;

namespace Uniqlo.AdminPages
{
    public partial class Staff : System.Web.UI.Page
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
    }
}