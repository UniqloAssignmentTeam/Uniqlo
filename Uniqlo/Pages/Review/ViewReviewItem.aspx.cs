using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages;

namespace Uniqlo.Pages
{
    public partial class ReviewItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReviewData("1");
            }
        }

        // Method to bind review data to the repeater
        private void BindReviewData(string orderItemId)
        {
            // Connection string retrieved from web.config
            string connectionString = Global.CS;

            // SQL query to retrieve review data based on OrderItemID
            string query = "SELECT r.Rating, r.Review, r.Review_ID " +
                "FROM Review r " +
                "INNER JOIN OrderList ol ON r.OrderList_ID = ol.OrderList_ID " +
                "WHERE ol.OrderList_ID = @OrderItemID";

            // Create a new SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a new SqlDataAdapter with the query and connection
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                {
                    // Add parameter for OrderItemID
                    adapter.SelectCommand.Parameters.AddWithValue("@OrderItemID", orderItemId);

                    // Create a new DataTable to store the fetched data
                    DataTable reviewData = new DataTable();

                    // Open the connection
                    connection.Open();

                    // Fill the DataTable with data from the SqlDataAdapter
                    adapter.Fill(reviewData);

                    // Close the connection
                    connection.Close();

                    // Bind the review data to the repeater
                    ratingRepeater.DataSource = reviewData;
                    ratingRepeater.DataBind();
                }
            }
        }

        // Method to generate stars based on the rating
        protected string GenerateStars(double rating)
        {
            var fullStars = (int)rating; // Number of full stars
            var halfStar = rating % 1 != 0; // Check if there is a half star
            var noStars = 5 - fullStars - (halfStar ? 1 : 0); // Remaining empty stars
            var html = string.Empty;

            // Add full stars
            for (int i = 0; i < fullStars; i++)
            {
                html += "<i class='fas fa-star star'></i>";
            }

            // Add half star
            if (halfStar)
            {
                html += "<i class='fas fa-star-half-alt star'></i>";
            }

            // Add empty stars
            for (int i = 0; i < noStars; i++)
            {
                html += "<i class='far fa-star star'></i>";
            }

            return html;
        }
    }
}
