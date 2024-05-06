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
        public int Product_Id { get; set; }
        public int Quantity_Id { get; set; }
        public string Product_Name { get; set; }
        public string Color { get; set; }
        public string Size { get; set; }
        public decimal Item_Price { get; set; }
        public int Quantity { get; set; }

        //to be added in add to cart
        public List<CartItem> GetCartItems(List<int> quantityIds)
        {
            List<CartItem> cartItems = new List<CartItem>();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Construct SQL with JOIN
                var sql = @"
            SELECT q.Quantity_ID, q.Product_ID, p.Product_Name, p.Price, q.Color, q.Size
            FROM Quantity q
            INNER JOIN Product p ON q.Product_ID = p.Product_ID
            WHERE q.Quantity_ID IN ({0})";

                // Build the SQL IN clause parameters dynamically
                var parameters = new List<SqlParameter>();
                var parameterNames = new List<string>();
                for (int i = 0; i < quantityIds.Count; i++)
                {
                    var parameterName = "@quantityId" + i;
                    parameters.Add(new SqlParameter(parameterName, quantityIds[i]));
                    parameterNames.Add(parameterName);
                }

                sql = string.Format(sql, string.Join(", ", parameterNames));

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddRange(parameters.ToArray());

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            cartItems.Add(new CartItem
                            {
                                Product_Id = (int)reader["Product_ID"],
                                Quantity_Id = (int)reader["Quantity_ID"],
                                Product_Name = reader["Product_Name"].ToString(),
                                Item_Price = (decimal)reader["Price"],
                                Color = reader["Color"].ToString(),
                                Size = reader["Size"].ToString(),
                                Quantity = 1  // Default quantity; adjust based on your application logic
                            });
                        }
                    }
                }
            }

            return cartItems;
        }
    }

}
