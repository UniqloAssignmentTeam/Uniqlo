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
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomerData();
            }
        }

        private void BindCustomerData()
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                string query = "SELECT Name, Gender, Contact_No, Address, Email, Password FROM Customer";
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                if (dataTable.Rows.Count > 0)
                {
                    customerRepeater.DataSource = dataTable;
                    customerRepeater.DataBind();
                }
                else
                {
                    lblNoCustomerFound.Visible = true;
                }
            }
        }

        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            // Implement search logic
            BindCustomerData();
        }

        protected void genderSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Implement gender sorting logic
            BindCustomerData();
        }

        protected void statusSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Implement status sorting logic
            BindCustomerData();
        }

        protected void excelBtn_Click(object sender, EventArgs e)
        {
            // Implement export to Excel logic
        }

        protected void addCustomerBtn_Click(object sender, EventArgs e)
        {
            // Redirect to add customer page
            Response.Redirect("AddCustomer.aspx");
        }
    }
}