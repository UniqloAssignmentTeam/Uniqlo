using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Staff;
using OfficeOpenXml;
using System.IO;
using System.Text;

namespace Uniqlo.AdminPages.AdminCustomer
{
    public partial class CustomerHome : System.Web.UI.Page
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
            try
            {
                string searchText = searchBox.Text;
                var results = SearchCustomerDatabase(searchText);  // Call the method that performs the search
                customerRepeater.DataSource = results;
                customerRepeater.DataBind();
                lblNoCustomerFound.Visible = results.Count == 0;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while searching the customer name.');", true);
            }
        }

        public List<Customer> SearchCustomerDatabase(string searchText)
        {
            using (var db = new CustomerDBContext())
            {
                var query = db.Customer
                              .Where(c => c.Name.Contains(searchText))
                              .ToList();
                return query;
            }
        }

        protected void genderSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Implement gender sorting logic
            BindFilteredCustList();
        }

        private void BindFilteredCustList()
        {
            try
            {
                using (var db = new CustomerDBContext())
                {
                    // Retrieve the selected gender from the dropdown list
                    string selectedGender = genderSortDDL.SelectedValue;

                    // Initialize the query to select all customers
                    IQueryable<Customer> query = db.Customer;

                    // Filter by the selected gender if a specific gender is selected
                    if (!string.IsNullOrEmpty(selectedGender) && selectedGender != "All Genders")
                    {
                        query = query.Where(c => c.Gender == selectedGender);
                    }

                    // Execute the query and get the list of customers
                    var customerList = query.ToList();

                    // Bind the customer list to the repeater control
                    customerRepeater.DataSource = customerList;
                    customerRepeater.DataBind();

                    // Display a message if no customers were found
                    lblNoCustomerFound.Visible = customerList.Count == 0;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "scriptError", "alert('Failed to load filtered customer list. Please try again.');", true);
            }
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

        protected void excelBtn_Click(object sender, EventArgs e)
        {
            string connectionString = Global.CS; // Ensure this is correctly defined
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();  // Ensure the connection is opened before executing the command

                StringBuilder query = new StringBuilder("SELECT Customer_ID, Name, Gender, Contact_No, Email FROM Customer");
                List<SqlParameter> parameters = new List<SqlParameter>();

                string genderFilter = genderSortDDL.SelectedValue;
                bool hasGenderFilter = !string.IsNullOrEmpty(genderFilter) && genderFilter != "All Genders";

                if (hasGenderFilter)
                {
                    query.Append(" WHERE");
                    if (hasGenderFilter)
                    {
                        query.Append(" Gender = @Gender");
                        parameters.Add(new SqlParameter("@Gender", genderFilter));
                    }
                }

                using (SqlCommand cmd = new SqlCommand(query.ToString(), conn))
                {
                    cmd.Parameters.AddRange(parameters.ToArray());
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        using (ExcelPackage pck = new ExcelPackage())
                        {
                            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Customers");
                            ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                            var memoryStream = new MemoryStream();
                            pck.SaveAs(memoryStream);
                            memoryStream.Position = 0;

                            HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Customers.xlsx");
                            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                            HttpContext.Current.Response.End();
                        }
                    }
                }
            }
        }
    }
}