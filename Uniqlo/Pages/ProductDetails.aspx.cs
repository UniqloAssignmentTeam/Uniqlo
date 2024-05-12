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
                }
            }

        }

        private void BindFormView(int productId)
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
                            .Where(q => !q.IsDeleted)
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
                    // Log error or handle case where dataList is not found
                }
            }
        }
        private void BindColorRadioButtonList(int prodID)
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


        protected void RadioButtonListColors_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbList = (RadioButtonList)sender;
            string selectedColor = rbList.SelectedValue;

            RadioButtonList rbSizes = (RadioButtonList)formView.FindControl("RadioButtonListSizes");
            Session["selectedColor"] = selectedColor;
            Session["selectedSize"] = rbSizes.SelectedValue;

            int productId = 0;
            if (Request.QueryString["ProdID"] != null && int.TryParse(Request.QueryString["ProdID"], out productId))
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


        protected void RadioButtonListSizes_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbSizes = (RadioButtonList)sender;
            string selectedSize = rbSizes.SelectedValue;
            RadioButtonList rbColors = (RadioButtonList)formView.FindControl("RadioButtonListColors");
            string selectedColor = rbColors.SelectedValue;
            Label labelQuantity = (Label)formView.FindControl("LabelQuantity");
            Session["selectedColor"] = selectedSize;
            Session["selectedSize"] = selectedColor;


            int productId = 0;
            if (Request.QueryString["ProdID"] != null && int.TryParse(Request.QueryString["ProdID"], out productId))
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
                }
            }
            else
            {
                labelQuantity.Text = "Invalid product ID.";
            }
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
            // Access the selected size and color
            string selectedSize = (string)Session["selectedSize"];
            string selectedColor = (string)Session["selectedColor"];
            TextBox txtQty = (TextBox)formView.FindControl("txtQty");
            int quantity = Int32.Parse(txtQty.Text);

            int quantityId = GetQuantityId(int.Parse(Request.QueryString["ProdID"]), selectedSize, selectedColor);

            CartItem item = new CartItem
            {
                Quantity_Id = quantityId,
                Size = selectedSize,
                Color = selectedColor,
                Quantity = quantity
            };

            if (Session["Cart"] == null)
            {
                // Create a new cart and add the item to it
                List<CartItem> cart = new List<CartItem>();
                cart.Add(item);
                Session["Cart"] = cart;
            }
            else
            {
                // Retrieve the existing cart and add the item to it
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                cart.Add(item);
                Session["Cart"] = cart;
            }


            // Redirect the user back to the product details page
            Response.Redirect("ProductDetails.aspx?ProdID=" + Request.QueryString["ProdID"]);
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
        /*ADD Function*/



    }

}