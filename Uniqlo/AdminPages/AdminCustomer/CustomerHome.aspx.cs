using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminCustomer
{
    public partial class CustomerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomerData();
            }
        }

        private void BindCustomerData()
        {
            string query = "SELECT Customer_ID, Name, Email, Gender, Status, Contact_No FROM Customers";

            // Add your connection string
            string connectionString = Global.CS;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    if (dt.Rows.Count > 0)
                    {
                        customerRepeater.DataSource = dt;
                        customerRepeater.DataBind();
                    }
                    else
                    {
                        lblNoCustomerFound.Visible = true;
                    }
                }
            }
        }
    }
}