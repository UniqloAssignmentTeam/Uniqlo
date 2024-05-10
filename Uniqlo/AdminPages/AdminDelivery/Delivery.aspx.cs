using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;

namespace Uniqlo.AdminPages.AdminDelivery
{
    public partial class Delivery : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRepeater();
            }

        }
        private void bindRepeater()
        {
            string connString = cs;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
            SELECT 
                d.Delivery_ID,
                sa.Address + ', ' + sa.State + ', ' + sa.City + ', ' + sa.Postcode + ', ' + sa.Country AS DeliveryAddress,
                d.Delivery_Status,
                p.Order_ID
            FROM 
                Delivery d
            INNER JOIN 
                Shipping_Address sa ON d.Address_ID = sa.Address_ID
            INNER JOIN 
                Payment p ON d.Delivery_ID = p.Delivery_ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDeliveries.DataSource = dt;
                        rptDeliveries.DataBind();
                    }
                }
            }
        }
        protected void btnRemoveDelivery_Click(object sender, EventArgs e)
        {

            int deliveryId = Convert.ToInt32(hiddenDeliveryId.Value); // Retrieve the Delivery ID

            string connectionString = cs;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Begin a transaction
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // Update Payment records to nullify Delivery_ID
                    string updatePayments = "UPDATE Payment SET Delivery_ID = NULL WHERE Delivery_ID = @DeliveryID";
                    using (SqlCommand cmdUpdatePayments = new SqlCommand(updatePayments, conn, transaction))
                    {
                        cmdUpdatePayments.Parameters.AddWithValue("@DeliveryID", deliveryId);
                        cmdUpdatePayments.ExecuteNonQuery();
                    }

                    // Get the Address_ID for the delivery before deleting it
                    string getAddressId = "SELECT Address_ID FROM Delivery WHERE Delivery_ID = @DeliveryID";
                    int addressId;
                    using (SqlCommand cmdGetAddressId = new SqlCommand(getAddressId, conn, transaction))
                    {
                        cmdGetAddressId.Parameters.AddWithValue("@DeliveryID", deliveryId);
                        addressId = (int)cmdGetAddressId.ExecuteScalar();
                    }

                    // Delete the Address record
                    string deleteAddress = "DELETE FROM Shipping_Address WHERE Address_ID = @AddressID";
                    using (SqlCommand cmdDeleteAddress = new SqlCommand(deleteAddress, conn, transaction))
                    {
                        cmdDeleteAddress.Parameters.AddWithValue("@AddressID", addressId);
                        cmdDeleteAddress.ExecuteNonQuery();
                    }

                    // Delete the Delivery record
                    string deleteDelivery = "DELETE FROM Delivery WHERE Delivery_ID = @DeliveryID";
                    using (SqlCommand cmdDeleteDelivery = new SqlCommand(deleteDelivery, conn, transaction))
                    {
                        cmdDeleteDelivery.Parameters.AddWithValue("@DeliveryID", deliveryId);
                        cmdDeleteDelivery.ExecuteNonQuery();
                    }

                    // Commit transaction
                    transaction.Commit();
                    conn.Close();

                    // Redirect or inform the user
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Delivery successfully removed.');", true);
                    Response.Redirect("Delivery.aspx");
                }
                catch (Exception ex)
                {
                    // Roll back the transaction on error
                    transaction.Rollback();
                    conn.Close();

                    // Handle any errors that occur during deletion
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('An error occurred: " + ex.Message + "');", true);
                }
            }
        }

    }
}
