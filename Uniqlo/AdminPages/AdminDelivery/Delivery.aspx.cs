using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;

namespace Uniqlo.AdminPages
{
    public partial class Delivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDeliveries();
        }

        private void BindDeliveries()
        {
            using (var db = new DeliveryDbContext())
            {
                var deliveries = db.delivery
    .Include("Shipping_Address")
    .Select(d => new
    {
        Delivery_ID = d.Delivery_ID,
        DeliveryAddress = (d.Shipping_Address.Address ?? "") + ", " +
                          (d.Shipping_Address.City ?? "") + ", " +
                          (d.Shipping_Address.State ?? "") + " " +
                          (d.Shipping_Address.Postcode ?? "") + ", " +
                          (d.Shipping_Address.Country ?? ""),
        DeliveryNote = d.Delivery_Note,
        DeliveryStatus = d.Delivery_Status
    }).ToList();
            }
        }
    }

    class DeliveryTableItem
    {

    }
}