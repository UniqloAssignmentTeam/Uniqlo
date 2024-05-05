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


namespace Uniqlo.AdminPages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        UniqloEntities1 db = new UniqloEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }

        public class ColorSize
        {
            public string Color { get; set; }
            public string Size { get; set; }
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


                string connectionString = "Your Connection String Here";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlTransaction transaction = conn.BeginTransaction();

                    try
                    {
                        // Insert the main product
                        string productQuery = "INSERT INTO Products (ProductName, ProductDescription, Price, Category, Gender) VALUES (@Name, @Description, @Price, @Category, @Gender); SELECT SCOPE_IDENTITY();";
                        SqlCommand productCmd = new SqlCommand(productQuery, conn, transaction);
                        productCmd.Parameters.AddWithValue("@Name", name);
                        productCmd.Parameters.AddWithValue("@Description", description);
                        productCmd.Parameters.AddWithValue("@Price", price);
                        productCmd.Parameters.AddWithValue("@Category", category);
                        productCmd.Parameters.AddWithValue("@Gender", gender);
                        int productId = Convert.ToInt32(productCmd.ExecuteScalar());

                        // Insert each color and size
                        foreach (var item in colorSizes)
                        {
                            string detailQuery = "INSERT INTO ProductDetails (ProductId, Color, Size, Image) VALUES (@ProductId, @Color, @Size, @Image)";
                            SqlCommand detailCmd = new SqlCommand(detailQuery, conn, transaction);
                            detailCmd.Parameters.AddWithValue("@ProductId", productId);
                            detailCmd.Parameters.AddWithValue("@Color", item.Color);
                            detailCmd.Parameters.AddWithValue("@Size", item.Size);
                            detailCmd.Parameters.AddWithValue("@Image", item.Image);
                            detailCmd.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        Console.WriteLine("Error: " + ex.Message);
                        throw; // Optionally rethrow the exception
                    }
                }

            }
        }
    }
}