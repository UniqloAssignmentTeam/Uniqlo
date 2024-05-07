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
        public decimal Item_Price { get; set; }
        public int Quantity { get; set; }


    }

}
