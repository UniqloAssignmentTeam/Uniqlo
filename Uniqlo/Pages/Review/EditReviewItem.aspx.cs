﻿using System;
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
            // Retrieve OrderList_ID from query string
            string orderListId = EncryptionHelper.Decrypt(Request.QueryString["OrderList_ID"]);

            if (!string.IsNullOrEmpty(orderListId))
            {
                // Connection string retrieved from web.config
                string connectionString = Global.CS;

                // SQL query to retrieve review data based on OrderList_ID
                string query = @"
            SELECT r.Rating, r.Review
            FROM Review r
            INNER JOIN OrderList ol ON r.OrderList_ID = ol.OrderList_ID
            WHERE ol.OrderList_ID = @OrderListID";

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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Retrieve the rating and review from the controls
            int rating = Convert.ToInt32(HiddenRatingUpdate.Value);
            string comment = Review.Text;

            // Get the OrderList_ID from the query string
            string orderListId = EncryptionHelper.Decrypt(Request.QueryString["OrderList_Id"]); ;

            // Update the review in the database
            UpdateReview(int.Parse(orderListId), rating, comment);

            // Display popup using JavaScript
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "showPopup();", true);

            Response.Redirect($"ViewReviewItem.aspx?OrderList_Id={EncryptionHelper.Encrypt(orderListId)}");
        }

        private void UpdateReview(int orderListId, int rating, string comment)
        {
            // Implement logic to update the review in the database
            string connectionString = Global.CS;
            string query = "UPDATE Review SET Rating = @Rating, Review = @Review WHERE OrderList_ID = @OrderListID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Rating", rating);
                    command.Parameters.AddWithValue("@Review", comment);
                    command.Parameters.AddWithValue("@OrderListID", orderListId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }


    }
}
