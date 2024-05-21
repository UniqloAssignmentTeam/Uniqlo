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
            if (IsPostBack)
            {
                string eventTarget = Request["__EVENTTARGET"];
                if (eventTarget == "HyperLink1")
                {
                    
                        Response.Redirect("/Pages/OrderHistoryItem.aspx?Order_ID=" + Session["Order_ID"]);
                    
                }
            }
        }

        protected void submitRating_Click(object sender, EventArgs e)
        {
            // Get the rating and comment from the controls
            int rating = Convert.ToInt32(HiddenRating.Value);
            string comment = commentTextArea.Text;

            // Get the OrderList_ID from the query string
            string orderListID = EncryptionHelper.Decrypt(Request.QueryString["OrderList_ID"]);


            // Insert the review into the database
            InsertReview(int.Parse(orderListID), rating, comment);

            // Optionally, you can display a confirmation message or redirect the user
            // For example, you can display a popup message using JavaScript
            string script = @"
                Swal.fire({
                    title: 'Success!',
                    text: 'Review submitted successfully!',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '../Profile.aspx';
                    }
                });
            ";

            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, true);
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
