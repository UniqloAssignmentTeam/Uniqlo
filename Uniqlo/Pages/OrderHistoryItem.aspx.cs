using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages;

namespace Uniqlo.Pages
{
    public partial class OrderHistoryItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderID = int.Parse(Request.QueryString["Order_ID"]);
                BindOrderListDataList(3,orderID);
                BindOrderSummaryRepeater(3,orderID);
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
                        Image_ID=ol.Quantity.Image_ID
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
        



    }
}