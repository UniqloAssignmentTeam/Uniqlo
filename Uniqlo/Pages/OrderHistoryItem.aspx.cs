using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages;
using Uniqlo.AdminPages.AdminStaff;
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
                        OrderList_ID=ol.OrderList_ID
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
                Total_Item = o.OrderLists.Count(ol => o.Order_ID==ol.Order_ID),
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

        protected string GetOnClientClick(object orderListID, bool reviewBtn)
        {
            string buttonText = reviewBtn ? "View" : "Review";

            return "showModal('" + orderListID.ToString() + "', '" + buttonText + "'); return false;";
        }


    }
}