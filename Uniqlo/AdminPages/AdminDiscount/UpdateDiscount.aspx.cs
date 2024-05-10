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
                    Discount existingDiscount = db.Discount.Find(discountId);

                    if (existingDiscount == null)
                    {
                        // Handle error: Discount not found
                        return;
                    }

                    // Parse and validate dates
                    if (!DateTime.TryParse(startDate.Text, out DateTime startInput) ||
                        !DateTime.TryParse(endDate.Text, out DateTime endInput))
                    {
                        // Handle error: Date parsing failed
                        return;
                    }

                    // Check if the product ID has changed and if there's an existing discount for the new product
                    int newProductId = int.Parse(DdlProductName.SelectedValue);
                    if (existingDiscount.Product_ID != newProductId)
                    {
                        // Check for and remove any existing discount on the new product
                        var conflictingDiscount = db.Discount.FirstOrDefault(d => d.Product_ID == newProductId);
                        if (conflictingDiscount != null)
                        {
                            db.Discount.Remove(conflictingDiscount);
                        }

                        // Create a new discount record for the new product
                        Discount newDiscount = new Discount
                        {
                            Product_ID = newProductId,
                            Discount_Amount = float.Parse(discountAmount.Text),
                            Start_Date = startInput,
                            End_Date = endInput,
                            Status = CalculateStatus(startInput, endInput)
                        };
                        db.Discount.Add(newDiscount);
                    }
                    else
                    {
                        // Update existing discount
                        existingDiscount.Discount_Amount = float.Parse(discountAmount.Text);
                        existingDiscount.Start_Date = startInput;
                        existingDiscount.End_Date = endInput;
                        existingDiscount.Status = CalculateStatus(startInput, endInput);
                    }

                    db.SaveChanges();
                    Response.Redirect("DiscountHome.aspx");
                }
            }
        }

        private string CalculateStatus(DateTime start, DateTime end)
        {
            DateTime today = DateTime.Now.Date;
            return (today >= start && today <= end) ? "Active" : "Inactive";
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