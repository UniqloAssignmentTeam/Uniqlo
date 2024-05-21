using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.OrderList;
using static Uniqlo.Review;
using static Uniqlo.EncryptionHelper;
using System.Data.SqlClient;
using System.Configuration;
using MailKit.Search;

namespace Uniqlo.Pages
{
    public partial class OrderHistoryItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                // Try to retrieve and convert the customer ID from the session
                string sessionValue = Session["Customer_ID"] as string;
                if (int.TryParse(sessionValue, out int custId))
                {

                    if(Request.QueryString["Order_ID"] != null)
                    {
                        string encryptedOrderId = Request.QueryString["Order_ID"];
                        string decryptedOrderId = EncryptionHelper.Decrypt(encryptedOrderId);
                        Session["Order_ID"] =encryptedOrderId;
                        int orderId;
                        if (int.TryParse(decryptedOrderId, out orderId))
                        {
                            orderIDLabel.Text = orderId.ToString();
                            BindOrderListDataList(custId, orderId);
                            BindOrderSummaryRepeater(custId, orderId);
                        }
                    }



                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when retrieve order list item.');", true);
                    Response.Redirect("Profile.aspx");
                }
                
            }


        }
      


        private void BindOrderListDataList(int customerID,int orderID)
        {
            try
            {
                using (var db = new OrderDbContext())
                {

                    var orderDetails = db.Order
                        .Where(o => o.Customer_ID == customerID && o.Order_ID == orderID)
                        .SelectMany(o => o.OrderLists, (o, ol) => new {
                            Product_Name = ol.Quantity.Product.Product_Name,
                            Product_Description = ol.Quantity.Product.Description,
                            Size = ol.Quantity.Size,
                            Color = ol.Quantity.Color,
                            Item_Price = ol.Item_Price,
                            Qty = ol.Qty,
                            Subtotal = ol.Qty * ol.Item_Price,
                            Image_ID = ol.Quantity.Image_ID,
                            reviewBtn = db.Review.Any(r => r.OrderList_ID == ol.OrderList_ID),
                            OrderList_ID = ol.OrderList_ID,

                        }).ToList();

                    DataList1.DataSource = orderDetails;
                    DataList1.DataBind();
                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when retrieve order list.');", true);
            }

        }
        
        private void BindOrderSummaryRepeater(int customerID,int orderID)
        {
            try
            {            
                using (var db = new OrderDbContext())
                {
                    var orderDetails = db.Order
                     .Where(o => o.Order_ID == orderID && o.Customer_ID == customerID)
                     .Select(o => new {
                    Payment_DateTime = o.Payments.FirstOrDefault().Payment_DateTime,
                    Payment_Method = o.Payments.FirstOrDefault().Payment_Method,
                    Payment_Status = o.Payments.FirstOrDefault().Payment_Status,
                    Delivery_Status = o.Payments.FirstOrDefault().Delivery.Delivery_Status,
                    Sub_Total = o.Subtotal,
                    Total_Item = o.OrderLists.Where(ol => o.Order_ID == ol.Order_ID).Sum(ol => ol.Qty),
                    Shipping_Amount = o.Payments.FirstOrDefault().Shipping_Amount,
                    Total_Payment = o.Payments.FirstOrDefault().Total_Payment

                     }).ToList();

                    orderSummaryRepeater.DataSource = orderDetails;
                    orderSummaryRepeater.DataBind();
                }

            }
            catch (Exception ex)
            {
              
            }
        }



        protected void reviewValidBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string buttonText = btn.Text;

            // Get the OrderList_ID from the CommandArgument
            string orderListID = btn.CommandArgument;

            // Check delivery status
            string deliveryStatus = GetDeliveryStatus(orderListID);

            //Encrypt
            orderListID = EncryptionHelper.Encrypt(orderListID);

            if (deliveryStatus != "Delivered")
            {
                // Display a SweetAlert indicating that the item hasn't been received yet
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire({ title: 'Cannot Add Review', text: 'You cannot add a review until the item is delivered.', icon: 'error', confirmButtonText: 'OK' });", true);
                return;
            }

            // Redirect based on the button text
            if (buttonText == "Review")
            {

                Response.Redirect("./Review/addReviewItem.aspx?OrderList_ID=" + orderListID);
            }
            else if (buttonText == "View")
            {
                Response.Redirect("./Review/viewReviewItem.aspx?OrderList_ID=" + orderListID);
            }
        }


        private string GetDeliveryStatus(string orderListID)
        {
            string deliveryStatus = string.Empty;

            using (SqlConnection con = new SqlConnection(Global.CS))
            {
                try
                {
                    con.Open();

                    string query = @"
                        SELECT d.Delivery_Status
                        FROM Delivery d
                        INNER JOIN Orders o ON d.Address_ID = o.Customer_ID
                        INNER JOIN OrderList ol ON o.Order_ID = ol.Order_ID
                        WHERE ol.OrderList_ID = @OrderListID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@OrderListID", orderListID);

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            deliveryStatus = reader["Delivery_Status"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when retrieve delivery status.');", true);
                }
            }

            return deliveryStatus;
        }

        public string GenerateStars(double rating)
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