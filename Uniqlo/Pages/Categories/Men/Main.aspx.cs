using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;

namespace Uniqlo.Pages.Categories.Men
{
    
    public partial class Main : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDiscountedProducts();
            }
        }

        private void BindDiscountedProducts()
        {
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"
            SELECT p.ProductName, p.Description, p.Price AS OriginalPrice, 
                   (p.Price - d.DiscountAmount) AS DiscountedPrice, p.ImageUrl
            FROM Product p
            INNER JOIN Category c ON p.CategoryId = c.CategoryId
            INNER JOIN Discount d ON p.ProductId = d.ProductId
            WHERE c.Gender = 'M' AND c.Name = 'Bottom' AND d.Status = 'Active'";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        rptDiscountedProducts.DataSource = reader;
                        rptDiscountedProducts.DataBind();
                    }
                }
            }
        }
        protected void lnkTops_Click(object sender, EventArgs e)
        {
            Session["SelectedCategory"] = "MenTop";
        }

        protected void lnkBottoms_Click(object sender, EventArgs e)
        {
            Session["SelectedCategory"] = "MenBottom";
        }
    }
}