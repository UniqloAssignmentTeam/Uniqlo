using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffRole"] == null)
                {
                    // Redirect to adminLogin.aspx if the session role is invalid or not set
                    Response.Redirect("adminLogin.aspx");
                    Session["Unauthorized"] = true;
                }

                BindDeliveryData();
                BindPaymentData();
                BindStaffData();
                BindCustomerData();
                BindSalesChartData();
            }

            
        }
        private void BindDeliveryData()
        {
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Delivery WHERE Delivery_Status != 'Delivered'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    int notDeliveredCount = (int)cmd.ExecuteScalar();
                    lblNotDeliveredCount.Text = notDeliveredCount.ToString();
                }
            }
        }
        private void BindPaymentData()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Payment WHERE Payment_Status != 'uPaid'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    int notPaidCount = (int)cmd.ExecuteScalar();
                    lblNotPaid.Text = notPaidCount.ToString();
                }
            }
        }
        private void BindStaffData()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Staff";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    int staffCount = (int)cmd.ExecuteScalar();
                    lblStaff.Text = staffCount.ToString();
                }
            }
        }
        private void BindCustomerData()
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT COUNT(*) FROM Customer";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    int customerCount = (int)cmd.ExecuteScalar();
                    lblCustomer.Text = customerCount.ToString();
                }
            }
        }
        private void BindSalesChartData()
        {
         
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT MONTH(Payment_DateTime) AS SaleMonth, SUM(Total_Payment) AS TotalSales
                         FROM Payment
                         WHERE YEAR(Payment_DateTime) = YEAR(GETDATE()) AND Payment_Status = 'Paid'
                         GROUP BY MONTH(Payment_DateTime)
                         ORDER BY SaleMonth";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(rdr);
                        SalesChart.DataSource = dt;
                        SalesChart.DataBind();
                    }
                }
            }
        }
    }
}