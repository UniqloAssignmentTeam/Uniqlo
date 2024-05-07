using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminStaff;

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

                    discountIDText.Text = discount.Discount_ID.ToString();
                    productID.Text = discount.Product_ID.ToString();
                    productName.Text = discount.Product.Product_Name;
                    discountAmount.Text = discount.Discount_Amount.ToString();
                    status.SelectedValue = discount.Status;
                    startDate.Text = discount.Start_Date.ToString("yyyy-MM-dd");
                    endDate.Text = discount.End_Date.ToString("yyyy-MM-dd");

                }
            }
        }

        /*
        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (var db = new StaffDbContext())
                {
                    int staffId = int.Parse(staffID.Text);
                    var staff = db.Staff.FirstOrDefault(s => s.Staff_ID == staffId);
                    if (staff != null)
                    {
                        staff.Name = staffName.Text;
                        staff.Email = email.Text;
                        staff.Contact_No = contactNumber.Text;
                        staff.Gender = staffGender.SelectedValue;
                        staff.Role = staffRole.SelectedValue;
                        // Update other fields like Gender and Role if they are editable

                        db.SaveChanges();
                        Response.Redirect("Staff.aspx");
                    }
                }
            }
        }
        
        */

    }
}