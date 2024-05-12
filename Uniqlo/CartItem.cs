using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Uniqlo
{
    public class CartItem
    {
        public int Quantity_Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Size { get; set; }
        public string Color { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        
        public decimal Item_Price // Total price for all units of this item
        {

            get 
            {
                if (DiscountedPrice > 0)
                    return DiscountedPrice * Quantity;
                else
                    return Price * Quantity;
            }
        }

        public decimal OriginalPrice { get; set; }
        public decimal DiscountedPrice { get; set; }

        public byte[] ImageData { get; set; } // Add this property for image data
    }

}
