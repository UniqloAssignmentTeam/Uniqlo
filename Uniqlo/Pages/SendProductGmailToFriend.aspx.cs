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
                    using (var db = new ProductDbContext())
                    {
                        var today = DateTime.Today;

                        // Expecting a single product due to unique product ID
                        var product = db.Product
                            .Where(p => p.Product_ID == prodID && !p.IsDeleted)
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
            string yourName = "Janice";
            string productName = prodNameHidden.Value;
            double discountAmount = Double.Parse(prodDiscountHidden.Value);
            double price = Double.Parse(prodPriceHidden.Value);
            string description = prodDescHidden.Value;
            int imageID = Int32.Parse(prodImageID.Value);
            double currentPrice = price - discountAmount;
            string userEmail = getUserEmailAddress();
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
                        mail.Subject = "Hello from " + yourName + ", Check out this product I found!";
                        mail.Body = $"{friendEmailContent}\nHey, I thought you might be interested in this product: {productName}. Here's what they say about it: {description}. It's original price is RM {price} but it is RM {currentPrice} now! \n See image here: ";
                        
                        using (MemoryStream ms = new MemoryStream(imageData))
                        {
                            mail.Attachments.Add(new Attachment(ms, $"{productName}.jpg", "image/jpeg"));
                            smtp.Send(mail);
                        }

                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "successAlert", "alert('Email sent successfully!');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred while sending email. Error: " + ex.Message + "');", true);
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
            int custId = (int)Session["Customer_ID"];
            string userEmail = ""; // Default to an empty string if no email is found

            try
            {
                using (var db = new CustomerDBContext())
                {
                    // Fetch the customer's email based on their customer ID
                    var customer = db.Customer
                        .Where(c => c.Customer_ID == custId)
                        .Select(c => c.Email) // Directly select the Email field
                        .FirstOrDefault(); // Use FirstOrDefault to handle cases where no customer matches

                    if (customer != null)
                    {
                        userEmail = customer; // Assign the email if found
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred while retrieving the email address. Error: " + ex.Message + "');", true);
                userEmail = "Error retrieving email"; // Optional: Return an error message as email
            }

            return userEmail; // Return the found email or an empty string if none was found
        }

        protected void backToProductDetails(object sender, EventArgs e)
        {
            int productID = Int32.Parse(Request.QueryString["id"]);

            Response.Redirect("/Pages/ProductDetails.aspx?ProdID=" + productID);
        }

    }
}