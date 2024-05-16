using System;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class OrderReport : System.Web.UI.Page
    {
        protected string LabelsJson;
        protected string DaysToFulfillJson;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateReport();
            }
        }

        private void GenerateReport()
        {
            using (var context = new OrderDbContext())
            {
                var data = (from o in context.Order
                            join c in context.Customer on o.Customer_ID equals c.Customer_ID
                            join p in context.Payment on o.Order_ID equals p.Order_ID
                            join d in context.Delivery on p.Delivery_ID equals d.Delivery_ID
                            where d.Delivery_Status == "Delivered"
                            select new
                            {
                                o.Order_ID,
                                CustomerName = c.Name,
                                OrderDate = p.Payment_DateTime,
                                d.Delivery_Status,
                                d.Delivery_Note,
                                DaysToFulfill = System.Data.Entity.DbFunctions.DiffDays(p.Payment_DateTime, DateTime.Now)
                            })
                           .OrderByDescending(x => x.DaysToFulfill)
                           .ToList();

                // Prepare data for the chart
                var labels = data.Select(d => d.Order_ID.ToString()).ToArray();
                var daysToFulfill = data.Select(d => d.DaysToFulfill ?? 0).ToArray();

                // Serialize data to JSON
                var jsSerializer = new JavaScriptSerializer();
                LabelsJson = jsSerializer.Serialize(labels);
                DaysToFulfillJson = jsSerializer.Serialize(daysToFulfill);
            }
        }


    }
}
