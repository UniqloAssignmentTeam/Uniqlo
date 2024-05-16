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
                string deliveryId = EncryptionHelper.Decrypt(Request.QueryString["DeliveryID"]);

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
                var delivery = db.Delivery.Include("Shipping_Address").FirstOrDefault(s => s.Delivery_ID == deliveryId);
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
                    var delivery = db.Delivery.FirstOrDefault(d => d.Delivery_ID == deliveryId);

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

                        ScriptManager.RegisterStartupScript(this, GetType(), "SuccessMessage", "successUpdate();", true);
                        
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ErrorMessage", $"errorUpdate('{ex.Message}');", true);
            }
        }

        private void SetGoogleMapsSrc(string address)
        {
            string apiKey = "Your_Google_Maps_API_Key"; // Replace with your actual API key
            string apiUrl = $"https://maps.googleapis.com/maps/api/js?key={apiKey}&callback=initMap";

            HtmlGenericControl script = new HtmlGenericControl("script");
            script.Attributes["src"] = apiUrl;
            script.Attributes["async"] = "async";
            script.Attributes["defer"] = "defer";
            Page.Header.Controls.Add(script);

            string initMapScript = @"
    <script>
        function checkLocationPermission() {
            if (navigator.permissions) {
                navigator.permissions.query({ name: 'geolocation' }).then(function (result) {
                    if (result.state === 'granted') {
                        initMap();
                    } else if (result.state === 'prompt') {
                        requestLocationPermission();
                    } else if (result.state === 'denied') {
                        Swal.fire({
                            title: 'Location Permission Denied',
                            text: 'Access to your location was denied. Please enable location services in your browser settings to use this feature.',
                            icon: 'warning',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            } else {
                initMap();
            }
        }

        function requestLocationPermission() {
            navigator.geolocation.getCurrentPosition(function (position) {
                initMap();
            }, function (error) {
                Swal.fire({
                    title: 'Location Permission Needed',
                    text: 'To use this feature, please enable location services in your browser settings.',
                    icon: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'OK'
                });
            });
        }

        function initMap() {
            var geocoder = new google.maps.Geocoder();
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            var userAddress = '" + address + @"';
            var currentLocation;

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    currentLocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    geocoder.geocode({ 'address': userAddress }, function(results, status) {
                        if (status === 'OK') {
                            var userMarker = new google.maps.Marker({
                                map: map,
                                position: results[0].geometry.location
                            });

                            map.setCenter(results[0].geometry.location);

                            var directionsService = new google.maps.DirectionsService();
                            var directionsRenderer = new google.maps.DirectionsRenderer({ map: map });
                            var request = {
                                origin: currentLocation,
                                destination: results[0].geometry.location,
                                travelMode: google.maps.TravelMode.DRIVING
                            };
                            directionsService.route(request, function(response, status) {
                                if (status === 'OK') {
                                    directionsRenderer.setDirections(response);
                                } else {
                                    Swal.fire('Failed', 'Directions request failed due to ' + status, 'error');
                                }
                            });
                        } else {
                            Swal.fire('Geocoding error', 'Geocode was not successful for the following reason: ' + status, 'error');
                        }
                    });
                }, function() {
                    Swal.fire('Geolocation error', 'The Geolocation service failed.', 'error');
                });
            } else {
                Swal.fire('Unsupported Feature', 'Error: Your browser doesn\'t support geolocation.', 'error');
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            checkLocationPermission();
        });
    </script>";

            Page.Header.Controls.Add(new LiteralControl(initMapScript));

        }
    }
}