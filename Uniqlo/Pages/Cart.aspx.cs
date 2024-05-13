using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class Cart : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
                cartItems = GetCartItems(cartItems);
                Session["Cart"] = cartItems; // Save the updated cartItems back to the session
                rptCartItems.DataSource = cartItems;
                rptCartItems.DataBind();
            }
        }

        public List<CartItem> GetCartItems(List<CartItem> cartItems)
        {
            if (cartItems == null || !cartItems.Any())
                return new List<CartItem>();

            List<CartItem> items = new List<CartItem>();
            string connectionString = cs;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Prepare a command to execute the query
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = @"
        SELECT 
            q.Quantity_Id, p.Product_Name, p.Description, 
            q.Size, q.Color, p.Price, 
            (p.Price - ISNULL(d.Discount_Amount, 0)) as DiscountedPrice,
            q.Image_ID  -- Modify the query to retrieve Image ID instead of product image
        FROM 
            Quantity q
            JOIN Product p ON q.Product_ID = p.Product_ID
            LEFT JOIN Discount d ON p.Product_ID = d.Product_ID AND d.Status = 'Active'
        WHERE 
            q.Quantity_Id IN ({0})";

                // Constructing parameter placeholders and adding parameters to avoid SQL Injection
                var parameterNames = new List<string>();
                var parametersToIds = new Dictionary<string, int>();
                for (int i = 0; i < cartItems.Count; i++)
                {
                    string paramName = "@QuantityId" + i;
                    parameterNames.Add(paramName);
                    command.Parameters.AddWithValue(paramName, cartItems[i].Quantity_Id);
                    parametersToIds[paramName] = cartItems[i].Quantity_Id;
                }

                // Inserting the parameters in the SQL command text
                command.CommandText = string.Format(command.CommandText, string.Join(",", parameterNames));

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int quantityId = Convert.ToInt32(reader["Quantity_Id"]);
                        CartItem item = new CartItem
                        {
                            Quantity_Id = quantityId,
                            Name = reader["Product_Name"].ToString(),
                            Description = reader["Description"].ToString(),
                            Size = reader["Size"].ToString(),
                            Color = reader["Color"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"]),
                            Quantity = cartItems.First(c => c.Quantity_Id == quantityId).Quantity,
                            OriginalPrice = Convert.ToDecimal(reader["Price"]), // Assuming original price is just the listed price
                            DiscountedPrice = Convert.ToDecimal(reader["DiscountedPrice"]),
                            Image_Id = Convert.ToInt32(reader["Image_ID"])
                        };
                        items.Add(item);
                    }
                }
            }
            return items;
        }

    }
}
