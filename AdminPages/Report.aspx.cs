using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

           
                BindReviewChartData();
                BindChartData();
                BindChartData2();
                BindChartData3();
                BindSalesData();
            if (!IsPostBack)
            {
                PopulateMonthsDropDown();
            }
            



        }
        


        private void BindReviewChartData()
        {
            using (SqlConnection con = new SqlConnection(cs)) // Ensure 'cs' is your connection string variable
            {
                string query = @"
            SELECT TOP 5 p.Product_Name, COUNT(r.Review_ID) AS ReviewCount
            FROM Product p
            JOIN Quantity q ON p.Product_ID = q.Product_ID
            JOIN OrderList ol ON q.Quantity_ID = ol.Quantity_ID
            JOIN Review r ON ol.OrderList_ID = r.OrderList_ID
            WHERE p.IsDeleted = 0
            GROUP BY p.Product_Name
            ORDER BY ReviewCount DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    ProductReviewChart.Series["Reviews"].Points.DataBindXY(rdr, "Product_Name", rdr, "ReviewCount");

                }
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFilterReviewChartData();
        }

        private void BindFilterReviewChartData()
        {
            int sortOption = int.Parse(reviewSort.SelectedValue);
            string orderClause = sortOption == 1 ? "DESC" : "ASC";  // Determine sorting order

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = $@"
        SELECT TOP 5 p.Product_Name, COUNT(r.Review_ID) AS ReviewCount
        FROM Product p
        JOIN Quantity q ON p.Product_ID = q.Product_ID
        JOIN OrderList ol ON q.Quantity_ID = ol.Quantity_ID
        JOIN Review r ON ol.OrderList_ID = r.OrderList_ID
        WHERE p.IsDeleted = 0
        GROUP BY p.Product_Name
        ORDER BY ReviewCount {orderClause}";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    ProductReviewChart.Series["Reviews"].Points.DataBindXY(rdr, "Product_Name", rdr, "ReviewCount");
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
                    series.Points.Clear();

                    while (rdr.Read())
                    {
                        series.Points.AddXY(rdr["Product_Name"], rdr["TotalQuantity"]);
                    }
                }
            }
        }
        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFilterChartData();
        }

        private void BindFilterChartData()
        {
            int sortOption = int.Parse(ddlProducts.SelectedValue);
            string orderClause = sortOption == 1 ? "DESC" : "ASC"; // Determine sorting order

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = $@"
        SELECT TOP 5 p.Product_Name, SUM(ol.Qty) AS TotalQuantity
        FROM OrderList ol
        JOIN Quantity q ON ol.Quantity_ID = q.Quantity_ID
        JOIN Product p ON q.Product_ID = p.Product_ID
        GROUP BY p.Product_Name
        ORDER BY TotalQuantity {orderClause}";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    Series series = BestSellingProductsChart.Series["BestSellingSeries"];
                    series.Points.Clear();

                    while (rdr.Read())
                    {
                        series.Points.AddXY(rdr["Product_Name"], rdr["TotalQuantity"]);
                    }
                }
            }
        }


        private void BindChartData2()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT c.Name AS CategoryName, COUNT(p.Product_ID) AS ProductCount FROM Product p JOIN Category c ON p.Category_ID = c.Category_ID WHERE p.IsDeleted = 0 GROUP BY c.Name ORDER BY ProductCount DESC", con);
                SqlDataReader rdr = cmd.ExecuteReader();

                CategoryProductChart.Series["Products"].Points.DataBindXY(rdr, "CategoryName", rdr, "ProductCount");

                rdr.Close();
            }
        }
        protected void ddlCategorySort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFilterChartData2(); // Call the method to bind data based on the new sort order
        }

        private void BindFilterChartData2()
        {
            string sortOption = ddlCategorySort.SelectedValue; // Get the selected sort order from the dropdown
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand($"SELECT c.Name AS CategoryName, COUNT(p.Product_ID) AS ProductCount FROM Product p JOIN Category c ON p.Category_ID = c.Category_ID WHERE p.IsDeleted = 0 GROUP BY c.Name ORDER BY ProductCount {sortOption}", con);
                SqlDataReader rdr = cmd.ExecuteReader();

                CategoryProductChart.Series["Products"].Points.DataBindXY(rdr, "CategoryName", rdr, "ProductCount");
                rdr.Close();
            }
        }






        private void BindChartData3()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT TOP 5 p.Product_Name, d.Discount_Amount FROM Discount d JOIN Product p ON d.Product_ID = p.Product_ID WHERE d.Status = 'Active' AND p.IsDeleted = 0 ORDER BY d.Discount_Amount DESC";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataReader rdr = cmd.ExecuteReader();

                    TopDiscountsChart.Series["Discounts"].Points.Clear();
                    TopDiscountsChart.Series["Discounts"].Points.DataBindXY(rdr, "Product_Name", rdr, "Discount_Amount");

                    rdr.Close();
                }
            }
        }

        protected void ddlDiscountSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFilterChartData3(); // Update chart data based on the new selection
        }

        private void BindFilterChartData3()
        {
            string sortOrder = ddlDiscountSort.SelectedValue; // Get the selected sort order from the dropdown
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = $"SELECT TOP 5 p.Product_Name, d.Discount_Amount FROM Discount d JOIN Product p ON d.Product_ID = p.Product_ID WHERE d.Status = 'Active' AND p.IsDeleted = 0 ORDER BY d.Discount_Amount {sortOrder}";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataReader rdr = cmd.ExecuteReader();

                    TopDiscountsChart.Series["Discounts"].Points.Clear();
                    TopDiscountsChart.Series["Discounts"].Points.DataBindXY(rdr, "Product_Name", rdr, "Discount_Amount");

                    rdr.Close();
                }
            }
        }
        

        private void BindSalesData()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT FORMAT(Payment_DateTime, 'MMM yyyy') AS Month, SUM(ol.Qty) AS TotalItemsSold
                         FROM OrderList ol
                         JOIN Orders o ON ol.Order_ID = o.Order_ID
                         JOIN Payment p ON o.Order_ID = p.Order_ID
                         WHERE p.Payment_Status = 'Paid' AND p.Payment_DateTime >= DATEADD(MONTH, -4, GETDATE())
                         GROUP BY FORMAT(Payment_DateTime, 'MMM yyyy')
                         ORDER BY MIN(p.Payment_DateTime);";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    Series series = SalesChart.Series["SalesSeries"];
                    series.Points.Clear();

                    while (reader.Read())
                    {
                        series.Points.AddXY(reader["Month"].ToString(), reader["TotalItemsSold"]);
                    }
                }
            }
        }


        private void PopulateMonthsDropDown()
        {
            ddlMonths.Items.Clear(); // Clear existing items
            ddlMonths.Items.Add(new ListItem("Select Month", "0")); // Default item

            DateTime currentDate = DateTime.Now; // Current date
            for (int i = 0; i < 3; i++) // Populate last 3 months
            {
                DateTime monthToShow = currentDate.AddMonths(-i);
                ddlMonths.Items.Add(new ListItem(monthToShow.ToString("MMMM yyyy"), monthToShow.Month.ToString()));
            }
        }


        private void BindSalesDataFilter()
        {
            int selectedMonth = int.Parse(ddlMonths.SelectedValue);
            int selectedYear = DateTime.Now.Year; // Assumes filtering within the current year

            if (selectedMonth == 0) return; // Skip if "Select Month" is selected

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
        SELECT FORMAT(Payment_DateTime, 'MMM yyyy') AS Month, SUM(ol.Qty) AS TotalItemsSold
        FROM OrderList ol
        JOIN Orders o ON ol.Order_ID = o.Order_ID
        JOIN Payment p ON o.Order_ID = p.Order_ID
        WHERE p.Payment_Status = 'Paid' 
        AND MONTH(p.Payment_DateTime) = @Month 
        AND YEAR(p.Payment_DateTime) = @Year
        GROUP BY FORMAT(Payment_DateTime, 'MMM yyyy')
        ORDER BY MIN(p.Payment_DateTime);";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Month", selectedMonth);
                    cmd.Parameters.AddWithValue("@Year", selectedYear);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    Series series = SalesChart.Series["SalesSeries"];
                    series.Points.Clear();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            series.Points.AddXY(reader["Month"].ToString(), reader["TotalItemsSold"]);
                        }
                    }
                    else
                    {
                        // Notify user if no records found for selected month
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found for selected month.');", true);
                    }
                }
            }
        }
        protected void ddlMonths_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSalesDataFilter();
        }
        

    }
}