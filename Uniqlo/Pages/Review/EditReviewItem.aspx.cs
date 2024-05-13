using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages;

namespace Uniqlo.Pages
{
    public partial class EditReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the review data
                BindReviewData();
            }
        }

        private void BindReviewData()
        {
            // Retrieve ReviewID from query string
            string reviewID = Request.QueryString["ReviewID"];

            if (!string.IsNullOrEmpty(reviewID))
            {
                // Connection string retrieved from web.config
                string connectionString = Global.CS;

                // SQL query to retrieve review data based on ReviewID
                string query = "SELECT Rating, Review FROM Review WHERE Review_ID = @ReviewID";

                // Create a new SqlConnection using the connection string
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a new SqlCommand with the query and connection
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameter for ReviewID
                        command.Parameters.AddWithValue("@ReviewID", reviewID);

                        // Open the connection
                        connection.Open();

                        // Execute the command and retrieve the data
                        SqlDataReader reader = command.ExecuteReader();

                        // Check if data exists
                        if (reader.Read())
                        {
                            // Populate the rating
                            HiddenRatingUpdate.Value = reader["Rating"].ToString();

                            // Populate the review
                            Review.Text = reader["Review"].ToString();
                        }

                        // Close the reader and connection
                        reader.Close();
                        connection.Close();
                    }
                }
            }
        }

        protected void updateRating_Click(object sender, EventArgs e)
        {
            // Retrieve the rating and review from the controls
            int rating = Convert.ToInt32(HiddenRatingUpdate.Value);
            string comment = Review.Text;

            // Get the ReviewID from the query string
            int reviewID = GetReviewIDFromQueryString();

            // Update the review in the database
            UpdateReview(reviewID, rating, comment);

            // Display popup using JavaScript
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "showPopup();", true);
        }

        private void UpdateReview(int reviewID, int rating, string comment)
        {
            // Implement logic to update the review in the database
            string connectionString = Global.CS;
            string query = "UPDATE Review SET Rating = @Rating, Review = @Review WHERE Review_ID = @ReviewID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Rating", rating);
                    command.Parameters.AddWithValue("@Review", comment);
                    command.Parameters.AddWithValue("@ReviewID", reviewID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Optionally, you can redirect the user to another page after the update
            Response.Redirect("OrderHistoryItem.aspx");
        }


        private int GetReviewIDFromQueryString()
        {
            // Implement logic to retrieve ReviewID from the query string
            // For example:
            if (!string.IsNullOrEmpty(Request.QueryString["ReviewID"]))
            {
                return Convert.ToInt32(Request.QueryString["ReviewID"]);
            }
            else
            {
                // Handle the case where ReviewID is not present in the query string
                // You may throw an exception or return a default value
                throw new Exception("ReviewID is missing in the query string.");
            }
        }


    }
}
