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
                // Retrieve the OrderListID from the query 
                string orderListID = Request.QueryString["OrderList_ID"];

                //Decrypt
                orderListID = EncryptionHelper.Decrypt(orderListID);

                if (!string.IsNullOrEmpty(orderListID))
                {
                    BindReviewData(orderListID);
                    DataBind();
                }
                else
                {
                    Response.Write("OrderListID is missing from the query string.");
                }
            }
        }

        // Method to bind review data to the repeater
        private void BindReviewData(string orderListId)
        {
            // Connection string retrieved from web.config
            string connectionString = Global.CS;

            // SQL query to retrieve review data based on OrderList_ID
            string query = "SELECT r.Rating, r.Review, r.Review_ID " +
                "FROM Review r " +
                "INNER JOIN OrderList ol ON r.OrderList_ID = ol.OrderList_ID " +
                "WHERE ol.OrderList_ID = @OrderListID";

            // Create a new SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a new SqlCommand with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameter for OrderList_ID
                    command.Parameters.AddWithValue("@OrderListID", orderListId);

                    // Open the connection
                    connection.Open();

                    // Execute the query and get the data
                    SqlDataReader reader = command.ExecuteReader();

                    // Check if there are rows returned
                    if (reader.Read())
                    {
                        // Set the value of the ASP.NET TextBox with the retrieved review
                        commentTextArea1.Text = reader["Review"].ToString();
                        hdfRating.Value = reader["Rating"].ToString();
                    }

                    // Close the reader
                    reader.Close();
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

        protected void EditButton_Click(object sender, EventArgs e)
        {
            string orderListId = Request.QueryString["OrderList_ID"];
            Response.Redirect("EditReviewItem.aspx?OrderList_ID=" + orderListId);
        }
        protected void btnDeleteReview_Click(object sender, EventArgs e)
        {
            // Retrieve the OrderlistID from the query string
            string orderListId = EncryptionHelper.Decrypt(Request.QueryString["OrderList_ID"]);

            // Connection string retrieved from web.config
            string connectionString = Global.CS;

            // SQL query to retrieve the Order ID and delete the review based on OrderList_ID
            string query = @"
        DECLARE @OrderID INT;
        SELECT @OrderID = ol.Order_ID
        FROM OrderList ol
        WHERE ol.OrderList_ID = @OrderListID;

        DELETE FROM Review WHERE OrderList_ID = @OrderListID;

        SELECT @OrderID AS OrderID;";

            // Create a new SqlConnection using the connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a new SqlCommand with the combined query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameter for OrderListID
                    command.Parameters.AddWithValue("@OrderListID", orderListId);

                    // Open the connection
                    connection.Open();

                    // Execute the query
                    SqlDataReader reader = command.ExecuteReader();

                    // Check if there are rows in the result
                    if (reader.HasRows)
                    {
                        // Read the Order ID
                        reader.Read();
                        string orderId = reader["OrderID"].ToString();

                        // Close the reader
                        reader.Close();

                        // Redirect to OrderItemList.aspx with OrderID query string
                        Response.Redirect($"../OrderHistoryItem.aspx?Order_ID={EncryptionHelper.Encrypt(orderId)}");
                    }
                    else
                    {
                        // Close the reader
                        reader.Close();

                        // Display an error message if the review was not found or could not be deleted
                        Response.Write("Review not found or could not be deleted.");
                    }
                }
            }

        }

    }
}
