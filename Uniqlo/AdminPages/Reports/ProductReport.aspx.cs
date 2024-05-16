using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class ProductReport : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetChartData()
        {
            string chartData = "";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string sql = @"SELECT c.Name, SUM(ol.Item_Price * ol.Qty) AS TotalSales
                           FROM Category c
                           JOIN Product p ON c.Category_ID = p.Category_ID
                           JOIN Quantity q ON p.Product_ID = q.Product_ID
                           JOIN OrderList ol ON q.Quantity_ID = ol.Quantity_ID
                           JOIN Orders o ON ol.Order_ID = o.Order_ID
                           WHERE o.IsDeleted = 0
                           GROUP BY c.Name";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        chartData += $"['{reader["Name"]}', {reader["TotalSales"]}],";
                    }
                    reader.Close();
                }
                conn.Close();
            }
            return chartData.TrimEnd(',');
        }
    }
}