using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Uniqlo.AdminPages.AdminProduct;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Diagnostics;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.Product;
using System.Runtime.Remoting.Contexts;
using System.IO;


namespace Uniqlo.AdminPages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        //string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        public class ColorSize
        {
            public string Color { get; set; }
            public string SizeS { get; set; }
            public string SizeM { get; set; }
            public string SizeL { get; set; }
            public string SizeXL { get; set; }
            public string Image { get; set; }
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            if (HiddenFieldData.Value.Trim() == "" || HiddenFieldData.Value == "[]")
            {
                cvHiddenFieldData.IsValid = false;
                cvHiddenFieldData.ErrorMessage = "Please add a color.";
            }

            if (Page.IsValid)
            {
                if (string.IsNullOrWhiteSpace(txtProductName.Text))
                {
                    rfvProductName.Text = "Product name is required.";
                    isValid = false;
                }
                else
                {
                    rfvProductName.Text = "";
                    
                }

                if (string.IsNullOrWhiteSpace(txtDescription.Text))
                {
                    txtDescription.Text = "Product description is required.";
                    isValid = false;
                }
                else
                {
                    txtDescription.Text = "";
                    
                }

                double productPrice;
                if (!double.TryParse(txtPrice.Text, out productPrice))
                {
                    rfvPrice.Text = "Valid price is required.";
                    isValid = false;
                }
                else if (productPrice <= 0)
                {
                    revPrice.Text = "Price must be greater than zero.";
                    isValid = false;
                }
                else
                {
                    revPrice.Text = "";
                    
                }

                if (ddlCategory.SelectedIndex <= 0 )
                {
                    rfvCategory.Text = "Category selection is required.";
                    isValid = false;
                }
                else
                {
                    rfvCategory.Text = "";
                    
                }                
                
                
                if (ddlGender.SelectedIndex <= 0 )
                {
                    rfvGender.Text = "Gender selection is required.";
                    isValid = false;
                }
                else
                {
                    rfvGender.Text = "";
                    
                }

                if (!isValid)
                {
                    return;
                }

                string productName = txtProductName.Text;
                string productDescription = txtDescription.Text;
                productPrice = Double.Parse(txtPrice.Text);
                string category = ddlCategory.SelectedValue;
                string gender = ddlGender.SelectedValue;
                string jsonData = HiddenFieldData.Value;
                List<ColorSize> colorSizes = JsonConvert.DeserializeObject<List<ColorSize>>(jsonData);

                try
                {
                    using (var db = new ProductDbContext())
                    {
                        var categoryID = db.Category.Where(c => c.Name == category && c.Gender.ToString() == gender).Select(c => c.Category_ID).FirstOrDefault();

                        Product newProduct = new Product
                        {
                            Product_Name = productName,
                            Description = productDescription,
                            Price = productPrice,
                            Category_ID = categoryID
                        };
                        db.Product.Add(newProduct);
                        db.SaveChanges();

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
                                    db.Image.Add(newImage);
                                    db.SaveChanges();

                                    // Linking the image with product details
                                    foreach (var sizeProperty in typeof(ColorSize).GetProperties().Where(p => p.Name.StartsWith("Size")))
                                    {
                                        string sizeValue = sizeProperty.GetValue(colorSize) as string;
                                        if (!string.IsNullOrEmpty(sizeValue))
                                        {
                                            string size = sizeProperty.Name.Substring(4);
                                            Quantity newQuantity = new Quantity
                                            {
                                                Product_ID = newProduct.Product_ID,
                                                Image_ID = newImage.Image_ID,
                                                Color = colorSize.Color,
                                                Size = size,
                                                Qty = Int32.Parse(sizeValue)
                                            };
                                            db.Quantity.Add(newQuantity);
                                        }
                                    }
                                }
                                catch (FormatException fe)
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Failed to convert Base64 string to byte array. Error: " + fe.Message + " ');", true);
                                }
                                catch (Exception ex)
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Error saving image data: " + ex.Message + "');", true);
                                }
                            }
                        }
                        db.SaveChanges();
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Product and details added successfully!');", true);
                    Response.Redirect("~/AdminPages/AdminProduct/ProductHome.aspx");
                }
                catch (Exception ex)
                {

                    // Optionally display error message on the page
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when add product.');", true);
                }


            }
        }





    }
}
