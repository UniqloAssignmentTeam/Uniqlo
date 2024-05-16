using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;

namespace Uniqlo.AdminPages.Reports
{
    public partial class SalesReport : System.Web.UI.Page
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
                string sql = @"SELECT FORMAT(p.Payment_DateTime, 'MMM yyyy') AS Month, SUM(ol.Qty) AS TotalItemsSold
                               FROM OrderList ol
                               JOIN Orders o ON ol.Order_ID = o.Order_ID
                               JOIN Payment p ON o.Order_ID = p.Order_ID
                               WHERE p.Payment_Status = 'Paid' AND p.Payment_DateTime >= DATEADD(MONTH, -4, GETDATE())
                               GROUP BY FORMAT(p.Payment_DateTime, 'MMM yyyy')
                               ORDER BY MIN(p.Payment_DateTime);";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        chartData.AppendFormat("['{0}', {1}],", reader["Month"], reader["TotalItemsSold"]);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return chartData.ToString().TrimEnd(',');
        }


    }
}

