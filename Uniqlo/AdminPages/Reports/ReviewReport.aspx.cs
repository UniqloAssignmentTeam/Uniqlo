using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class ReviewReport : System.Web.UI.Page
    {
        string cs=Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetChartData()
        {
            StringBuilder chartData = new StringBuilder();
          
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string sql = @"SELECT TOP 5 p.Product_Name, COUNT(r.Review_ID) AS ReviewCount
                           FROM Review r
                           JOIN OrderList ol ON r.OrderList_ID = ol.OrderList_ID
                           JOIN Quantity q ON ol.Quantity_ID = q.Quantity_ID
                           JOIN Product p ON q.Product_ID = p.Product_ID
                           GROUP BY p.Product_Name
                           ORDER BY ReviewCount DESC";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        chartData.AppendFormat("['{0}', {1}],", reader["Product_Name"], reader["ReviewCount"]);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return chartData.ToString().TrimEnd(',');
        }
    }
}