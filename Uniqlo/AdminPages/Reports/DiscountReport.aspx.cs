using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.Reports
{
    public partial class DiscountReport : System.Web.UI.Page
    {string cs=Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetChartData()
        {
            StringBuilder chartData = new StringBuilder();
     
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string sql = @"SELECT TOP 5 p.Product_Name, d.Discount_Amount
                           FROM Discount d
                           JOIN Product p ON d.Product_ID = p.Product_ID
                           ORDER BY d.Discount_Amount DESC";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        chartData.AppendFormat("['{0}', {1}],", reader["Product_Name"], reader["Discount_Amount"]);
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return chartData.ToString().TrimEnd(',');
        }
    }
}