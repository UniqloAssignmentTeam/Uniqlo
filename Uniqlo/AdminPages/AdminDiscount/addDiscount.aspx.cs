using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminDiscount;
using static Uniqlo.Discount;

namespace Uniqlo.AdminPages
{
    public partial class addDiscount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    DropDownListProductName();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "loadError", "alert('Error loading discounts: " + ex.Message + "');", true);
                }
            }
        }
        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    DateTime startInput, endInput;
                    bool startDateParsed = DateTime.TryParse(startDate.Text, out startInput);
                    bool endDateParsed = DateTime.TryParse(endDate.Text, out endInput);

                    if (!startDateParsed || !endDateParsed || startInput > endInput)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "dateError", "alert('Invalid date range.');", true);
                        return;
                    }

                    using (var db = new DiscountDbContext())
                    {
                        int productId = Int32.Parse(DdlProductName.SelectedValue);
                        Discount newDiscount = new Discount
                        {
                            Product_ID = productId,
                            Discount_Amount = float.Parse(discountAmount.Text),
                            Start_Date = startInput,
                            End_Date = endInput,
                            Status = (DateTime.Now.Date >= startInput && DateTime.Now.Date <= endInput) ? "Active" : "Inactive"
                        };

                        db.Discount.Add(newDiscount);
                        db.SaveChanges();
                       
                      


                        Response.Redirect("DiscountHome.aspx");
                      
                        
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "saveError", "alert('Error saving discount: " + ex.Message + "');", true);
                }
            }
        }



        private void DropDownListProductName(bool excludeDiscounted = true)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var discountedProductIds = new HashSet<int>();
                    if (excludeDiscounted)
                    {
                        discountedProductIds = new HashSet<int>(
                            db.Discount.Select(d => d.Product_ID)
                        );
                    }

                    var products = db.Product
                                     .Where(p => !p.IsDeleted && (!excludeDiscounted || !discountedProductIds.Contains(p.Product_ID)))
                                     .Select(p => new { p.Product_ID, p.Product_Name })
                                     .ToList();

                    DdlProductName.Items.Clear();
                    DdlProductName.Items.Add(new ListItem("--Select Product--", ""));

                    foreach (var product in products)
                    {
                        DdlProductName.Items.Add(new ListItem(product.Product_Name, product.Product_ID.ToString()));
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "dropdownError", "alert('Error loading product names: " + ex.Message + "');", true);
            }
        }
        protected void CustomValidatorDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime startInput;
            DateTime endInput;
            bool startDateParsed = DateTime.TryParse(startDate.Text, out startInput);
            bool endDateParsed = DateTime.TryParse(endDate.Text, out endInput);

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

        protected void ValidateProductName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Ensure that a product other than the default "--Select Product--" is chosen
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
                ScriptManager.RegisterStartupScript(this, GetType(), "cancelError", "alert('Error navigating back: " + ex.Message + "');", true);
            }
        }

    }
}