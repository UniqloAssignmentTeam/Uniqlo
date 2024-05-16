using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    if (int.TryParse(EncryptionHelper.Decrypt(Request.QueryString["discountId"]), out discountID) && discountID > 0)
                    {
                        LoadDiscountDetails(discountID);
                        DropDownListProductName(discountID);
                    }
                }
                catch (Exception ex)
                {
                    ShowSweetAlert("Error", "Failed to load discount details.", "error");
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
                ShowSweetAlert("Error", "Error retrieving discount data.", "error");
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
                        DateTime parsedEndDate = DateTime.Parse(endDate.Text);

                        var discount = db.Discount.FirstOrDefault(d => d.Discount_ID == discountId);
                        if (discount != null)
                        {
                            discount.Product_ID = int.Parse(DdlProductName.SelectedValue);
                            discount.Discount_Amount = double.Parse(discountAmount.Text);

                            if (parsedEndDate < DateTime.Today && status.SelectedValue == "Active")
                            {
                                ShowSweetAlert("Error", "Cannot set the discount to active as the end date is already over.", "error");
                                return; // Abort the update if the end date is past and trying to set to Active
                            }

                            discount.Status = status.SelectedValue;
                            discount.Start_Date = DateTime.Parse(startDate.Text);
                            discount.End_Date = parsedEndDate;

                            db.SaveChanges();
                            ShowSuccessAlert("Success", "Discount updated successfully!", "DiscountHome.aspx");
                        }
                    }
                }
                catch (Exception ex)
                {
                    ShowSweetAlert("Error", "Error updating discount. Please check your inputs.", "error");
                }
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
                ShowSweetAlert("Error", "Invalid date format.", "error");
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
                ShowSweetAlert("Error", "Error getting Product ID. Please try again.", "error");
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
                ShowSweetAlert("Error", "Error loading product names. Please try again.", "error");
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
                ShowSweetAlert("Error", "Failed to redirect to the main page. Please try again.", "error");
            }
        }

        private void ShowSweetAlert(string title, string message, string icon, string redirectUrl = "")
        {
            string script = $"Swal.fire({{ title: '{title}', html: '{message}', icon: '{icon}' }}).then((result) => {{ if (result.isConfirmed && '{redirectUrl}' !== '') {{ window.location.href = '{redirectUrl}'; }} }});";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowSweetAlert", script, true);
        }

        // Use this method for success messages
        private void ShowSuccessAlert(string title, string message, string redirectUrl = "")
        {
            string script = $"Swal.fire({{ title: '{title}', text: '{message}', icon: 'success', confirmButtonText: 'OK' }}).then(() => {{ window.location.href = '{redirectUrl}'; }});";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessAlert", script, true);
        }

    }
}
