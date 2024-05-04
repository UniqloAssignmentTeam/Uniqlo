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
            if (!IsPostBack)
            {
                BindRepeater();
            }

        }

        private void BindRepeater()
        {
            using (var db = new UniqloEntities())
            {
                IQueryable<Staff> query = db.Staff;
                // Optionally, apply filters, sorting, etc.
                staffRepeater.DataSource = query.ToList();
                staffRepeater.DataBind();
            }
        }
        protected void addStaffBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddStaff.aspx");
        }

        protected void staffRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}