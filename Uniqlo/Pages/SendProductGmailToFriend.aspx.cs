using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.Pages.Categories.Women;
using System.Data.Entity;
using Uniqlo.AdminPages.AdminProduct;
using System.Diagnostics;
using System.IO;
using System.Net.Mime;

namespace Uniqlo.Pages
{
    public partial class SendProductGmailToFriend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (int.TryParse(Request.QueryString["id"], out int prodID))
            {
                if (!IsPostBack)
                {
                    try
                    {
                        using (var db = new ProductDbContext())
                        {
                            var today = DateTime.Today;

                            // Expecting a single product due to unique product ID
                            var product = db.Product
                                .Where(p => p.Product_ID == prodID && p.IsDeleted == false)
                                .Include(p => p.Discounts)
                                .Include(p => p.Quantities.Select(q => q.Image))
                                .Select(p => new
                                {
                                    ProductName = p.Product_Name,
                                    Description = p.Description,
                                    Price = p.Price,
                                    DiscountAmount = p.Discounts
                                        .Where(d => d.Status == "Active" && d.Start_Date <= today && d.End_Date >= today)
                                        .Select(d => d.Discount_Amount)
                                        .FirstOrDefault(),
                                    FirstImageId = p.Quantities.Select(q => q.Image_ID).FirstOrDefault(),
                                })
                                .FirstOrDefault();  // Use FirstOrDefault to get a single product or null

                            // Check if a product was found
                            if (product != null)
                            {
                                prodNameHidden.Value = product.ProductName;
                                prodDiscountHidden.Value = product.DiscountAmount.ToString();
                                prodPriceHidden.Value = product.Price.ToString();
                                prodDescHidden.Value = product.Description;
                                prodImageID.Value = product.FirstImageId.ToString();
                            }
                            else
                            {
                                prodNameHidden.Value = "Product not found";
                                prodDiscountHidden.Value = "N/A";
                                prodPriceHidden.Value = "N/A";
                                prodDescHidden.Value = "No description available";
                                prodImageID.Value = "N/A";
                            }
                        }
                    }
                    catch (Exception ex)
                    {

                        // Optionally display error message on the page
                        ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"Swal.fire('Error', 'An error occurred when retrieving product information: {ex.Message}', 'error');", true);
                    }

                }

                string eventTarget = Request["__EVENTTARGET"];
                if (eventTarget == "HyperLink1")
                {
                    if (int.TryParse(Request.QueryString["id"], out int productID))
                    {
                        Response.Redirect("/Pages/ProductDetails.aspx?ProdID=" + productID);
                    }
                }
            }
            else
            {
                // Handle cases where the product ID is not a valid integer
                prodNameHidden.Value = "Invalid product ID";
                prodDiscountHidden.Value = "N/A";
                prodPriceHidden.Value = "N/A";
                prodDescHidden.Value = "Invalid request";
                prodImageID.Value = "N/A";
            }
        }


        protected void btnSend_Click(object sender, EventArgs e)
        {

            string friendEmail = friendEmailInput.Text;
            string friendEmailContent = emailContentInput.Text;
            string productName = prodNameHidden.Value;
            double discountAmount = Double.Parse(prodDiscountHidden.Value);
            double price = Double.Parse(prodPriceHidden.Value);
            string description = prodDescHidden.Value;
            int imageID = Int32.Parse(prodImageID.Value);
            double currentPrice = price - discountAmount;
            string userEmail = getUserEmailAddress();
            string userName = getUserName();
            byte[] imageData = GetImageFromDatabase(imageID);

            try
            {
                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("janiceljm-pm21@student.tarc.edu.my", "030925070252"); // Consider using Secure String or Environment Variable

                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress(userEmail);
                        mail.To.Add(friendEmail);
                        mail.Subject = "Hello from " + userName + ", Check out this product I found!";
                        mail.IsBodyHtml = true; // Enable HTML content

                        // HTML body with embedded image
                        string logoUrl = "/Images/Uniqlo-Logos.png"; // Change this to your actual logo URL
                        string emailBody = $@"
                                            <p>{friendEmailContent}</p>
                                            <p>Hey, I thought you might be interested in this product: <strong>{productName}</strong>. Here's what they say about it: {description}. Its original price is RM {price}, but it is now RM {currentPrice}!</p>
                                            <p>See the image below:</p>
                                            <img src='cid:productImage' alt='Product Image' /><br />
                                            <p>Thank you,<br />{userName}</p>
                                            <p><img src='{logoUrl}' alt='Company Logo' style='width:100px;height:auto;' /><br />Thank you for supporting our company shout-out from Uniqlo!</p>";

                        mail.Body = emailBody;

                        // Embed product image
                        LinkedResource productImage = new LinkedResource(new MemoryStream(imageData), "image/jpeg")
                        {
                            ContentId = "productImage"
                        };
                        AlternateView avHtml = AlternateView.CreateAlternateViewFromString(mail.Body, null, MediaTypeNames.Text.Html);
                        avHtml.LinkedResources.Add(productImage);
                        mail.AlternateViews.Add(avHtml);

                        smtp.Send(mail);

                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "successAlert", "Swal.fire('Success', 'Email sent successfully!', 'success');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"Swal.fire('Error', 'An error occurred: {ex.Message}', 'error');", true);
            }
        }

        private byte[] GetImageFromDatabase(int imageID)
        {
            using (var db = new ImageDbContext())
            {
                int prodID = Int32.Parse(Request.QueryString["id"]);

                return db.Image
                .Where(img => img.Image_ID == imageID)
                .Select(img => img.ProductImage)
                .FirstOrDefault();
            }

        }

        private string getUserEmailAddress()
        {
            string sessionValue = Session["Customer_ID"] as string;

            if (int.TryParse(sessionValue, out int custId))
            {
                string userEmail = ""; 

                try
                {
                    using (var db = new CustomerDBContext())
                    {
                        var customerEmail = db.Customer
                            .Where(c => c.Customer_ID == custId)
                            .Select(c => c.Email) 
                            .FirstOrDefault();

                        if (customerEmail != null)
                        {
                            userEmail = customerEmail; 
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"Swal.fire('Error', 'An error occurred: {ex.Message}', 'error');", true);
                    userEmail = "Error retrieving email";
                }

                return userEmail;
            }

            return ""; 
        }        
        
        private string getUserName()
        {
            string sessionValue = Session["Customer_ID"] as string;

            if (int.TryParse(sessionValue, out int custId))
            {
                string userName = ""; 

                try
                {
                    using (var db = new CustomerDBContext())
                    {
                        var customerName = db.Customer
                            .Where(c => c.Customer_ID == custId)
                            .Select(c => c.Name) 
                            .FirstOrDefault();

                        if (customerName != null)
                        {
                            userName = customerName; 
                        }
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"Swal.fire('Error', 'An error occurred: {ex.Message}', 'error');", true);
                    userName = "Error retrieving email";
                }

                return userName;
            }

            return ""; 
        }


        protected void backToProductDetails(object sender, EventArgs e)
        {
            int productID = Int32.Parse(Request.QueryString["id"]);

            Response.Redirect("/Pages/ProductDetails.aspx?ProdID=" + productID);
        }

    }
}