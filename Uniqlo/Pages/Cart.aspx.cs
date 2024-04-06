using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class Cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Calculate total items and total price
            int totalItems = 9 + 5; // Total quantity of both items
            decimal totalPrice = 809.91m + 499.95m; // Total price of both items
            // Update total items and total price in the markup
            totalItemsLabel.InnerText = totalItems.ToString();
            totalPriceLabel.InnerText = totalPrice.ToString("F2"); // Display total price with two decimal places
        }
    }
}