using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { //dummy cart
                List<CartItem> cart = new List<CartItem>
                {
                    new CartItem { Quantity_Id = 1, Name = "T-shirt", Price = 15.99m, Color = "Red", Size = "M", Item_Price = 15.99m, Quantity = 2 },
                    new CartItem { Quantity_Id = 2, Name = "Jeans", Price = 40.50m, Color = "Blue", Size = "32", Item_Price = 40.50m, Quantity = 1 },
                    new CartItem { Quantity_Id = 3, Name = "Sneakers", Price = 60.00m, Color = "White", Size = "9", Item_Price = 60.00m, Quantity = 1 },
                    new CartItem { Quantity_Id = 4, Name = "Jacket", Price = 99.95m, Color = "Black", Size = "L", Item_Price = 99.95m, Quantity = 1 },
                    new CartItem { Quantity_Id = 5, Name = "Cap", Price = 12.99m, Color = "Green", Size = "One size", Item_Price = 12.99m, Quantity = 3 }
                };

                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();

                lblTotalPrice.Text = "RM 100";
                lblDeliveryCharges.Text = "RM 100";
                lblGrandTotal.Text = "RM 100";
            }
        }
    }
}