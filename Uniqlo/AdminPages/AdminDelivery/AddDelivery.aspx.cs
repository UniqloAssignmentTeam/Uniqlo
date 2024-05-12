﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.Pages;

namespace Uniqlo.AdminPages.AdminDelivery
{
    public partial class AddDelivery : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulatePaymentIDs();
            }
        }

        protected void PopulatePaymentIDs()
        {
            string connectionString = cs;
            string query = "SELECT Payment_ID FROM Payment WHERE Delivery_ID IS NULL";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int paymentID = Convert.ToInt32(reader["Payment_ID"]);
                            ddlPaymentID.Items.Add(new ListItem(paymentID.ToString(), paymentID.ToString()));
                        }
                    }
                }
            }

            // Add a default item to the DropDownList
            ddlPaymentID.Items.Insert(0, new ListItem("Select Payment ID", ""));
        }

        protected void btnAddDelivery_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Retrieve address details from textboxes
                string address = txtAddress.Text;
                string state = txtState.Text;
                string city = txtCity.Text;
                string postcode = txtPostcode.Text;
                string country = txtCountry.Text;

                int addressID = CreateNewAddress(address, state, city, postcode, country);

                // Add a new delivery
                string deliveryNote = txtDeliveryNote.Text;
                string deliveryStatus = ddlStatus.SelectedValue;
                int newDeliveryID = AddNewDelivery(addressID, deliveryNote, deliveryStatus);

                // Assign the new delivery to the selected payment
                int selectedPaymentID = Convert.ToInt32(ddlPaymentID.SelectedValue);
                AssignDeliveryToPayment(newDeliveryID,selectedPaymentID);

                // Display a success message or redirect to another page
                ScriptManager.RegisterStartupScript(this, GetType(), "SuccessScript", "alert('Delivery added successfully.'); window.location.href = 'Delivery.aspx';", true);
            }
            Response.Redirect("Delivery.aspx");
        }

        protected int CreateNewAddress(string address, string state, string city, string postcode, string country)
        {
            int addressID = -1; // Default value indicating address creation failed

            // Construct the INSERT query to add a new address
            string query = "INSERT INTO Shipping_Address (Address, State, City, Postcode, Country) VALUES (@Address, @State, @City, @Postcode, @Country); SELECT SCOPE_IDENTITY();";

            // Define the connection string and create a SqlConnection object
            string connectionString = cs; 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a SqlCommand object with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@State", state);
                    command.Parameters.AddWithValue("@City", city);
                    command.Parameters.AddWithValue("@Postcode", postcode);
                    command.Parameters.AddWithValue("@Country", country);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the INSERT query and get the newly inserted address's ID
                        object result = command.ExecuteScalar();

                        // Check if the result is not null and parse it to integer
                        if (result != null)
                        {
                            addressID = Convert.ToInt32(result); // Update addressID with the newly inserted address's ID
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions (e.g., logging, displaying an error message)
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                }
            }

            // Return the addressID
            return addressID;
        }

        protected int AddNewDelivery(int addressID, string deliveryNote, string deliveryStatus)
        {
            int deliveryId = -1;
            // Construct the INSERT query to add a new delivery
            string query = "INSERT INTO Delivery (Address_ID, Delivery_Note, Delivery_Status) VALUES (@AddressID, @DeliveryNote, @DeliveryStatus);SELECT SCOPE_IDENTITY();";

            // Define the connection string and create a SqlConnection object
            string connectionString = cs;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a SqlCommand object with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@AddressID", addressID);
                    command.Parameters.AddWithValue("@DeliveryNote", deliveryNote);
                    command.Parameters.AddWithValue("@DeliveryStatus", deliveryStatus);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        
                        deliveryId = Convert.ToInt32(command.ExecuteScalar());
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions (e.g., logging, displaying an error message)
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                }
            }
            return deliveryId;
        }

        protected void AssignDeliveryToPayment(int deliveryId, int paymentId)
        {
            // Construct the UPDATE query to assign the delivery to the payment
            string query = "UPDATE Payment SET Delivery_ID = @DeliveryID WHERE Payment_ID = @PaymentID;";

            // Define the connection string and create a SqlConnection object
            string connectionString = cs; 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create a SqlCommand object with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    command.Parameters.AddWithValue("@PaymentID", paymentId);

                    try
                    {
                        // Open the connection
                        connection.Open();

                        // Execute the UPDATE query to assign the delivery to the payment
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions (e.g., logging, displaying an error message)
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeliveryHome.aspx");

        }
    }
}