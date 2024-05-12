using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;



namespace Uniqlo.AdminPages
{
    public partial class Report : System.Web.UI.Page
    {
        string cs=Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSalesData();
                BindChartData();
                BindChartData2();
                PopulateItemsSoldChart();
            }
        }


        private void LoadSalesData()
        {
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT CAST(Payment_DateTime AS DATE) AS [Date], SUM(Total_Payment) AS TotalSales FROM Payment WHERE Payment_Status = 'Paid' GROUP BY CAST(Payment_DateTime AS DATE) ORDER BY [Date]", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    Series series = SalesChart.Series["SalesSeries"];
                    series.Points.Clear();

                    while (reader.Read())
                    {
                        series.Points.AddXY(reader["Date"].ToString(), reader["TotalSales"]);
                    }
                }
            }
        }

        private void BindChartData()
        {
           
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT TOP 5 p.Product_Name, SUM(ol.Qty) AS TotalQuantity FROM OrderList ol JOIN Quantity q ON ol.Quantity_ID = q.Quantity_ID JOIN Product p ON q.Product_ID = p.Product_ID GROUP BY p.Product_Name ORDER BY TotalQuantity DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    Series series = BestSellingProductsChart.Series["BestSellingSeries"];
                    while (rdr.Read())
                    {
                        series.Points.AddXY(rdr["Product_Name"], rdr["TotalQuantity"]);
                    }
                }
            }
        }
        private void CustomizeChart()
        {
            SalesChart.ChartAreas["MainChartArea"].AxisX.Title = "Date";
            SalesChart.ChartAreas["MainChartArea"].AxisY.Title = "Total Sales";
            SalesChart.Legends.Add(new Legend("SalesLegend") { Docking = Docking.Bottom });

            BestSellingProductsChart.Titles.Add("Top 5 Best Selling Products");
            BestSellingProductsChart.ChartAreas["ChartArea1"].AxisX.Title = "Products";
            BestSellingProductsChart.ChartAreas["ChartArea1"].AxisY.Title = "Quantity Sold";

            // Style the series
            BestSellingProductsChart.Series["BestSellingSeries"].Palette = ChartColorPalette.BrightPastel;

           
        }

        private void BindChartData2()
        {
          
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"SELECT TOP 5 p.Product_Name, COUNT(*) AS WishlistCount
                         FROM WishlistItem wi
                         JOIN Quantity q ON wi.Quantity_ID = q.Quantity_ID
                         JOIN Product p ON q.Product_ID = p.Product_ID
                         WHERE p.IsDeleted = 0
                         GROUP BY p.Product_Name
                         ORDER BY WishlistCount DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataReader rdr = cmd.ExecuteReader();
                    ChartWishlist.Series["Series1"].XValueMember = "Product_Name";
                    ChartWishlist.Series["Series1"].YValueMembers = "WishlistCount";
                    ChartWishlist.DataSource = rdr;
                    ChartWishlist.DataBind();
                }
            }
        }
        protected void PopulateItemsSoldChart()
        {
           
            List<int> totalItemsSold = new List<int>();

            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                string query = "SELECT YEAR(Orders.Date) AS Year, MONTH(Orders.Date) AS Month, SUM(OrderList.Qty) AS TotalItemsSold " +
                               "FROM Orders " +
                               "INNER JOIN OrderList ON Orders.Order_ID = OrderList.Order_ID " +
                               "WHERE Orders.Date >= DATEADD(MONTH, -2, GETDATE()) " +
                               "GROUP BY YEAR(Orders.Date), MONTH(Orders.Date) " +
                               "ORDER BY Year, Month";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int totalSold = Convert.ToInt32(reader["TotalItemsSold"]);
                    totalItemsSold.Add(totalSold);
                }

                reader.Close();
            }

            // Add data points to the chart
            for (int i = 0; i < totalItemsSold.Count; i++)
            {
                int month = DateTime.Now.Month - 2 + i;
                int year = DateTime.Now.Year;

                if (month <= 0)
                {
                    month += 12;
                    year--;
                }

                Chart1.Series["TotalItemsSold"].Points.AddXY($"{year}-{month}", totalItemsSold[i]);
            }
        }


    }
}