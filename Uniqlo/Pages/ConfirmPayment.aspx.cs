using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class ConfirmPayment : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtPaidBy.Text = (string)Session["PaymentMethod"];
                if (Session["PaymentMethod"].Equals("Credit Card") || Session["PaymentMethod"].Equals("Debit Card"))
                {
                    pnlCardDetails.Visible = true;
                    Card card = new Card();
                    card = (Card)Session["Card"];

                    txtCardHolderName.Text = card.CardHolderName;
                    txtCardType.Text = card.CardType;
                    txtCardNumber.Text = card.CardNumber;
                    txtExpiryDate.Text = card.ExpiryDate; 
                    txtCVV.Text = card.CVV;

                }
                // Retrieve and bind cart data if it's supposed to be displayed
                if (Session["Cart"] != null)
                {
                    List<CartItem> cart = (List<CartItem>)Session["Cart"];
                    CartRepeater.DataSource = cart;
                    CartRepeater.DataBind();

                    decimal totalPrice = (decimal)Session["TotalPrice"];
                    lblTotalPrice.Text = "RM " + totalPrice.ToString("N2");

                    decimal deliveryCharge = (decimal)Session["ShippingFee"];
                    lblDeliveryCharges.Text = "RM " + deliveryCharge.ToString("N2");

                    decimal grandTotal = (decimal)Session["GrandTotal"];
                    lblGrandTotal.Text = "RM " + grandTotal.ToString("N2");

                }

                if (Session["Customer_Id"] != null)
                {
                    string sql = "SELECT * FROM Customer WHERE Customer_Id =@Customer_Id";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@Customer_Id", Session["Customer_Id"]);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtName.Text = (string)dr["Name"];
                        txtEmail.Text = (string)dr["Email"];
                        txtContact.Text = (string)dr["Contact_No"];
                    }
                }

                if (Session["ShippingAddress"] != null)
                {
                    Address shippingAddress = new Address();
                    shippingAddress = (Address)Session["ShippingAddress"];
                    txtCountry.Text = shippingAddress.Country;
                    txtAddress.Text = shippingAddress.AddressLine;
                    txtPostcode.Text = shippingAddress.Postcode;
                    txtState.Text = shippingAddress.State;
                    txtCity.Text = shippingAddress.City;
                }

                if (Session["DeliveryNote"] != null)
                {
                    txtDeliveryInstruction.Text = (string)Session["DeliveryNote"];
                }

            }
        }
        protected void lnkConfirmOrder_Click(object sender, EventArgs e)
        {
            //confirm order, so create orderlist, order, payment, and delivery insert into database

            /**
             * using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Start a local transaction.
                SqlTransaction sqlTran = con.BeginTransaction();

                try
                {
                    // Initialize command with transaction
                    SqlCommand cmd = con.CreateCommand();
                    cmd.Transaction = sqlTran;

                    // Insert Address
                    Address shippingAddress = (Address)Session["ShippingAddress"];
                    cmd.CommandText = "INSERT INTO Shipping_Address (Address, State, City, Postcode, Country) VALUES (@Address, @State, @City, @Postcode, @Country); SELECT SCOPE_IDENTITY();";
                    cmd.Parameters.AddWithValue("@Address", shippingAddress.AddressLine);
                    cmd.Parameters.AddWithValue("@State", shippingAddress.State);
                    cmd.Parameters.AddWithValue("@City", shippingAddress.City);
                    cmd.Parameters.AddWithValue("@Postcode", shippingAddress.Postcode);
                    cmd.Parameters.AddWithValue("@Country", shippingAddress.Country);
                    int addressId = Convert.ToInt32(cmd.ExecuteScalar());

                    // Insert Order
                    int customerId = Convert.ToInt32(Session["Customer_Id"]);
                    List<CartItem> cartItems = Session["Cart"] as List<CartItem>;
                    decimal subtotal = (decimal)Session["TotalPrice"];
                    cmd.CommandText = "INSERT INTO Orders (Customer_Id, Subtotal) VALUES (@CustomerId, @Subtotal); SELECT SCOPE_IDENTITY();";
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    cmd.Parameters.AddWithValue("@Subtotal", subtotal);
                    int orderId = Convert.ToInt32(cmd.ExecuteScalar());

                    // Insert OrderList
                    foreach (var item in cartItems)
                    {
                        cmd.CommandText = "INSERT INTO OrderList (Order_Id, Qty, Quantity_Id, Item_Price) VALUES (@OrderId, @Quantity, @QuantityId, @ItemPrice);";
                        cmd.Parameters.AddWithValue("@OrderId", orderId);
                        cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                        cmd.Parameters.AddWithValue("@QuantityId", item.Quantity_Id);
                        cmd.Parameters.AddWithValue("@ItemPrice", item.Item_Price);
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                    }

                    // Insert Delivery
                    string deliveryNote = Session["DeliveryNote"] as string;
                    cmd.CommandText = "INSERT INTO Delivery (Address_Id, Delivery_Note, Delivery_Status) VALUES (@AddressId, @DeliveryNote, 'Packaging'); SELECT SCOPE_IDENTITY();";
                    cmd.Parameters.AddWithValue("@AddressId", addressId);
                    cmd.Parameters.AddWithValue("@DeliveryNote", deliveryNote);
                    int deliveryId = Convert.ToInt32(cmd.ExecuteScalar());

                    // Insert Payment
                    double shippingFee = Convert.ToDouble(Session["ShippingFee"]);
                    string paymentMethod = Session["PaymentMethod"] as string;
                    string paymentStatus = paymentMethod == "Cash" ? "Unpaid" : "Paid";
                    decimal totalPayment = subtotal + (decimal)shippingFee;
                    cmd.CommandText = "INSERT INTO Payment (Delivery_Id, Order_Id, Total_Payment, Shipping_Amount, Payment_Method, Payment_Status, Payment_DateTime) VALUES (@DeliveryId, @OrderId, @TotalPayment, @ShippingFee, @PaymentMethod, @PaymentStatus, @PaymentDateTime);";
                    cmd.Parameters.AddWithValue("@DeliveryId", deliveryId);
                    cmd.Parameters.AddWithValue("@OrderId", orderId);
                    cmd.Parameters.AddWithValue("@TotalPayment", totalPayment);
                    cmd.Parameters.AddWithValue("@ShippingFee", shippingFee);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmd.Parameters.AddWithValue("@PaymentStatus", paymentStatus);
                    cmd.Parameters.AddWithValue("@PaymentDateTime", DateTime.Now);
                    cmd.ExecuteNonQuery();

                    // Commit the transaction.
                    sqlTran.Commit();
                    Response.Redirect("Invoice.aspx");
                }
                catch (Exception ex)
                {
                    // Display error message on the page
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Error processing order: " + ex.Message;

                    try
                    {
                        // Attempt to roll back the transaction.
                        sqlTran.Rollback();
                    }
                    catch (Exception exRollback)
                    {
                        // Update error message with rollback info
                        lblErrorMessage.Text += " Error during rollback: " + exRollback.Message;
                    }
                }
            }**/
            Response.Redirect("Invoice.aspx");
        }

        

    }
}