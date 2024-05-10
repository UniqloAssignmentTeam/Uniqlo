using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminStaff;
using Uniqlo.Pages.Categories.Women;
using static Uniqlo.Discount;

namespace Uniqlo.AdminPages
{
    public partial class UpdateDiscount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int discountID = int.Parse(Request.QueryString["discountId"]);
                if (discountID>0)
                {
                   LoadDiscountDetails(discountID);
                    DropDownListProductName(discountID);
                }
            }
        }
        
        private void LoadDiscountDetails(int discountID)
        {
            using (var db = new DiscountDbContext())
            {
                var discount = db.Discount.FirstOrDefault(s => s.Discount_ID == discountID);
                if (discount != null)
                {
                    // Ensure that you reference the TextBox correctly
                    this.discountID.Text = discount.Discount_ID.ToString();
                    discountAmount.Text = discount.Discount_Amount.ToString();
                    status.SelectedValue = discount.Status;
                    startDate.Text = discount.Start_Date.ToString("yyyy-MM-dd");
                    endDate.Text = discount.End_Date.ToString("yyyy-MM-dd");
                }
            }
        }

        
        protected void updateBtn_Click(object sender, EventArgs e)
{
    if (Page.IsValid)
    {
        using (var db = new DiscountDbContext())
        {
            int discountId = int.Parse(discountID.Text);
            var discount = db.Discount.FirstOrDefault(d => d.Discount_ID == discountId);

            // Parse new product ID from DropDownList
            int newProductId = int.Parse(DdlProductName.SelectedValue);
            int? productId = getReturnProductID(discountId);

            var existingDiscount = db.Discount.Where(d => d.Product_ID == productId).FirstOrDefault();
                    if (discount != null)
            {
                // Check if the product ID has changed
                if (discount.Product_ID != newProductId)
                {
                    // Remove existing discount
                    db.Discount.Remove(existingDiscount);
                    db.SaveChanges();

                    // Create a new discount for the new product
                    AddNewDiscount(db, newProductId);
                }
                else
                {
                    // Update existing discount details
                    UpdateExistingDiscount(discount);
                }

                db.SaveChanges();
                Response.Redirect("DiscountHome.aspx");
            }
        }
    }
}

private void AddNewDiscount(DiscountDbContext db, int productId)
{
    DateTime startDateInput, endDateInput;
    if (DateTime.TryParse(startDate.Text, out startDateInput) && DateTime.TryParse(endDate.Text, out endDateInput))
    {
        string status = (DateTime.Now.Date >= startDateInput && DateTime.Now.Date <= endDateInput) ? "Active" : "Inactive";

        Discount newDiscount = new Discount
        {
            Product_ID = productId,
            Discount_Amount = float.Parse(discountAmount.Text),
            Start_Date = startDateInput,
            End_Date = endDateInput,
            Status = status
        };

        db.Discount.Add(newDiscount);
    }
}

private void UpdateExistingDiscount(Discount discount)
{
    DateTime startDateInput, endDateInput;
    if (DateTime.TryParse(startDate.Text, out startDateInput) && DateTime.TryParse(endDate.Text, out endDateInput))
    {
        discount.Discount_Amount = float.Parse(discountAmount.Text);
        discount.Status = (DateTime.Now.Date >= startDateInput && DateTime.Now.Date <= endDateInput) ? "Active" : "Inactive";
        discount.Start_Date = startDateInput;
        discount.End_Date = endDateInput;
    }
}



      private int? getReturnProductID(int discountID)
        {
            
            using (var db = new DiscountDbContext())
            {
                var discount = db.Discount.FirstOrDefault(d => d.Discount_ID == discountID);


                if (discount != null)
                {

                    return discount.Product_ID;

                }
            }

            return null;


              
        }

        private void DropDownListProductName(int discountID)
        {
            using (var db = new ProductDbContext())
            {
                // Fetch all non-deleted products
                var products = db.Product
                                 .Where(p => !p.IsDeleted)
                                 .Select(p => new { p.Product_ID, p.Product_Name })
                                 .ToList();

                DdlProductName.Items.Clear(); // Clear existing items

                // Populate DropDownList with products
                foreach (var product in products)
                {
                    ListItem item = new ListItem(product.Product_Name, product.Product_ID.ToString());
                    DdlProductName.Items.Add(item);
                }

                // Attempt to get the product ID from the discount ID
                var productID = getReturnProductID(discountID);
                if (productID.HasValue)
                {
                    // Set the selected value of the dropdown list
                    DdlProductName.SelectedValue = productID.Value.ToString();
                }
            }
        }



        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DiscountHome.aspx");
        }

       
    }
}