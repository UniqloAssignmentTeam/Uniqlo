using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Uniqlo.AdminPages.AdminCustomer;
using System.Net.Mime;

namespace Uniqlo.Pages
{
    public partial class Invoice : System.Web.UI.Page
    {
        string connectionString = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cart"] != null)
                {
                    List<CartItem> cart = (List<CartItem>)Session["Cart"];
                    rptCartItems.DataSource = cart;
                    rptCartItems.DataBind();

                }

                decimal totalPrice = (decimal)Session["TotalPrice"];
                lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");

                decimal deliveryCharge = (decimal)Session["ShippingFee"];
                lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");

                decimal grandTotal = (decimal)Session["GrandTotal"];
                lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");


            }

            int paymentId = Convert.ToInt32(Session["PaymentId"]);
            lblPaymentId.Text = paymentId.ToString();
            lblPaymentType.Text = (string)Session["PaymentMethod"];

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Payment_DateTime FROM Payment WHERE Payment_Id = @Payment_Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Payment_Id", paymentId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblDateTime.Text = Convert.ToDateTime(reader["Payment_DateTime"]).ToString("yyyy-MM-dd HH:mm:ss");
                        }
                    }
                }
            }

            int customerId = Convert.ToInt32(Session["Customer_Id"]);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Name, Email, Contact_No FROM Customer WHERE Customer_Id = @CustomerId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblCustomerName.Text = reader["Name"].ToString();
                            lblEmail.Text = reader["Email"].ToString();
                            lblEmail2.Text = reader["Email"].ToString();
                            lblContactNo.Text = reader["Contact_No"].ToString();
                        }
                    }
                }
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // This query joins the required tables to directly fetch address details using Payment_Id
                string query = @"
        SELECT sa.Address, sa.City, sa.State, sa.PostCode, sa.Country 
        FROM Payment p
        JOIN Delivery d ON p.Delivery_Id = d.Delivery_Id
        JOIN Shipping_Address sa ON d.Address_Id = sa.Address_Id
        WHERE p.Payment_Id = @Payment_Id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Payment_Id", paymentId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblAddress.Text = $"{reader["Address"].ToString()}, {reader["City"].ToString()}, {reader["State"].ToString()}, {reader["PostCode"].ToString()}, {reader["Country"].ToString()}";
                        }
                        else
                        {
                            // Handle the case where no data is returned
                            lblAddress.Text = "Address not found.";
                        }
                    }
                }
            }
            // Generate PDF receipt
            byte[] pdfBytes = GeneratePDFReceipt();

            // Send email with PDF attachment
            SendEmailWithAttachment(pdfBytes);

        }

        // Method to generate PDF receipt
        private byte[] GeneratePDFReceipt()
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (Document document = new Document())
                {
                    PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);

                    // Open the Document
                    document.Open();

                    // Add Uniqlo logo
                    string logoPath = Server.MapPath("../Images/Uniqlo-Logos.png"); // Update the path to your logo image
                    if (File.Exists(logoPath))
                    {
                        iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoPath);
                        logo.ScaleAbsolute(150f, 50f); // Adjust the size of the logo as needed
                        document.Add(logo);
                    }

                    // Add invoice details
                    document.Add(new Paragraph("Invoice Details"));
                    document.Add(new Paragraph("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"));
                    // Add a line break
                    document.Add(new Paragraph("\n"));

                    document.Add(new Paragraph("Payment ID: " + lblPaymentId.Text));
                    document.Add(new Paragraph("Payment Date & Time: " + lblDateTime.Text));
                    document.Add(new Paragraph("Payment Method: " + lblPaymentType.Text));
                    document.Add(new Paragraph("Customer Name: " + lblCustomerName.Text));
                    document.Add(new Paragraph("Address: " + lblAddress.Text));
                    document.Add(new Paragraph("Email: " + lblEmail.Text));
                    document.Add(new Paragraph("Contact No: " + lblContactNo.Text));

                    // Add a line break
                    document.Add(new Paragraph("\n"));

                    // Add the invoice table
                    PdfPTable table = new PdfPTable(4);
                    table.WidthPercentage = 100;
                    table.SpacingBefore = 10f; // Add spacing before the table
                    table.SpacingAfter = 10f; // Add spacing after the table
                    table.AddCell("Product");
                    table.AddCell("Quantity");
                    table.AddCell("Price (RM)");
                    table.AddCell("Item Price (RM)");

                    foreach (RepeaterItem item in rptCartItems.Items)
                    {
                        Label lblProductName = (Label)item.FindControl("lblProductName");
                        Label lblQuantity = (Label)item.FindControl("lblQuantity");
                        Label lblPrice = (Label)item.FindControl("lblPrice");
                        Label lblItemPrice = (Label)item.FindControl("lblItemPrice");

                        table.AddCell(lblProductName.Text);
                        table.AddCell(lblQuantity.Text);
                        table.AddCell(lblPrice.Text);
                        table.AddCell(lblItemPrice.Text);
                    }

                    document.Add(table);

                    // Add total price and delivery charges
                    document.Add(new Paragraph("Total Price: " + lblTotalPrice.Text));
                    document.Add(new Paragraph("Delivery Charges: " + lblDeliveryCharges.Text));
                    document.Add(new Paragraph("Total: " + lblGrandTotal.Text));

                    // Close the Document
                    document.Close();
                }

                // Convert the MemoryStream to a byte array
                byte[] pdfBytes = memoryStream.ToArray();
                return pdfBytes;
            }
        }


        // Method to send email with PDF attachment
        private void SendEmailWithAttachment(byte[] pdfBytes)
        {
            string customerEmail = lblEmail.Text; // Get customer's email address
            string customerName = GetCustomerName();
            string companyLogoPath = Server.MapPath("/Images/Uniqlo-Logos.png");

            MailMessage message = new MailMessage();
            message.From = new MailAddress("yipy-pm21@student.tarc.edu.my"); // Your email address
            message.To.Add(customerEmail);

            // Set the email subject and body
            message.Subject = "Invoice for Your Recent Purchase";
            message.IsBodyHtml = true;

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
                                        .header h1 {{
                                            margin: 0;
                                            font-size: 24px;
                                        }}
                                        .content {{
                                            padding: 20px;
                                        }}
                                        .content p {{
                                            margin: 0 0 10px;
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
                                            <h1>Thank You for Your Order!</h1>
                                        </div>
                                        <div class='content'>
                                            <p>Dear {customerName},</p> 
                                            <p>Thank you for your purchase from Uniqlo. Attached to this email you will find a PDF copy of your order details.</p>
                                            <p>We appreciate your business and hope you enjoy your purchase!</p>
                                            <p>If you have any questions or need further assistance, please do not hesitate to contact our customer support team.</p>
                                            <p>Thank you for supporting Uniqlo!</p>
                                            <p><img src='cid:companyLogo' alt='Company Logo' /></p>
                                        <div class='footer'>
                                            <p>&copy; 2024 Uniqlo. All rights reserved.</p>
                                        </div>
                                    </div>
                                </body>
                                </html>";

            message.Body = emailBody;

            // Attach the PDF file
            MemoryStream ms = new MemoryStream(pdfBytes);
            Attachment attachment = new Attachment(ms, "Invoice.pdf");
            message.Attachments.Add(attachment);

            LinkedResource companyLogo = new LinkedResource(companyLogoPath, "image/png")
            {
                ContentId = "companyLogo"
            };
            AlternateView avHtml = AlternateView.CreateAlternateViewFromString(emailBody, null, MediaTypeNames.Text.Html);
            avHtml.LinkedResources.Add(companyLogo);
            message.AlternateViews.Add(avHtml);

            // Configure SMTP settings
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.gmail.com"; // Your SMTP server
            smtpClient.Port = 587; // SMTP port (e.g., 587 for Gmail)
            smtpClient.EnableSsl = true; // Enable SSL if required
            smtpClient.Credentials = new NetworkCredential("yipy-pm21@student.tarc.edu.my", "030505070475"); // Your email credentials

            try
            {
                // Send the email
                smtpClient.Send(message);
                ScriptManager.RegisterStartupScript(this, GetType(), "successAlert", "Swal.fire('Success', 'Order email sent successfully!', 'success');", true);
            }
            catch (Exception ex)
            {
                // Handle the exception, for example, display an error message
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", $"Swal.fire('Error', 'An error occurred: {ex.Message}', 'error');", true);
            }
        }


        private string GetCustomerName()
        {
            int customerId = Convert.ToInt32(Session["Customer_Id"]);
            string customerName = string.Empty;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT Name FROM Customer WHERE Customer_Id = @CustomerId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            customerName = reader["Name"].ToString();
                        }
                    }
                }
            }
            return customerName;
        }



        protected void btnPDF_Click(object sender, EventArgs e)
        {
            try
            {
                // Generate the PDF receipt
                byte[] pdfBytes = GeneratePDFReceipt();

                if (pdfBytes != null && pdfBytes.Length > 0)
                {
                    // Send the PDF to the client for download
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=invoice.pdf");
                    Response.BinaryWrite(pdfBytes);
                    Response.End();
                }
                else
                {
                    // Handle the case where PDF generation failed
                    DisplayErrorMessage("PDF generation failed. Please try again.");
                }
            }
            catch (Exception ex)
            {
                // Handle the exception
                DisplayErrorMessage("An error occurred: " + ex.Message);
            }
        }

        private void DisplayErrorMessage(string message)
        {
            // Display error message using JavaScript alert
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + message + "')", true);
        }
    }
}