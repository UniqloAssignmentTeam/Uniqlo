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
            double discountAmount = double.Parse(prodDiscountHidden.Value);
            double price = double.Parse(prodPriceHidden.Value);
            string description = prodDescHidden.Value;
            int imageID = Int32.Parse(prodImageID.Value);
            double currentPrice = price - discountAmount;
            string userEmail = getUserEmailAddress();
            string userName = getUserName();
            byte[] imageData = GetImageFromDatabase(imageID);

            string formattedPrice = price.ToString("F2");
            string formattedCurrentPrice = currentPrice.ToString("F2");

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
                        string logoUrl = Server.MapPath("/Images/Uniqlo-Logos.png");
                        string emailBody = $@"
                                            <!DOCTYPE html>
                                            <html>
                                            <head>
                                                <style>
                                                    .container {{
                                                        font-family: Arial, sans-serif;
                                                        color: #333;
                                                        line-height: 1.6;
                                                        max-width: 600px;
                                                        margin: auto;
                                                        border: 1px solid #ddd;
                                                        border-radius: 10px;
                                                        overflow: hidden;
                                                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                                                    }}
                                                    .header {{
                                                        background-color: #f8f8f8;
                                                        padding: 20px;
                                                        text-align: center;
                                                        border-bottom: 1px solid #ddd;
                                                    }}
                                                    .header p {{
                                                        margin: 0;
                                                        font-size: 16px;
                                                    }}
                                                    .content {{
                                                        padding: 20px;
                                                    }}
                                                    .content p {{
                                                        margin: 0 0 10px;
                                                    }}
                                                    .content img {{
                                                        max-width: 100%;
                                                        height: auto;
                                                        border: 1px solid #ddd;
                                                        border-radius: 5px;
                                                        margin: 10px 0;
                                                    }}
                                                    .thank-you {{
                                                        margin: 20px 0;
                                                        text-align: center;
                                                    }}
                                                    .thank-you img {{
                                                        width: 100px;
                                                        height: auto;
                                                        margin-top: 10px;
                                                    }}
                                                    .footer {{
                                                        background-color: #f8f8f8;
                                                        padding: 10px;
                                                        text-align: center;
                                                        border-top: 1px solid #ddd;
                                                        font-size: 12px;
                                                        color: #777;
                                                    }}
                                                </style>
                                            </head>
                                            <body>
                                                <div class='container'>
                                                    <div class='header'>
                                                        <p>{friendEmailContent}</p>
                                                    </div>
                                                    <div class='content'>
                                                        <p>Hey, I thought you might be interested in this product: <strong>{productName}</strong>.</p>
                                                        <p>Here's what they say about it: {description}.</p>
                                                        <p>Its original price is RM {formattedPrice}, but it is only <strong>RM {formattedCurrentPrice}</strong> now!</p>
                                                        <p>See the image below:</p>
                                                        <img src='cid:productImage' alt='Product Image' />
                                                        <div class='thank-you'>
                                                            <p>Thank you for supporting our company!</p>
                                                            <img src='cid:companyLogo' alt='Company Logo' />
                                                        </div>
                                                    </div>
                                                    <div class='footer'>
                                                        <p>&copy; 2024 Uniqlo. All rights reserved.</p>
                                                    </div>
                                                </div>
                                            </body>
                                            </html>";

                        mail.Body = emailBody;

                        // Embed product image
                        LinkedResource productImage = new LinkedResource(new MemoryStream(imageData), "image/jpeg")
                        {
                            ContentId = "productImage"
                        };

                        LinkedResource companyLogo = new LinkedResource(logoUrl, "image/png")
                        {
                            ContentId = "companyLogo"
                        };
                        AlternateView avHtml = AlternateView.CreateAlternateViewFromString(mail.Body, null, MediaTypeNames.Text.Html);
                        avHtml.LinkedResources.Add(productImage);
                        avHtml.LinkedResources.Add(companyLogo);
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