using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlTypes;
using System.Xml.Linq;
using Newtonsoft.Json;
using iTextSharp.text.pdf;


namespace Uniqlo.Pages
{
    public partial class Profile : System.Web.UI.Page
    {

        string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);
        //string imageDestination = "~/Images/ProfilePhoto/";
        //SqlCommand getUserDetails = new SqlCommand("SELECT * FROM Customer WHERE Customer_ID = '" + Request.Session);



        protected void Page_Load(object sender, EventArgs e)
        {
           
            //retrieve customer object from session
        
            int cust = Convert.ToInt32(Session["Customer_ID"]);

           // if (cust != null)
           // {
                // Use the customer's name to fetch additional data from the database
               // int id = cust.Customer_ID;

                // Your database query to fetch additional data based on the name
                string sql = "SELECT * FROM Customer WHERE Customer_ID = @Customer_ID";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();

                cmd.Parameters.AddWithValue("@Customer_ID", cust);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    //ViewState["imgSource"] = imageDestination + Convert.ToString(dr["img_src"]);
                    //ImgUpload.ImageUrl = ViewState["imgSource"].ToString();
                    txtName.Text = (string)dr["Name"];
                    txtEmail.Text = (string)dr["Email"];
                    string gender = (string)dr["Gender"];

                    if (gender == "M")
                    {
                        gender = "Male";
                    }
                    else
                    {
                        gender = "Female";
                    }
                    txtGender.Text = gender;                  
                    txtPhone.Text = (string)dr["Contact_No"];
                    txtAddress.Text = (string)dr["Address"];            
                    txtPostCode.Text = (string)dr["Postcode"];
                    txtCity.Text = (string)dr["City"];
                    txtState.Text = (string)dr["State"];
                    txtCountry.Text = (string)dr["Country"];
                }
                con.Close();
            //}


            if (!IsPostBack)
            {
                int custId = (int)Session["Customer_ID"];
                BindOrderRepeater(custId);
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
                using (var db=new OrderDbContext())
                {



                    var orderDetails = db.Order
                        .Where(o=>o.Customer_ID==customerID && o.IsDeleted == false)
                        .Select(o=> new {
                            Order_ID=o.Order_ID,
                            Total_Item =db.OrderList.Count(ol=>ol.Order_ID==o.Order_ID),
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
            int custId = (int)Session["Customer_ID"];
            FilterOrder(custId);
        }



        private void FilterOrder(int customerID)
        {
            try
            {
                using (var db = new OrderDbContext())
                {
                    string selectedDate = ddlDate.SelectedValue;

                    var orderDetails = db.Order
                        .Where(o => o.Customer_ID == customerID && o.IsDeleted == false)
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

    
