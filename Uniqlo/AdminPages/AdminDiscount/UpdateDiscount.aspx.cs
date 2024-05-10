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
                    int productId = int.Parse(DdlProductName.SelectedValue);
                    var existingDiscount = db.Discount
                                     .Where(d => d.Product_ID == productId)
                                     .FirstOrDefault();

                    if (existingDiscount != null)
                    {
                        db.Discount.Remove(existingDiscount);
                        db.SaveChanges(); // Save changes if you want to immediately commit the delete

                        DateTime startInput;
                        DateTime endInput;
                        DateTime today = DateTime.Now.Date;
                        bool startDateParsed = DateTime.TryParse(startDate.Text, out startInput);
                        bool endDateParsed = DateTime.TryParse(endDate.Text, out endInput);
                        DateTime startDateInput = startInput.Date;
                        DateTime endDateInput = endInput.Date;
                        if (!startDateParsed || !endDateParsed)
                        {

                            return;
                        }

                        string status = (today >= startDateInput && today <= endDateInput) ? "Active" : "Inactive";
                       
                            Discount newDiscount = new Discount
                            {

                                Product_ID = productId,
                                Discount_Amount = float.Parse(discountAmount.Text),
                                Start_Date = startDateInput,
                                End_Date = endDateInput,
                                Status = status

                            };

                            db.Discount.Add(newDiscount);
                            db.SaveChanges();

                            Response.Redirect("DiscountHome.aspx");
                        


                    }
                    else
                    {
                        var discount = db.Discount.FirstOrDefault(d => d.Discount_ID == discountId);
                        if (discount != null)
                        {
                            discount.Product_ID = int.Parse(DdlProductName.SelectedValue);
                            discount.Discount_Amount = float.Parse(discountAmount.Text);
                            discount.Status = status.Text;
                            discount.Start_Date = DateTime.Parse(startDate.Text);
                            discount.End_Date = DateTime.Parse(endDate.Text);

                            // Update other fields like Gender and Role if they are editable

                            db.SaveChanges();
                            Response.Redirect("DiscountHome.aspx");
                        }
                    }

                   



                  
                }
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
                

                var products = db.Product
                                 .Where(p => !p.IsDeleted)
                                 .Select(p => new { p.Product_ID, p.Product_Name })
                                 .ToList();


                DdlProductName.Items.Clear();


                

                foreach (var product in products)
                {
                    ListItem item = new ListItem(product.Product_Name, product.Product_ID.ToString());
                    DdlProductName.Items.Add(item);
                }

                var productID = getReturnProductID(discountID);
                if(!productID.HasValue)
                {
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