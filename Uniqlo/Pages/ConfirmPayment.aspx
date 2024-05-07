<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ConfirmPayment.aspx.cs" Inherits="Uniqlo.Pages.ConfirmPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <header>
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style1.css" rel="stylesheet" />
        <link href="../css/delivery.css" rel="stylesheet" />
    </header>

    <!-- Checkout Review Start -->
    <div class="container-fluid pt-5">
        <section class="step-wizard">
            <ul class="step-wizard-list">
                <li class="step-wizard-item">
                    <span class="progress-count">1</span>
                    <span class="progress-label">Customer Information</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">2</span>
                    <span class="progress-label">Payment Method</span>
                </li>
                <li class="step-wizard-item current-item">
                    <span class="progress-count">3</span>
                    <span class="progress-label">Confirmation</span>
                </li>
                <li class="step-wizard-item">
                    <span class="progress-count">4</span>
                    <span class="progress-label">Invoice</span>
                </li>
            </ul>
        </section>

        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <br />
                    <br />
                    <h4 class="font-weight-semi-bold mb-4">Delivery Information</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Name</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <asp:TextBox ID="txtContact" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <asp:TextBox ID="txtCountry" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line</label>
                            <asp:TextBox ID="txtAddress" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Post Code</label>
                            <asp:TextBox ID="txtPostcode" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <asp:TextBox ID="txtState" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <asp:TextBox ID="txtCity" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Delivery Instruction</label>
                            <asp:TextBox ID="txtDeliveryInstruction" CssClass="form-control" ReadOnly="true" runat="server" />
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <label>Paid By :</label>
                    <asp:TextBox ID="txtPaidBy" CssClass="form-control" ReadOnly="true" runat="server" />
                </div>

                <asp:Panel ID="pnlCardDetails" runat="server" Visible="false">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Card Holder Name :</label>
                            <asp:TextBox ID="txtCardHolderName" CssClass="form-control" ReadOnly="true" Text="Tan Choo Jun" runat="server" />
                        </div>
                        <div class="form-group col-md-6">
                            <label>Card Type :</label>
                            <asp:TextBox ID="txtCardType" CssClass="form-control" ReadOnly="true" Text="Master Card" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Card Number :</label>
                        <asp:TextBox ID="txtCardNumber" CssClass="form-control" ReadOnly="true" Text="9784560321459872" runat="server" />
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Expiry Date :</label>
                            <asp:TextBox ID="txtExpiryDate" CssClass="form-control" ReadOnly="true" Text="04/28" runat="server" />
                        </div>
                        <div class="form-group col-md-6">
                            <label>CVV :</label>
                            <asp:TextBox ID="txtCVV" CssClass="form-control" ReadOnly="true" Text="888" runat="server" />
                        </div>
                    </div>
                </asp:Panel>

            </div>
            <div class="col-lg-4">
                <br />
                <br />
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Summary</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Products</h5>



                        <asp:Repeater ID="CartRepeater" runat="server">
                            <ItemTemplate>
                                <div class="d-flex justify-content-between">
                                    <p><%# Eval("Name") %>, <%# Eval("Size") %>, <%# Eval("Color") %> x <%# Eval("Quantity") %></p>
                                    <p>RM <%# Eval("Item_Price", "{0:F2}") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Total Price</h6>
                            <h6 class="font-weight-medium">
                                <asp:Label ID="lblTotalPrice" runat="server"></asp:Label></h6>
                        </div>

                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Delivery Charges</h6>
                            <h6 class="font-weight-medium">
                                <asp:Label ID="lblDeliveryCharges" runat="server"></asp:Label></h6>
                        </div>

                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">
                                <asp:Label ID="lblGrandTotal" runat="server"></asp:Label></h5>
                        </div>
                    </div>
                </div>
                
                    <div class="viewMoreSection">
                        <asp:LinkButton ID="lnkConfirmOrder" runat="server" CssClass="viewMoreButton" OnClick="lnkConfirmOrder_Click" Text="Confirm Order" />
                    </div>
                
                <div id="popup" class="popup">
                    <div class="popup-content">
                        <span class="close">&times;</span>
                        <h2>Thank You for Your Order!</h2>
                        <p>Your payment id is <span id="payment-id">#getPayment_id</span>.</p>
                        <p>Your order was placed on <span id="transaction-date"></span>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->

</asp:Content>
