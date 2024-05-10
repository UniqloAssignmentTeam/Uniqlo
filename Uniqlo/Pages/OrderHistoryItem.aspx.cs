using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class OrderHistoryItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderListDataList(3);
            }
            

        }

        private void BindOrderListDataList(int customerID)
        {
            using (var db = new OrderDbContext())
            {
                var orderDetails = db.Order
                    .Where(o => o.Customer_ID == customerID)
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


     


    }
}