
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;
using System.Data.Entity;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using System.Collections;
using Uniqlo.Pages.Categories.Women;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

namespace Uniqlo.Pages
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                formView.DataBound += new EventHandler(formView_DataBound);

                int productId = 0;
                if (Request.QueryString["ProdID"] != null && int.TryParse(Request.QueryString["ProdID"], out productId))
                {

                    BindFormView(productId);
                    FindQuantity(productId);
                    BindOutsideViewControl();
                    FirstImageId(productId);
                }
                RadioButtonList rbList = (RadioButtonList)formView.FindControl("RadioButtonListColors");
                rbList.ClearSelection();
            }

        }

        private void BindFormView(int productId)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var today = DateTime.Today;

                    var productList = db.Product
                        .Where(p => p.Product_ID == productId && !p.IsDeleted)
                        .Include(p => p.Category)
                        .Include(p => p.Discounts)
                        .Include(p => p.Quantities.Select(q => q.Image))
                        .Select(p => new
                        {
                            Product_ID = p.Product_ID,
                            Product_Name = p.Product_Name,
                            Description = p.Description,
                            Price = p.Price,
                            DiscountAmount = p.Discounts
                                .Where(d => d.Status == "Active" && d.Start_Date <= today && d.End_Date >= today)
                                .Select(d => d.Discount_Amount)
                                .FirstOrDefault(), // Assumes applying the first active discount found
                            Category = p.Category,
                            AverageRating = p.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Average(r => (int?)r.Rating) ?? 0,
                            ReviewCount = p.Quantities.SelectMany(q => q.OrderLists).SelectMany(ol => ol.Reviews).Count(),
                            Reviews = p.Quantities
                                .SelectMany(q => q.OrderLists)
                                .SelectMany(ol => ol.Reviews)
                                .Select(r => new {
                                    customerRating = r.Rating,
                                    customerReview = r.Review1,
                                    reviewDateSubmit = r.Date_Submitted,
                                    CustomerName = r.OrderList.Order.Customer.Name
                                }).ToList(),
                            ColorGroups = p.Quantities
                                .Where(q => q.IsDeleted == false)
                                .GroupBy(q => q.Color)
                                .Select(g => new
                                {
                                    Color = g.Key,
                                    Quantities = g.ToList(),
                                    FirstImageId = g.Select(q => q.Image_ID).FirstOrDefault(),
                                    ImageCount = g.Select(q => q.Image_ID).Distinct().Count()
                                }).ToList()
                        }).ToList();


                    formView.DataSource = productList;
                    formView.DataBind();


                    formView1.DataSource = productList;
                    formView1.DataBind();


                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error', 'An error occurred when retrieving product details.', 'error');", true);
            }

        }


        private void BindOutsideViewControl()
        {
            if (formView.Row != null) // Check if there is a data row available
            {
                HiddenField hfProductId = (HiddenField)formView.FindControl("productIdHidden");
                HiddenField hfProductName = (HiddenField)formView.FindControl("productNameHidden");
                HiddenField hfProductDiscount = (HiddenField)formView.FindControl("productDiscountHidden");
                HiddenField hfProductPrice = (HiddenField)formView.FindControl("productPriceHidden");
                HiddenField hfProductDesc = (HiddenField)formView.FindControl("productDescHidden");

                string productId = hfProductId.Value;
                string productName = hfProductName.Value;
                string productDiscount = hfProductDiscount.Value;
                string productPrice = hfProductPrice.Value;
                string productDescription = hfProductDesc.Value;

                prodIdHidden.Value = productId;
                prodNameHidden.Value = productName;
                prodDiscountHidden.Value = productDiscount;
                prodPriceHidden.Value = productPrice;
                prodDescHidden.Value = productDescription;

            }
        }

        private void FirstImageId(int productID)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var imageId = db.Quantity
                                    .Where(q => q.Product_ID == productID)
                                    .Select(q => q.Image_ID)
                                    .FirstOrDefault();


                    var firstQuantity = db.Quantity
                         .Where(q => q.Product_ID == productID)
                         .FirstOrDefault();

                    if (firstQuantity != null)
                    {
                        var firstImageId = db.Quantity
                                            .Where(q => q.Quantity_ID == firstQuantity.Quantity_ID)
                                            .Select(q => q.Image_ID)
                                            .FirstOrDefault();

                        prodImageID.Value = firstImageId.ToString();
                    }


                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error', 'An error occurred when retrieving Image ID.', 'error');", true);
            }

        }

        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var repeater = e.Item.FindControl("RepeaterSizes") as Repeater;
                if (repeater != null)
                {
                    var quantities = ((dynamic)e.Item.DataItem).Quantities;
                    repeater.DataSource = quantities;
                    repeater.DataBind();
                }
                else
                {
                    // Log error or handle case where repeater is not found
                }
            }
        }




        protected void formView_DataBound(object sender, EventArgs e)
        {
            if (formView.DataItem != null)
            {

                DataList dataList = formView.FindControl("dataList") as DataList;

                if (dataList != null)
                {
                    var data = ((dynamic)formView.DataItem).ColorGroups;
                    dataList.DataSource = data;
                    dataList.DataBind();

                    int count = data.Count;
                    dataList.RepeatColumns = count > 4 ? 4 : count;
                    BindColorRadioButtonList(Int32.Parse(Request.QueryString["ProdID"]));
                }
                else
                {

                }
            }
        }
        private void BindColorRadioButtonList(int prodID)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    RadioButtonList rbList = (RadioButtonList)formView.FindControl("RadioButtonListColors");



                    var colors = db.Quantity
                   .Where(q => q.Product_ID == prodID && !q.IsDeleted)  // Filter by Product_ID
                   .Select(q => q.Color)
                   .Distinct()
                   .ToList();

                    rbList.DataSource = colors;
                    rbList.DataBind();

                    if (colors.Any())
                    {
                        rbList.SelectedIndex = 0;
                        RadioButtonListColors_SelectedIndexChanged(rbList, EventArgs.Empty);  // Manually trigger the event to load sizes for the first color
                    }


                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error', 'An error occurred when retrieving product.', 'error');", true);
            }

        }


        protected void RadioButtonListColors_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbList = (RadioButtonList)sender;
            string selectedColor = rbList.SelectedValue;

            RadioButtonList rbSizes = (RadioButtonList)formView.FindControl("RadioButtonListSizes");
            Session["selectedColor"] = selectedColor;

            int productId = 0;
            if (Request.QueryString["ProdID"] != null && int.TryParse(Request.QueryString["ProdID"], out productId))
            {
                try
                {
                    using (var db = new ProductDbContext())
                    {
                        var sizes = db.Quantity
                                      .Where(q => q.Product_ID == productId && q.Color == selectedColor && !q.IsDeleted)
                                      .Select(q => q.Size)
                                      .Distinct()
                                      .ToList();

                        // Define the custom order
                        var sizeOrder = new List<string> { "S", "M", "L", "XL" };

                        sizes = sizes.OrderBy(s => sizeOrder.IndexOf(s)).ToList();

                        rbSizes.DataSource = sizes;
                        rbSizes.DataBind();

                        // Get the maximum stock value among all sizes for the selected color
                        int maxStock = db.Quantity
                                          .Where(q => q.Product_ID == productId && q.Color == selectedColor && !q.IsDeleted)
                                          .Max(q => q.Qty);

                        // Update the MaxLength of txtQty based on the maximum stock value
                        TextBox txtQty = (TextBox)formView.FindControl("txtQty");
                        txtQty.MaxLength = maxStock.ToString().Length;
                        rbSizes.Visible = true;
                        UpdateQuantityTextboxState();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error', 'An error occurred when retrieving product color.', 'error');", true);
                }
            }
            else
            {
                rbSizes.Items.Clear();
                rbSizes.Items.Add(new ListItem("Invalid product ID", ""));
            }
        }
        protected void FindQuantity(int productId)
        {
            Label lblSize = (Label)formView.FindControl("lblSize");

            try
            {
                using (var db = new ProductDbContext())
                {
                    var sizes = db.Quantity
                                  .Where(q => q.Product_ID == productId && !q.IsDeleted)
                                  .Select(q => q.Size)
                                  .Distinct()
                                  .ToList();

                    if (sizes == null || sizes.Count == 0)
                    {
                        lblSize.Text = "Out of stock";
                    }
                    else
                    {
                        lblSize.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error', 'An error occurred when retrieving product quantity.', 'error');", true);
            }


        }



        protected void RadioButtonListSizes_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbSizes = (RadioButtonList)sender;
            string selectedSize = rbSizes.SelectedValue;

            RadioButtonList rbColors = (RadioButtonList)formView.FindControl("RadioButtonListColors");
            string selectedColor = rbColors.SelectedValue;

            Label labelQuantity = (Label)formView.FindControl("LabelQuantity");
            Session["selectedSize"] = selectedSize;


            int productId = 0;
            if (Request.QueryString["ProdID"] != null && int.TryParse(Request.QueryString["ProdID"], out productId))
            {
                try
                {
                    using (var db = new ProductDbContext())
                    {
                        var quantity = db.Quantity
                                        .Where(q => q.Product_ID == productId && q.Color == selectedColor && q.Size == selectedSize && !q.IsDeleted)
                                        .Select(q => q.Qty)
                                        .FirstOrDefault();

                        labelQuantity.Text = quantity != 0 ? $"  ({quantity})" : "  (Out of Stock)";

                        // Update the MaxLength of txtQty based on the selected size's stock value
                        TextBox txtQty = (TextBox)formView.FindControl("txtQty");
                        txtQty.MaxLength = quantity.ToString().Length;

                        UpdateQuantityTextboxState();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error', 'An error occurred when retrieving product size.', 'error');", true);
                }

            }
            else
            {
                labelQuantity.Text = "Invalid product ID.";
            }
        }



        private void UpdateQuantityTextboxState()
        {
            TextBox txtQty = (TextBox)formView.FindControl("txtQty");
            RadioButtonList rbSizes = (RadioButtonList)formView.FindControl("RadioButtonListSizes");
            RadioButtonList rbColors = (RadioButtonList)formView.FindControl("RadioButtonListColors");

            bool colorSelected = !string.IsNullOrEmpty(rbColors.SelectedValue);
            bool sizeSelected = !string.IsNullOrEmpty(rbSizes.SelectedValue);

            txtQty.Enabled = colorSelected && sizeSelected;
        }






        public string GenerateStars(double rating)
        {
            var fullStars = (int)rating; // Number of full stars
            var halfStar = rating % 1 != 0; // Check if there is a half star
            var noStars = 5 - fullStars - (halfStar ? 1 : 0); // Remaining empty stars
            var html = string.Empty;

            // Add full stars
            for (int i = 0; i < fullStars; i++)
            {
                html += "<i class='fas fa-star star'></i>";
            }

            // Add half star
            if (halfStar)
            {
                html += "<i class='fas fa-star-half-alt star'></i>";
            }

            // Add empty stars
            for (int i = 0; i < noStars; i++)
            {
                html += "<i class='far fa-star star'></i>";
            }

            return html;
        }





















        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                // Access the selected size and color from session
                string selectedSize = (string)Session["selectedSize"];
                string selectedColor = (string)Session["selectedColor"];

                // Check if the user has selected both size and color
                if (string.IsNullOrEmpty(selectedSize) || string.IsNullOrEmpty(selectedColor))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "selectionError", "Swal.fire('Error', 'Please select both size and color.', 'error');", true);
                    return;
                }

                // Retrieve product ID from query string
                if (!int.TryParse(Request.QueryString["ProdID"], out int productId))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "productError", "Swal.fire('Error', 'Invalid product ID.', 'error');", true);
                    return;
                }

                // Retrieve the available stock and quantity ID for the selected size and color
                var stockInfo = GetStockAndQuantityId(productId, selectedSize, selectedColor);
                if (stockInfo.AvailableStock == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "noStockError", "Swal.fire('Error', 'No stock available for the selected product.', 'error');", true);
                    return;
                }

                // Get the quantity textbox and parse the entered quantity
                TextBox txtQty = (TextBox)formView.FindControl("txtQty");
                if (!int.TryParse(txtQty.Text, out int quantity) || quantity <= 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidQuantityError", "Swal.fire('Error', 'Please enter a valid quantity.', 'error');", true);
                    return;
                }

                // Check if the item already exists in the cart
                List<CartItem> cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();
                foreach (var item in cart)
                {
                    if (item.Size == selectedSize && item.Color == selectedColor)
                    {
                        // If the item already exists, check if adding the new quantity exceeds available stock
                        int totalQuantity = item.Quantity + quantity;

                        if (quantity > stockInfo.AvailableStock)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "overQuantityError", $"Swal.fire('Error', 'Only {stockInfo.AvailableStock} items available for the selected product. You cannot add {totalQuantity} items to the cart.', 'error');", true);
                            return;
                        }
                        else if (totalQuantity > stockInfo.AvailableStock)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "overQuantityError", $"Swal.fire('Error', 'Only {stockInfo.AvailableStock} items available for the selected product. You cannot add {totalQuantity} items to the cart.', 'error');", true);
                            return;
                        }
                        else
                        {
                            // Update the quantity of the existing item in the cart
                            item.Quantity = totalQuantity;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartSuccess", "Swal.fire('Success', 'Quantity updated in cart successfully!', 'success');", true);
                            return;
                        }
                    }
                    else
                    {
                        // Check if the entered quantity exceeds the available stock
                        if (quantity > stockInfo.AvailableStock)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "overQuantityError", $"Swal.fire('Error', 'Only {stockInfo.AvailableStock} items available for the selected product. You cannot add {quantity} items to the cart.', 'error');", true);
                            return;
                        }
                    }
                }

                // Check if the entered quantity exceeds the available stock if the product hasnt been add
                if (quantity > stockInfo.AvailableStock)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "overQuantityError", $"Swal.fire('Error', 'Only {stockInfo.AvailableStock} items available for the selected product. You cannot add {quantity} items to the cart.', 'error');", true);
                    return;
                }

                // If the item does not exist in the cart, create a new CartItem and add it to the cart
                CartItem newItem = new CartItem
                {
                    Quantity_Id = stockInfo.QuantityId,
                    Size = selectedSize,
                    Color = selectedColor,
                    Quantity = quantity
                };
                cart.Add(newItem);
                Session["Cart"] = cart;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartSuccess", "Swal.fire('Success', 'Item added to cart successfully!', 'success');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartError", $"Swal.fire('Error', '{ex.Message}', 'error');", true);
            }
        }


        private (int AvailableStock, int QuantityId) GetStockAndQuantityId(int productId, string selectedSize, string selectedColor)
        {
            using (var db = new ProductDbContext())
            {
                var quantityInfo = db.Quantity
                    .Where(q => q.Product_ID == productId && q.Color == selectedColor && q.Size == selectedSize && !q.IsDeleted)
                    .Select(q => new { q.Qty, q.Quantity_ID })
                    .FirstOrDefault();

                return (quantityInfo?.Qty ?? 0, quantityInfo?.Quantity_ID ?? 0);
            }
        }


        private int GetAvailableStock(int productId, string selectedSize, string selectedColor)
        {
            using (var db = new ProductDbContext())
            {
                return db.Quantity
                         .Where(q => q.Product_ID == productId && q.Color == selectedColor && q.Size == selectedSize && !q.IsDeleted)
                         .Select(q => q.Qty)
                         .FirstOrDefault(); // Assuming there's always a corresponding entry
            }
        }


        // Method to retrieve the quantity ID based on size, color, and product ID
        private int GetQuantityId(int productId, string selectedSize, string selectedColor)
        {
            using (var db = new ProductDbContext())
            {
                var quantityId = db.Quantity
                    .Where(q => q.Product_ID == productId && q.Size == selectedSize && q.Color == selectedColor)
                    .Select(q => q.Quantity_ID)
                    .FirstOrDefault();
                return quantityId;
            }
        }

        protected void fetchProductID(object sender, EventArgs e)
        {
            int productID = Int32.Parse(prodIdHidden.Value);

            Response.Redirect("/Pages/SendProductGmailToFriend.aspx?id=" + productID);
        }


    }

}