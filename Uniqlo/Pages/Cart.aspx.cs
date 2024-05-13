using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
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

        protected void btnRemoveItem_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "RemoveCartItem")
            {
                int quantityIdToRemove = Convert.ToInt32(e.CommandArgument);
                RemoveItemFromCart(quantityIdToRemove);
                List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
                rptCartItems.DataSource = cartItems;
                rptCartItems.DataBind();
            }
        }
        // Method to remove item from the cart and the database
        private void RemoveItemFromCart(int quantityId)
        {
            List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
            cartItems.RemoveAll(item => item.Quantity_Id == quantityId);
            Session["Cart"] = cartItems;
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            // Find the TextBox control that triggered the event
            TextBox txtQuantity = (TextBox)sender;

            // Find the parent control (item row) of the TextBox
            RepeaterItem item = (RepeaterItem)txtQuantity.Parent;

            // Find the Quantity_Id of the item from the CommandArgument
            int quantityId = Convert.ToInt32(((Button)item.FindControl("btnRemoveItem")).CommandArgument);

            // Find the current quantity value entered by the user
            int newQuantity = Convert.ToInt32(txtQuantity.Text);

            // Update the quantity of the item in the cart
            UpdateItemQuantity(quantityId, newQuantity);
        }

        private void UpdateItemQuantity(int quantityId, int newQuantity)
        {
            List<CartItem> cartItems = (List<CartItem>)Session["Cart"];

            // Find the item in the cart list
            CartItem itemToUpdate = cartItems.FirstOrDefault(item => item.Quantity_Id == quantityId);

            if (itemToUpdate != null)
            {
                // Update the quantity of the item
                itemToUpdate.Quantity = newQuantity;
            }

            // Save the updated cartItems back to the session
            Session["Cart"] = cartItems;

            // Rebind the Repeater to reflect the changes
            rptCartItems.DataSource = cartItems;
            rptCartItems.DataBind();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (rptCartItems.Items.Count > 0)
            {
                Response.Redirect("~/Pages/Delivery.aspx");
            }
            else
            {
                // Display an alert or message indicating that the cart is empty
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Your cart is empty. Please add items to proceed.');", true);
            }
        }
    }
}
