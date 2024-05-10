using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminStaff;

namespace Uniqlo.AdminPages
{
    public partial class UpdateDelivery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string deliveryId = Request.QueryString["DeliveryID"];


                if (!string.IsNullOrEmpty(deliveryId))
                {
                    loadDeliveryDetails(int.Parse(deliveryId));
                }
            }
        }

        protected void loadDeliveryDetails(int deliveryId)
        {
            using (var db = new DeliveryDbContext())
            {
                var delivery = db.delivery.Include("Shipping_Address").FirstOrDefault(s => s.Delivery_ID == deliveryId);
                if (delivery != null)
                {
                    // Set TextBox Text properties to the corresponding values from the delivery object
                    txtDeliveryID.Text = delivery.Delivery_ID.ToString();
                    txtAddress.Text = delivery.Shipping_Address.Address;
                    txtState.Text = delivery.Shipping_Address.State;
                    txtCity.Text = delivery.Shipping_Address.City;
                    txtPostcode.Text = delivery.Shipping_Address.Postcode;
                    txtCountry.Text = delivery.Shipping_Address.Country;
                    txtDeliveryNote.Text = delivery.Delivery_Note;
                    // Assuming ddlStatus is the DropDownList for status
                    if (ddlStatus.Items.FindByValue(delivery.Delivery_Status) != null)
                    {
                        ddlStatus.SelectedValue = delivery.Delivery_Status;
                    }
                } 
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new DeliveryDbContext()) // Replace 'DeliveryDbContext' with your actual context
                {
                    int deliveryId = Convert.ToInt32(txtDeliveryID.Text); // Assuming the Delivery ID is being displayed
                    var delivery = db.delivery.FirstOrDefault(d => d.Delivery_ID == deliveryId);

                    if (delivery != null)
                    {
                        // Update properties
                        delivery.Shipping_Address.Address = txtAddress.Text;
                        delivery.Shipping_Address.State = txtState.Text;
                        delivery.Shipping_Address.City = txtCity.Text;
                        delivery.Shipping_Address.Postcode = txtPostcode.Text;
                        delivery.Delivery_Status = ddlStatus.SelectedValue;
                        delivery.Delivery_Note = txtDeliveryNote.Text;  

                        db.SaveChanges(); 

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Update successful');", true);
                        Response.Redirect("Delivery.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popupError", "alert('An error occurred: " + ex.Message + "');", true);
            }
        }
    }
}