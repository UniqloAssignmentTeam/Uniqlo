using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminStaff;
using static Uniqlo.Discount;

namespace Uniqlo.AdminPages
{
    public partial class UpdateDiscount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string discountID = Request.QueryString["discountId"];
                if (!string.IsNullOrEmpty(discountID))
                {
                   LoadDiscountDetails(int.Parse(discountID));
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
                    productID.Text = discount.Product_ID.ToString();
                    productName.Text = discount.Product.Product_Name;
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



                    if (discount != null)
                    {
                        discount.Product_ID = int.Parse(productID.Text);
                        discount.Discount_Amount = float.Parse(discountAmount.Text);
                        discount.Status = status.Text;
                        discount.Start_Date = DateTime.Parse(startDate.Text);
                        discount.End_Date = DateTime.Parse(endDate.Text);

                        // Update other fields like Gender and Role if they are editable

                        db.SaveChanges();
                        Response.Redirect("Staff.aspx");
                    }
                }
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DiscountHome.aspx");
        }

    }
}