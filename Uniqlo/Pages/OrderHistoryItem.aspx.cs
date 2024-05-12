using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.OrderList;
using static Uniqlo.Review;

namespace Uniqlo.Pages
{
    public partial class OrderHistoryItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderID = int.Parse(Request.QueryString["Order_ID"]);
                orderIDLabel.Text = orderID.ToString();
                BindOrderListDataList(4,orderID);
                BindOrderSummaryRepeater(4,orderID);


            }
            

        }
      


        private void BindOrderListDataList(int customerID,int orderID)
        {
            using (var db = new OrderDbContext())
            {
                
                var orderDetails = db.Order
                    .Where(o => o.Customer_ID == customerID && o.Order_ID== orderID)
                    .SelectMany(o => o.OrderLists, (o, ol) => new {
                        Product_Name=ol.Quantity.Product.Product_Name,
                        Product_Description= ol.Quantity.Product.Description,
                        Size = ol.Quantity.Size,
                        Color = ol.Quantity.Color,
                        Item_Price = ol.Item_Price,
                        Qty = ol.Qty,
                        Subtotal = ol.Qty * ol.Item_Price,
                        Image_ID=ol.Quantity.Image_ID,
                        reviewBtn = db.Review.Any(r => r.OrderList_ID == ol.OrderList_ID),
                        OrderList_ID=ol.OrderList_ID,

            }).ToList();

                DataList1.DataSource = orderDetails;
                DataList1.DataBind();
            }
        }
        
        private void BindOrderSummaryRepeater(int customerID,int orderID)
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

        protected void submitRating_Click(object sender, EventArgs e)
        {
            int orderListId = int.Parse(HiddenOrderListID.Value); 
            int rating = int.Parse(HiddenRating.Value);
            string comment = commentTextArea.Text; // Make sure `commentTextArea` is a server control or properly retrieved

            // Insert into database
            using (var context = new ReviewDbContext())
            {
                Review review = new Review
                {
                    OrderList_ID = orderListId,
                    Rating = rating,
                    Review1 = comment,
                    Date_Submitted = DateTime.Now
                };
                context.Review.Add(review);
                context.SaveChanges();
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void updateRating_Click(object sender, EventArgs e)
        {
            
            int orderListId = int.Parse(HiddenOrderListID.Value);
            int rating = int.Parse(HiddenRatingUpdate.Value);
            TextBox txtComment = (TextBox)ratingRepeater.FindControl("commentTextArea2");
            

            string comment = txtComment.Text;
            ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('" + orderListId + "," + rating + "," + comment + "');", true);
            
            
            using (var context = new ReviewDbContext())
            {
                Review review = context.Review.FirstOrDefault(r => r.OrderList_ID == orderListId);

                if (review != null)
                {
                    review.Rating = rating;
                    review.Review1 = comment;
                    review.Date_Submitted = DateTime.Now;
                }
                context.SaveChanges();
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            myModal.Style["display"] = "none";
            secModal.Style["display"] = "none";
            int orderID = int.Parse(Request.QueryString["Order_ID"]);

            BindOrderListDataList(4, orderID);
            BindOrderSummaryRepeater(4, orderID);
        }

        protected void ReviewValidBtn_Command(object sender, CommandEventArgs e)
        {
            int orderListId = Convert.ToInt32(e.CommandArgument);
            int orderID = int.Parse(Request.QueryString["Order_ID"]);

            Button clickedButton = (Button)sender;
            if (clickedButton.Text == "View")
            {
                secModal.Style["display"] = "block";
                BindOrderListDataList(4, orderID);
                BindOrderSummaryRepeater(4, orderID);
                BindRatingRepeater(orderListId);
            }
            else
            {
                myModal.Style["display"] = "block";
                BindOrderListDataList(4, orderID);
                BindOrderSummaryRepeater(4, orderID);
            }

            // Execute JavaScript to set the hidden field value
            string script = $"document.getElementById('HiddenOrderListID').value = '{orderListId}';";
            ScriptManager.RegisterStartupScript(this, GetType(), "assignOrderListID", script, true);
        }


        private void BindRatingRepeater(int orderListId)
        {
            int orderID = int.Parse(Request.QueryString["Order_ID"]);

            using (var db = new OrderDbContext())
            {
                var orderDetails = db.OrderList
                                    .Where(ol => ol.Order_ID == orderID && ol.OrderList_ID == orderListId)
                                    .SelectMany(ol => ol.Reviews, (ol, r) => new
                                    {
                                        OrderList_ID = ol.OrderList_ID,
                                        Rating = r.Rating,
                                        Review = r.Review1
                                    })
                                    .FirstOrDefault();

                ratingRepeater.DataSource = new List<object> { orderDetails };
                ratingRepeater.DataBind();

                updateRatingRepeater.DataSource = new List<object> { orderDetails };
                updateRatingRepeater.DataBind();

            }
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