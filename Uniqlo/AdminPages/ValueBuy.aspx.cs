using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages
{
    public partial class ValueBuy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // Define the btnEdit_Click event handler method
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Get the button that raised the event
            Button btnEdit = (Button)sender;

            // Get the ProductId from the CommandArgument of the button
            int productId = Convert.ToInt32(btnEdit.CommandArgument);

            // Redirect to the edit product page with the ProductId as query string parameter
            Response.Redirect("EditProduct.aspx?ProductId=" + productId);
        }

        // Define the btnDelete_Click event handler method
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Get the button that raised the event
            Button btnDelete = (Button)sender;

            // Get the ProductId from the CommandArgument of the button
            int productId = Convert.ToInt32(btnDelete.CommandArgument);

            // Call a method to delete the product with the specified ProductId
            DeleteProduct(productId);

            // Rebind the GridView to reflect the changes
            BindProducts();
        }

        // Method to delete a product by ProductId
        private void DeleteProduct(int productId)
        {
            // Add your logic to delete the product from the database or any other data source
            // For example:
            // productService.DeleteProduct(productId);
        }

        // Method to bind the GridView with products data
        private void BindProducts()
        {
            // Add your logic to fetch and bind products data to the GridView
            // For example:
            // gvProducts.DataSource = productService.GetProducts();
            // gvProducts.DataBind();
        }
    }
}
