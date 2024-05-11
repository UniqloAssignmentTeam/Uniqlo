using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                    // Combine address details in the desired sequence
                    string combineAddress = $"{delivery.Shipping_Address.Address}, {delivery.Shipping_Address.Postcode}, {delivery.Shipping_Address.City}, {delivery.Shipping_Address.State}, {delivery.Shipping_Address.Country}";

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

                    // Call SetGoogleMapsSrc with the combined address
                    SetGoogleMapsSrc(combineAddress);
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
                        Response.Redirect("DeliveryHome.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popupError", "alert('An error occurred: " + ex.Message + "');", true);
            }
        }

        private void SetGoogleMapsSrc(string address)
        {
            // Construct the URL for the Google Maps API
            string apiKey = "AIzaSyDEC20FQimx1-CFj_t8QgNMPFfmwdzuAAo"; // Replace with your Google Maps API key
            string apiUrl = $"https://maps.googleapis.com/maps/api/js?key={apiKey}&callback=initMap";

            // Register the Google Maps API script
            HtmlGenericControl script = new HtmlGenericControl("script");
            script.Attributes["src"] = apiUrl;
            script.Attributes["async"] = "async";
            script.Attributes["defer"] = "defer";
            Page.Header.Controls.Add(script);

            // Define the JavaScript function to initialize the map
            // Inside the SetGoogleMapsSrc method
            string initMapScript = @"
<script>
    function initMap() {
        var geocoder = new google.maps.Geocoder();
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP // Set the map type
        });

        var userAddress = '" + address + @"';
        var currentLocation;

        // Get the current location using HTML5 Geolocation
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                currentLocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                // Add a marker for the user's address
                geocoder.geocode({ 'address': userAddress }, function(results, status) {
                    if (status === 'OK') {
                        var userMarker = new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location
                        });

                        // Set map center to the user's address
                        map.setCenter(results[0].geometry.location);

                        // Display route from current location to user's address
                        var directionsService = new google.maps.DirectionsService();
                        var directionsRenderer = new google.maps.DirectionsRenderer({ map: map });
                        var request = {
                            origin: currentLocation,
                            destination: results[0].geometry.location,
                            travelMode: google.maps.TravelMode.DRIVING // You can change the travel mode if needed
                        };
                        directionsService.route(request, function(response, status) {
                            if (status === 'OK') {
                                directionsRenderer.setDirections(response);
                            } else {
                                alert('Directions request failed due to ' + status);
                            }
                        });
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }, function() {
                alert('Error: The Geolocation service failed.');
            });
        } else {
            alert('Error: Your browser doesn\'t support geolocation.');
        }
    }
</script>";

            Page.Header.Controls.Add(new LiteralControl(initMapScript));
        }

    }
}