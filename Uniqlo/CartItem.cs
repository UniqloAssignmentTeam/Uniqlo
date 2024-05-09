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
        public decimal Price { get; set; }
        public string Color { get; set; }
        public string Size { get; set; }
        public decimal Item_Price // Total price for all units of this item
        {
            get { return Price * Quantity; }
        }
        public int Quantity { get; set; }


    }

}
