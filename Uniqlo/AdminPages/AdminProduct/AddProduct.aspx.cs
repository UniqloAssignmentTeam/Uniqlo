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
using System.Data.Entity;

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
            string test = txtDescription.Text;

            if (HiddenFieldData.Value.Trim() == "" || HiddenFieldData.Value == "[]")
            {
                cvHiddenFieldData.IsValid = false;
                cvHiddenFieldData.ErrorMessage = "Please add a color.";
                ScriptManager.RegisterStartupScript(this, GetType(), "validationAlert", "Swal.fire('Error!', 'Please add a color.', 'error');", true);
                return; // Exit the method to prevent further execution
            }

            if (Page.IsValid)
            {
                string productName = txtProductName.Text;
                string productDescription = txtDescription.Text;
                double productPrice = double.Parse(txtPrice.Text);
                string category = ddlCategory.SelectedValue;
                string gender = ddlGender.SelectedValue;
                string jsonData = HiddenFieldData.Value;
                List<ColorSize> colorSizes = JsonConvert.DeserializeObject<List<ColorSize>>(jsonData);

                if (IsDuplicateProductName(productName))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire({ title: 'Error', text: 'The product is already existed.', icon: 'error', confirmButtonText: 'OK' });", true);
                    return;
                }

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
                                string base64Image = colorSize.Image.Split(',')[1];
                                byte[] imageBytes = Convert.FromBase64String(base64Image);
                                Image newImage = new Image
                                {
                                    ProductImage = imageBytes
                                };
                                db.Image.Add(newImage);
                                db.SaveChanges();

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
                                db.SaveChanges();
                            }
                        }

                        ScriptManager.RegisterStartupScript(this, GetType(), "successAlert", "Swal.fire('Success!', 'Product and details added successfully!', 'success').then((result) => { window.location = '/AdminPages/AdminProduct/ProductHome.aspx'; });", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "Swal.fire('Error!', 'An error occurred when adding product: " + ex.Message.Replace("'", "\\'") + "', 'error');", true);
                }
            }
        }

        private bool IsDuplicateProductName(string productName)
        {
            using (var db = new ProductDbContext())
            {
                var isDuplicate = db.Product
                    .Include(p => p.Category)
                    .Any(p => p.Product_Name == productName && !p.IsDeleted);

                return isDuplicate;
            }
        }



    }
}




