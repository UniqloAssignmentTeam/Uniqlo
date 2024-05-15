using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class OrderItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderID = int.Parse(Request.QueryString["OrderID"]);
                orderIDLabel.Text = orderID.ToString();

                BindOrderListDataList(orderID);
                BindOrderSummaryRepeater(orderID);
            }
        }

        private void BindOrderListDataList(int orderID)
        {
            using (var db = new OrderDbContext())
            {
                var orderDetails = db.Order
                    .Where(o => o.Order_ID == orderID)
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

        private void BindOrderSummaryRepeater(int orderID)
        {
            using (var db = new OrderDbContext())
            {
                var orderDetails = db.Order
                 .Where(o => o.Order_ID == orderID)
                 .Select(o => new {
                     Order_ID = o.Order_ID,
                     Payment_DateTime = o.Payments.FirstOrDefault().Payment_DateTime,
                     Payment_Method = o.Payments.FirstOrDefault().Payment_Method,
                     Payment_Status = o.Payments.FirstOrDefault().Payment_Status,
                     Delivery_Status = o.Payments.FirstOrDefault().Delivery.Delivery_Status,
                     Sub_Total = o.Subtotal,
                     Total_Item = o.OrderLists.Where(ol => o.Order_ID == ol.Order_ID).Sum(ol => ol.Qty),
                     Shipping_Amount = o.Payments.FirstOrDefault().Shipping_Amount,
                     Total_Payment = o.Payments.FirstOrDefault().Total_Payment
                 }).ToList();

                orderSummaryFormView.DataSource = orderDetails;
                orderSummaryFormView.DataBind();
            }
        }

        protected void submitForm(object sender, EventArgs e)
        {
            int orderID = (int)orderSummaryFormView.DataKey.Value;

            DropDownList ddlPaymentStatus = orderSummaryFormView.FindControl("paymentStatuslbl") as DropDownList;

            if (ddlPaymentStatus != null)
            {
                string newPaymentStatus = ddlPaymentStatus.SelectedValue;

                using (var db = new OrderDbContext())
                {
                    var payment = db.Payment.FirstOrDefault(p => p.Order_ID == orderID);
                    if (payment != null)
                    {
                        payment.Payment_Status = newPaymentStatus;
                        db.SaveChanges();

                        ScriptManager.RegisterStartupScript(this, GetType(), "showUpdateSuccess", "showUpdateSuccess();", true);
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("No payment record found for Order ID: " + orderID);
                    }
                }
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("DropDownList not found in the FormView");
            }
        }
    }
}
