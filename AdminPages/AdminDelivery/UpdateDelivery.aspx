<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateDelivery.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" />
    <header>
        <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            .error-message {
    color: red;
    font-size: 0.8rem;
    padding-top: 5px;
}

        </style>
    </header>
    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO UPDATE DELIVERY</h2>
            <div id="map" style="width: 100%; height: 300px; margin: 0 auto; margin-top: 50px;"></div>
        </div>
        <div class="modal-content">
            <div class="product-content">
                <div class="form-group">
                    
                    <label for="txtDeliveryID">Delivery ID</label>
                    <asp:TextBox ID="txtDeliveryID" runat="server" Enabled="false" CssClass="input-field"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" CssClass="error-message" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label for="txtState">State</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="input-field"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="txtState" ErrorMessage="State is required" CssClass="error-message" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label for="txtCity">City</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="input-field"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required" CssClass="error-message" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label for="txtPostcode">Postcode</label>
                    <asp:TextBox ID="txtPostcode" runat="server" CssClass="input-field"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" ControlToValidate="txtPostcode" ErrorMessage="Postcode is required" CssClass="error-message" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPostcode" runat="server" ControlToValidate="txtPostcode" ValidationExpression="^\d{4,5}$" ErrorMessage="Invalid postcode format" CssClass="error-message" Display="Dynamic" />
                </div>
                <div class="form-group">
                    <label for="txtCountry">Country</label>
                    <asp:TextBox ID="txtCountry" runat="server" Enabled="false" CssClass="input-field"></asp:TextBox>

                </div>

                <div class="form-group">
    <label for="txtDeliveryNote">Delivery Note</label>
    <asp:TextBox ID="txtDeliveryNote" runat="server" CssClass="input-field" TextMode="MultiLine" Rows="3"></asp:TextBox>
    
</div>

                <div class="form-group">
                    <label for="ddlStatus">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropdown-display">
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="In Transit" Value="In Transit"></asp:ListItem>
                        <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                    </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" InitialValue="" ErrorMessage="Please select a status" CssClass="error-message" Display="Dynamic" />
                </div>

            </div>
            <div class="button-container">
                <div class="cancel-div">
                    <asp:LinkButton ID="btnCancel" runat="server" CssClass="cancel-button" PostBackUrl="~/AdminPages/AdminDelivery/DeliveryHome.aspx">CANCEL</asp:LinkButton>
                </div>
              <div class="continue-div">
    <asp:LinkButton ID="btnUpdate" runat="server" CssClass="continue-button" OnClientClick="return updateDelivery();" OnClick="btnUpdate_Click">UPDATE</asp:LinkButton>
</div>
            </div>
        </div>
    </div>
    <footer>
        <script>



            function updateDelivery() {
                event.preventDefault(); // Prevent default form submission
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to update the delivery details?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, update it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Perform the server-side operation
                        __doPostBack('<%= btnUpdate.UniqueID %>', '');
        }
    });
                return false; // Prevent form submission
            }
            function successUpdate() {
                Swal.fire(
                    'Updated!',
                    'Your delivery details have been updated successfully.',
                    'success'
                ).then((result) => {
                    window.location.href = 'DeliveryHome.aspx'; // Redirect after acknowledging the success
                });
            }

            function errorUpdate(errorMessage) {
                Swal.fire(
                    'Error!',
                    'An error occurred: ' + errorMessage,
                    'error'
                );
            }
        </script>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>
</asp:Content>