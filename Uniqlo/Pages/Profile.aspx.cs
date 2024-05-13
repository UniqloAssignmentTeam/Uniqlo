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


namespace Uniqlo.Pages
{
    public partial class Profile : System.Web.UI.Page
    {

        string cs = Global.CS;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UniqloConnectionString"].ConnectionString);

        //SqlCommand getUserDetails = new SqlCommand("SELECT * FROM Customer WHERE Customer_ID = '" + Request.Session);

        

        protected void Page_Load(object sender, EventArgs e)
        {
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
            using (var db=new OrderDbContext())
            {



                var orderDetails = db.Order
                    .Where(o=>o.Customer_ID==customerID)
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
                        .Where(o => o.Customer_ID == customerID)
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
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when filtering products.');", true);
            }
        }

    }
}

    
