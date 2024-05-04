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


namespace Uniqlo.AdminPages
{
    public partial class Staff : System.Web.UI.Page
    {
        string cs = Global.CS;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            LoadingDataToRepeater();



        }

        private void LoadingDataToRepeater()
        {
          

      
            SqlConnection con = new SqlConnection(cs);

            
            try
            {
                con.Open();
      
                string sql = "SELECT Staff_ID, Name, Gender, Contact_No, Email, Password, Role from Staff";
           
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader reader= cmd.ExecuteReader();

                staffRepeater.DataSource = reader;
                staffRepeater.DataBind();

                con.Close();
            }catch (Exception ex)
            {
                Response.Write(ex.Message);
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