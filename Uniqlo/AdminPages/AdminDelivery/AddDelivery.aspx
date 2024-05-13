<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddDelivery.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDelivery.AddDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <header>
        <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
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
            <h2 class="product-title">UNIQLO ADD DELIVERY</h2>
        </div>
        <div class="modal-content">
            <div class="product-content">
                <div class="form-group">

                    <label for="ddlPaymentID">Payment ID</label>
                    <asp:DropDownList ID="ddlPaymentID" runat="server" CssClass="dropdown-display">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPaymentID" runat="server" ControlToValidate="ddlPaymentID" InitialValue="" ErrorMessage="Please select a Payment ID" CssClass="error-message" Display="Dynamic" />
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
                    <asp:TextBox ID="txtCountry" runat="server" Enabled="false" CssClass="input-field" Text="Malaysia"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDeliveryNote">Delivery Note</label>
                    <asp:TextBox ID="txtDeliveryNote" runat="server" CssClass="input-field" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlStatus">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="dropdown">
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="In Transit" Value="In Transit"></asp:ListItem>
                        <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" InitialValue="" ErrorMessage="Please select a status" CssClass="error-message" Display="Dynamic" />
                </div>
            </div>
            <div class="button-container">
                <div class="cancel-div">
                    <asp:LinkButton ID="btnCancel" runat="server" CssClass="cancel-button" OnClick="btnCancel_Click" CausesValidation="false">CANCEL</asp:LinkButton>
                </div>
                <div class="continue-div">
                    <asp:LinkButton ID="btnAddDelivery" runat="server" CssClass="continue-button" OnClick="btnAddDelivery_Click">ADD DELIVERY</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>
</asp:Content>
