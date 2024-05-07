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
        string cs = Global.CS;
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

                string jsonData = HiddenFieldData.Value;
                List<ColorSize> colorSizes = JsonConvert.DeserializeObject<List<ColorSize>>(jsonData);

                using (var db = new ProductDbContext())
                {
                    var categoryID = db.category.Where(c => c.Name == category && c.Gender.ToString() == gender).Select(c => c.Category_ID).FirstOrDefault();

                    Product newProduct = new Product
                    {
                        Product_Name = productName,
                        Description = productDescription,
                        Price = productPrice,
                        Category_ID = categoryID
                    };
                    db.product.Add(newProduct);
                    db.SaveChanges();

                    foreach (var colorSize in colorSizes)
                    {
                        if (!String.IsNullOrWhiteSpace(colorSize.Image))
                        {
                            string imagePath = colorSize.Image;
                            string serverPath = Server.MapPath("~/Images/Products/");
                            string fileName = Path.GetFileName(imagePath);
                            string fullPath = serverPath + fileName;


                            Image newImage = new Image
                            {
                                ImagePath = "/Images/Products/" + fileName
                            };
                            db.image.Add(newImage);
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
                                        Quantity1 = Int32.Parse(sizeValue)
                                    };
                                    db.quantity.Add(newQuantity);
                                }
                            }
                        }
                        else
                        {
                            // Handle cases where no image is specified if necessary
                        }
                    }
                    db.SaveChanges();
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Product and details added successfully!');", true);
            }
        }



    }
}
