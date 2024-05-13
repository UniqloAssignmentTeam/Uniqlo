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
                int custId = (int)Session["Customer_ID"];
                int orderID = int.Parse(Request.QueryString["Order_ID"]);
                orderIDLabel.Text = orderID.ToString();
                BindOrderListDataList(custId, orderID);
                BindOrderSummaryRepeater(custId, orderID);


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



        protected void reviewValidBtn_Command(object sender, CommandEventArgs e)
        {
            string buttonText = ((Button)sender).Text;
            string orderListID = e.CommandArgument.ToString();

            if (buttonText == "View")
            {
                // Redirect to view review page
                Response.Redirect("~/ViewReviewItem.aspx?OrderListID=" + orderListID);
            }
            else if (buttonText == "Review")
            {
                // Redirect to add review page
                Response.Redirect("~/AddReviewItem.aspx?OrderListID=" + orderListID);
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