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
            if (IsPostBack)
            {

            }
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
            if (Page.IsValid)
            {
                string productName = txtProductName.Text;
                string productDescription = txtDescription.Text;
                double productPrice = Double.Parse(txtPrice.Text);
                string category = ddlCategory.SelectedValue;
                string gender = ddlGender.SelectedValue;

                // Check if a file is uploaded
                if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
                {
                    HttpPostedFile uploadedFile = Request.Files[0]; // Get the uploaded file

                    try
                    {
                        string jsonData = HiddenFieldData.Value;
                        List<ColorSize> colorSizes = JsonConvert.DeserializeObject<List<ColorSize>>(jsonData);

                        /*
                        using (var db = new ProductDbContext())
                        {
                            var categoryID = db.category.Where(c => c.Name == category && c.Gender == gender).Select(c => c.Category_ID).FirstOrDefault();
                            string serverPath = Server.MapPath("/Images/Products/"); // Physical path on server

                            Product newProduct = new Product
                            {
                                Category_ID = categoryID,
                                Product_Name = productName,
                                Description = productDescription,
                                Price = productPrice
                            };
                            db.product.Add(newProduct);

                            string imageFileName = Path.GetFileName(uploadedFile.FileName); 
                            string fullPath = serverPath + imageFileName; 
                            uploadedFile.SaveAs(fullPath);

                            
                           
                            foreach (var colorSize in colorSizes)
                            {
                                foreach (var sizeProperty in typeof(ColorSize).GetProperties().Where(p => p.Name.StartsWith("Size")))
                                {
                                    string sizeValue = sizeProperty.GetValue(colorSize) as string;
                                    if (!string.IsNullOrEmpty(sizeValue))
                                    {
                                        string size = sizeProperty.Name.Substring(4);
                                        Quantity newQuantity = new Quantity
                                        {
                                            Quantity_ID = newQuantityIDCounter++,
                                            Product_ID = newProduct.Product_ID,
                                            Color = colorSize.Color,
                                            Size = size,
                                            Quantity1 = Int32.Parse(sizeValue)
                                        };
                                        db.quantity.Add(newQuantity);

                                        Image newImage = new Image
                                        {
                                            Image_ID = newImageID++,
                                            ImagePath = "/Images/Products/" + imageFileName, // Relative path for database
                                            Quantity_ID = newQuantity.Quantity_ID
                                        };
                                        db.image.Add(newImage);
                                    }
                                }
                            
                            }
                            
                            db.SaveChanges();
                        }
                        */
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions
                        Response.Write("Error: " + ex.Message);
                    }
                }
                else
                {
                    // Notify user if no file is selected
                    Response.Write("Please select a file to upload.");
                }
            }
        }


    }
}
