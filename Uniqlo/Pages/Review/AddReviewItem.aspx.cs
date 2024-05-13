using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Uniqlo.AdminPages;

namespace Uniqlo.Pages.Review
{
    public partial class AddReviewItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitRating_Click(object sender, EventArgs e)
        {
            // Get the rating and comment from the controls
            int rating = Convert.ToInt32(HiddenRating.Value);
            string comment = commentTextArea.Text;

            // Get the OrderList_ID from the query string
            int orderListID = Convert.ToInt32(Request.QueryString["OrderList_ID"]);

            // Insert the review into the database
            InsertReview(orderListID, rating, comment); // Implement this method to insert the review

            // Optionally, you can display a confirmation message or redirect the user
            // For example, you can display a popup message using JavaScript
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Review submitted successfully!');", true);
        }

        // Method to insert the review into the database
        private void InsertReview(int orderListID, int rating, string review)
        {
            // Connection string retrieved from web.config
            string connectionString = Global.CS;

            // SQL query to insert the review into the database
            string query = "INSERT INTO Review (OrderList_ID, Rating, Review, Date_submitted) VALUES (@OrderListID, @Rating, @Review, @DateSubmitted)";

            // Create a new SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a new SqlCommand with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters for the OrderList_ID, rating, review, and current date
                    command.Parameters.AddWithValue("@OrderListID", orderListID);
                    command.Parameters.AddWithValue("@Rating", rating);
                    command.Parameters.AddWithValue("@Review", review);
                    command.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);

                    // Open the connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Close the connection
                    connection.Close();
                }
            }
        }
    }
}
