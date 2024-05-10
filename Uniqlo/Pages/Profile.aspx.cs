using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlTypes;


namespace Uniqlo.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = "Welcome " + Session["Customer_ID"] + Session["Name"];
        }
        


            protected void btnEditProfile_Click(object sender, EventArgs e)
            {
                Response.Redirect("EditProfile.aspx");
            }

            protected void btnBack_Click(object sender, EventArgs e)
            {
                Response.Redirect("Profile.aspx");
            }

            protected void btnChgPass_Click(object sender, EventArgs e)
            {
                Response.Redirect("ChangePassword.aspx");
            }
    }
}

    
