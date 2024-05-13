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
                try
                {
                    int discountID;
                    if (int.TryParse(Request.QueryString["discountId"], out discountID) && discountID > 0)
                    {
                        LoadDiscountDetails(discountID);
                        DropDownListProductName(discountID);
                       
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "loadError", "alert('Failed to load discount details.');", true);
                }
            }
        }

        private void LoadDiscountDetails(int discountID)
        {
            try
            {
                using (var db = new DiscountDbContext())
                {
                    var discount = db.Discount.FirstOrDefault(s => s.Discount_ID == discountID);
                    if (discount != null)
                    {
                        this.discountID.Text = discount.Discount_ID.ToString();
                        discountAmount.Text = discount.Discount_Amount.ToString();
                        status.SelectedValue = discount.Status;
                        startDate.Text = discount.Start_Date.ToString("yyyy-MM-dd");
                        endDate.Text = discount.End_Date.ToString("yyyy-MM-dd");
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "dataError", "alert('Error retrieving discount data.');", true);
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (var db = new DiscountDbContext())
                    {
                        int discountId = int.Parse(discountID.Text);
                        int productId = int.Parse(DdlProductName.SelectedValue);
                        var discount = db.Discount.FirstOrDefault(d => d.Discount_ID == discountId);
                        if (discount != null)
                        {
                            discount.Product_ID = productId;
                            discount.Discount_Amount = float.Parse(discountAmount.Text);
                            discount.Status = status.Text;
                            discount.Start_Date = DateTime.Parse(startDate.Text);
                            discount.End_Date = DateTime.Parse(endDate.Text);

                            db.SaveChanges();
                            try
                            {
                        Response.Redirect("DiscountHome.aspx");
                            }catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to redirect to the main page. Please try again.');", true);
                            }
                           
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "updateError", "alert('Error updating discount. Please check your inputs.');", true);
                }
            }
        }


      

        private int? getReturnProductID(int discountID)
        {
            try
            {
                using (var db = new DiscountDbContext())
                {
                    var discount = db.Discount.FirstOrDefault(d => d.Discount_ID == discountID);


                    if (discount != null)
                    {

                        return discount.Product_ID;

                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Error getting Product ID. Please try again.');", true);

            }
            return null;
        }

        private void DropDownListProductName(int discountID)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var discountedProductIds = db.Discount
                                                 .Where(d => d.Discount_ID != discountID)
                                                 .Select(d => d.Product_ID)
                                                 .Distinct()
                                                 .ToList();

                    var availableProducts = db.Product
                                              .Where(p => p.IsDeleted == false && !discountedProductIds.Contains(p.Product_ID))
                                              .Select(p => new { p.Product_ID, p.Product_Name })
                                              .ToList();

                    DdlProductName.Items.Clear();

                    foreach (var product in availableProducts)
                    {
                        ListItem item = new ListItem(product.Product_Name, product.Product_ID.ToString());
                        DdlProductName.Items.Add(item);
                    }

                    var productID = getReturnProductID(discountID);
                    if (productID.HasValue)
                    {
                        DdlProductName.SelectedValue = productID.Value.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Log the error or show it somewhere on your page
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Error loading product names. Please try again.');", true);
            }
        }


        protected void CustomValidatorDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime startInput;
            DateTime endInput;
            bool startDateParsed = DateTime.TryParse(startDate.Text, out startInput);
            bool endDateParsed = DateTime.TryParse(endDate.Text, out endInput);
            try
            {
                // Check if both dates are valid and start is before end
                if (startDateParsed && endDateParsed && startInput <= endInput)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
            }
            catch (Exception ex)
            {
                args.IsValid = false;
                ScriptManager.RegisterStartupScript(this, GetType(), "validationError", "alert('Invalid date format.');", true);
            }
        }

        protected void ValidateProductName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
            if (DdlProductName.SelectedValue != "")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }



        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("DiscountHome.aspx");
            }
            catch (Exception ex)
            {
                // Log error details if logging is set up or use ScriptManager to alert the user.
                ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('Failed to redirect to the main page. Please try again.');", true);
            }
        }

       
    }
}