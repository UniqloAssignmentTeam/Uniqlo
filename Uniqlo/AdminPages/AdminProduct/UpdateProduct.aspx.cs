using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using static Uniqlo.Image;
using static Uniqlo.Product;
using Newtonsoft.Json;
using static Uniqlo.AdminPages.UpdateProduct;
using static Uniqlo.AdminPages.AddProduct;
using Uniqlo.AdminPages.AdminStaff;
using System.Collections;
using static Uniqlo.Quantity;

namespace Uniqlo.AdminPages
{
    public partial class UpdateProduct : System.Web.UI.Page
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
                }
            }

        }

        private void BindFormView(int productId)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var productList = db.Product
                        .Where(p => p.Product_ID == productId)
                        .Include(p => p.Category)
                        .Include(p => p.Quantities.Select(q => q.Image))
                        .Select(p => new
                        {
                            Product_ID = p.Product_ID,
                            Product_Name = p.Product_Name,
                            Description = p.Description,
                            Price = p.Price,
                            Category = p.Category,
                            ColorGroups = p.Quantities
                                .Where(q => !q.IsDeleted)
                                .GroupBy(q => q.Color)
                                .Select(g => new
                                {
                                    Color = g.Key,
                                    Quantities = g.ToList(),
                                    FirstImageId = g.Select(q => q.Image_ID).FirstOrDefault()
                                }).ToList()
                        }).ToList();


                    formView.DataSource = productList;
                    formView.DataBind();
                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when retrieving product.');", true);
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
                }
                else
                {
                    // Log error or handle case where dataList is not found
                }
            }
        }    
        
        protected void btnDelete_Click(object sender, CommandEventArgs e)
        {
            int imageId = Convert.ToInt32(e.CommandArgument);

            try
            {
                using (var dbContext = new ImageDbContext())
                {
                    var quantitiesToUpdate = dbContext.Quantities.Where(q => q.Image_ID == imageId).ToList();

                    foreach (var quantity in quantitiesToUpdate)
                    {
                        // Instead of removing, update IsDeleted to 1
                        quantity.IsDeleted = Convert.ToBoolean(1);
                    }

                    dbContext.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Deleting product.');", true);
            }

        }

        /*ADD PRODUCT*/

        public class ColorSize
        {
            public string Color { get; set; }
            public string SizeS { get; set; }
            public string SizeM { get; set; }
            public string SizeL { get; set; }
            public string SizeXL { get; set; }
            public string Image { get; set; }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                TextBox txtProductName = formView.FindControl("txtProdName") as TextBox;
                TextBox txtProductDescription = formView.FindControl("txtDescription") as TextBox;
                TextBox txtProductPrice = formView.FindControl("txtPrice") as TextBox;
                DropDownList ddlCategory = formView.FindControl("ddlCategory") as DropDownList;
                DropDownList ddlGender = formView.FindControl("ddlGender") as DropDownList;

                string productName = txtProductName.Text;
                string productDescription = txtProductDescription.Text;
                double productPrice = Double.Parse(txtProductPrice.Text);
                string category = ddlCategory.Text;
                string gender = ddlGender.Text;


                string jsonData = HiddenFieldData.Value;
                List<ColorSize> colorSizes = JsonConvert.DeserializeObject<List<ColorSize>>(jsonData);

                try
                {
                   using (var dbContext = new ProductDbContext())
                    {
                        int productIDQuery = int.Parse(Request.QueryString["ProdID"]);
                        var productID = dbContext.Product.FirstOrDefault(p => p.Product_ID == productIDQuery);
                        var categoryID = dbContext.Category.Where(c => c.Name == category && c.Gender.ToString() == gender).Select(c => c.Category_ID).FirstOrDefault();


                        if (productID != null)
                        {
                            productID.Product_Name = productName;
                            productID.Description = productDescription;
                            productID.Price = productPrice;
                            productID.Category_ID = categoryID;
                            productID.IsDeleted = false;

                            dbContext.SaveChanges();


                            foreach (var colorSize in colorSizes)
                            {
                                if (!String.IsNullOrWhiteSpace(colorSize.Image))
                                {
                                    // Handling the base64 image string
                                    string base64Image = colorSize.Image.Split(',')[1]; // Ensuring only the base64 part is taken
                                    try
                                    {
                                        byte[] imageBytes = Convert.FromBase64String(base64Image);
                                        Image newImage = new Image
                                        {
                                            ProductImage = imageBytes
                                        };
                                        dbContext.Image.Add(newImage);
                                        dbContext.SaveChanges();

                                        // Linking the image with product details
                                        foreach (var sizeProperty in typeof(ColorSize).GetProperties().Where(p => p.Name.StartsWith("Size")))
                                        {
                                            string sizeValue = sizeProperty.GetValue(colorSize) as string;
                                            if (!string.IsNullOrEmpty(sizeValue))
                                            {
                                                string size = sizeProperty.Name.Substring(4);
                                                Quantity newQuantity = new Quantity
                                                {
                                                    Product_ID = productIDQuery,
                                                    Image_ID = newImage.Image_ID,
                                                    Color = colorSize.Color,
                                                    Size = size,
                                                    Qty = Int32.Parse(sizeValue)
                                                };
                                                dbContext.Quantity.Add(newQuantity);
                                            }
                                        }
                                    }
                                    catch (FormatException fe)
                                    {
                                        Console.WriteLine("Failed to convert Base64 string to byte array. Error: " + fe.Message);
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.WriteLine("Error saving image data: " + ex.Message);
                                    }
                                }
                            }
                            dbContext.SaveChanges();
                        }
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Product and details update successfully!');", true);
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                    
                }

            }
        }


    }
}