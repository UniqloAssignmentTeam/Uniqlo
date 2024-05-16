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
                string query = "SELECT Customer_ID, Name, Gender, Contact_No, Address, Email, Password FROM Customer";
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

        protected void excelBtn_Click(object sender, EventArgs e)
        {
            // Implement export to Excel logic
        }

        protected void addCustomerBtn_Click(object sender, EventArgs e)
        {
            // Redirect to add customer page
            Response.Redirect("AddCustomer.aspx");
        }
        protected void btnRemoveCustomer_Click(object sender, EventArgs e)
        {
            // Retrieve the customer ID from the hidden field
            int customerId = Convert.ToInt32(hiddenCustomerId.Value);

            // Call a method to delete the customer from the database
            bool success = DeleteCustomer(customerId);

            if (success)
            {
                // Display a success message
                ScriptManager.RegisterStartupScript(this, GetType(), "deleteSuccess", "showDeleteSuccess();", true);
            }
            Response.Redirect("CustomerHome.aspx");
        }

        // Method to delete a customer from the database
        private bool DeleteCustomer(int customerId)
        {
            bool success = false;

            try
            {
                // Replace "YourConnectionString" with your actual connection string
                string connectionString = cs;

                // Create a connection to the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Open the database connection
                    connection.Open();

                    // Define the SQL command to delete the customer record
                    string query = "DELETE FROM Customer WHERE Customer_ID = @CustomerId";

                    // Create a SqlCommand object with the query and connection
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add the customer ID parameter to the command
                        command.Parameters.AddWithValue("@CustomerId", customerId);

                        // Execute the SQL command
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if any rows were affected (customer deleted)
                        if (rowsAffected > 0)
                        {
                            success = true; // Deletion successful
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error deleting customer: " + ex.Message);
            }

            return success;
        }
    }
}