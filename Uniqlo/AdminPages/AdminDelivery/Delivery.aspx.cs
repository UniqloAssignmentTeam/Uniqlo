using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;

namespace Uniqlo.AdminPages
{
    public partial class Delivery : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            bindRepeater();
        }

        private void bindRepeater()
        {
            string connString = cs;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
            SELECT 
                d.Delivery_ID,
                sa.Address + ', ' + sa.State + ', ' + sa.City + ', ' + sa.Postcode + ', ' + sa.Country AS DeliveryAddress,
                d.Delivery_Status,
                p.Order_ID
            FROM 
                Delivery d
            INNER JOIN 
                Shipping_Address sa ON d.Address_ID = sa.Address_ID
            INNER JOIN 
                Payment p ON d.Delivery_ID = p.Delivery_ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDeliveries.DataSource = dt;
                        rptDeliveries.DataBind();
                    }
                }
            }
        }
    }
}
       