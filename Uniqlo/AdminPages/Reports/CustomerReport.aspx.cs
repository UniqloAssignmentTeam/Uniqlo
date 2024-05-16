using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Uniqlo.AdminPages
{
    public partial class CustomerReport : System.Web.UI.Page
    {
       
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        public string GetChartData()
        {
            StringBuilder chartData = new StringBuilder();
          
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string sql = @"SELECT TOP 5 c.Name, SUM(ol.Item_Price * ol.Qty) AS TotalSpending
                           FROM Customer c
                           JOIN Orders o ON c.Customer_ID = o.Customer_ID
                           JOIN OrderList ol ON o.Order_ID = ol.Order_ID
                           GROUP BY c.Name
                           ORDER BY TotalSpending DESC";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        chartData.AppendFormat("['{0}', {1}],", reader["Name"], reader["TotalSpending"]);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return chartData.ToString().TrimEnd(',');
        }
    }
}
