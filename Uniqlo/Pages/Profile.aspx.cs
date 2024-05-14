using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Diagnostics;
using System.Linq;

namespace Uniqlo.Pages
{
    public partial class Profile : Page
    {
        string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sessionValue = Session["Customer_ID"] as string;

                if (int.TryParse(sessionValue, out int custId))
                {
                    LoadUserProfile(custId);
                    BindOrderRepeater(custId);
                }
                else
                {
                    Debug.WriteLine("Failed to convert session value to integer: " + sessionValue);
                }
            }
        }

        private void LoadUserProfile(int custId)
        {
            string sql = "SELECT * FROM Customer WHERE Customer_ID = @Customer_ID";
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@Customer_ID", custId);
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        txtName.Text = dr["Name"].ToString();
                        txtEmail.Text = dr["Email"].ToString();
                        txtGender.Text = dr["Gender"].ToString() == "M" ? "Male" : "Female";
                        txtPhone.Text = dr["Contact_No"].ToString();
                        txtAddress.Text = dr["Address"].ToString();
                        txtPostCode.Text = dr["Postcode"].ToString();
                        txtCity.Text = dr["City"].ToString();
                        txtState.Text = dr["State"].ToString();
                        txtCountry.Text = dr["Country"].ToString();

                      
                    }
                }
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void btnChgPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
        private void BindOrderRepeater(int customerID)
        {
            try
            {
                using (var db = new OrderDbContext())
                {



                    var orderDetails = db.Order
                        .Where(o => o.Customer_ID == customerID && !o.IsDeleted)
                        .Select(o => new {
                            Order_ID = o.Order_ID,
                            Total_Item = db.OrderList.Count(ol => ol.Order_ID == o.Order_ID),
                            Total_Price = db.Payment
                                    .Where(p => p.Order_ID == o.Order_ID)
                                    .Select(p => p.Total_Payment)
                                    .DefaultIfEmpty(0) // Ensures a default if no payment exists
                                    .Sum(), // Sum of all payments (in case of multiple payments per order)
                            Payment_DateTime = db.Payment
                                    .Where(p => p.Order_ID == o.Order_ID)
                                    .OrderByDescending(p => p.Payment_DateTime) // Most recent payment
                                    .Select(p => (DateTime?)p.Payment_DateTime) // Nullable DateTime
                                    .FirstOrDefault(),
                            Delivery_Status = db.Delivery
                                       .Where(d => d.Delivery_ID == db.Payment
                                                    .Where(p => p.Order_ID == o.Order_ID)
                                                    .Select(p => p.Delivery_ID)
                                                    .FirstOrDefault())
                                       .Select(d => d.Delivery_Status)
                                       .FirstOrDefault() // Assuming there's one delivery per payment
                        })
                        .ToList();



                    orderRepeater.DataSource = orderDetails;
                    orderRepeater.DataBind();




                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when retrieve order.');", true);
            }



        }

        protected void ddlDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sessionValue = Session["Customer_ID"] as string;

            if (int.TryParse(sessionValue, out int custId))
            {
                FilterOrder(custId);
            }
            else
            {
                Debug.WriteLine("Failed to convert session value to integer: " + sessionValue);
            }

        }

        private void FilterOrder(int customerID)
        {
            try
            {
                using (var db = new OrderDbContext())
                {
                    string selectedDate = ddlDate.SelectedValue;

                    var orderDetails = db.Order
                        .Where(o => o.Customer_ID == customerID && !o.IsDeleted)
                        .Select(o => new
                        {
                            Order_ID = o.Order_ID,
                            Total_Item = db.OrderList.Count(ol => ol.Order_ID == o.Order_ID),
                            Total_Price = db.Payment
                                    .Where(p => p.Order_ID == o.Order_ID)
                                    .Select(p => p.Total_Payment)
                                    .DefaultIfEmpty(0)
                                    .Sum(),
                            Payment_DateTime = db.Payment
                                    .Where(p => p.Order_ID == o.Order_ID)
                                    .OrderByDescending(p => p.Payment_DateTime)
                                    .Select(p => (DateTime?)p.Payment_DateTime)
                                    .FirstOrDefault(),
                            Delivery_Status = db.Delivery
                                       .Where(d => d.Delivery_ID == db.Payment
                                                    .Where(p => p.Order_ID == o.Order_ID)
                                                    .Select(p => p.Delivery_ID)
                                                    .FirstOrDefault())
                                       .Select(d => d.Delivery_Status)
                                       .FirstOrDefault()
                        });

                    // Apply sorting based on price
                    if (!string.IsNullOrEmpty(selectedDate))
                    {
                        switch (selectedDate)
                        {
                            case "ascending":
                                orderDetails = orderDetails.OrderBy(o => o.Payment_DateTime);
                                break;
                            case "descending":
                                orderDetails = orderDetails.OrderByDescending(o => o.Payment_DateTime);
                                break;
                        }
                    }

                    var productList = orderDetails.ToList();
                    orderRepeater.DataSource = productList;
                    orderRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when filtering order.');", true);
            }
        }
    }
}
