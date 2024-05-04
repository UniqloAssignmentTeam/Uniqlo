using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class UpdateStaff : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get Staff_ID from query string
                string staffId = Request.QueryString["StaffID"];
                if (!string.IsNullOrEmpty(staffId))
                {
                    LoadStaffDetails(int.Parse(staffId));
                }
            }
        }

        private void LoadStaffDetails(int staffId)
        {

            string sql = "SELECT * from STUDENT Where Staff_ID=@staffid";

            //step 1.3: sql connection
            SqlConnection con = new SqlConnection(cs);


            //step 2:sql command
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

        

            dr.Close();
            con.Close();



        }

    }
}