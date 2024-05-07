<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Uniqlo.Pages.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style1.css" rel="stylesheet" />
        <link href="../css/delivery.css" rel="stylesheet" />
    </header>
    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <section class="step-wizard">
            <ul class="step-wizard-list">
                <li class="step-wizard-item">
                    <span class="progress-count">1</span>
                    <span class="progress-label">Customer Information</span>
                </li>
                <li class="step-wizard-item current-item">
                    <span class="progress-count">2</span>
                    <span class="progress-label">Payment Method</span>
                </li>
                <li class="step-wizard-item">
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

                <div class="col-lg-8" style="min-width: ">
                    <div class="mb-4">
                        <br />
                        <br />
                        <h4 class="font-weight-semi-bold mb-4">Payment Method</h4>
                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Payment</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="error-message" Visible="false"></asp:Label>
                                <div class="form-group">
                                    <asp:RadioButton ID="rbCash" runat="server" GroupName="PaymentMethod" Text="Cash" AutoPostBack="true" OnCheckedChanged="PaymentMethod_Changed" />
                                </div>
                                <div class="form-group">
                                    <asp:RadioButton ID="rbCreditCard" runat="server" GroupName="PaymentMethod" Text="Credit Card" AutoPostBack="true" OnCheckedChanged="PaymentMethod_Changed" />
                                </div>
                                <div class="form-group">
                                    <asp:RadioButton ID="rbDebitCard" runat="server" GroupName="PaymentMethod" Text="Debit Card" AutoPostBack="true" OnCheckedChanged="PaymentMethod_Changed" />
                                </div>
                                <asp:Panel ID="cardInfo" runat="server" Visible="false">

                                    <div class="form-group">
                                        <label for="card-holder-name">Card Holder Name</label>
                                        <asp:TextBox ID="txtCardHolderName" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvCardHolderName" ControlToValidate="txtCardHolderName" ErrorMessage="Card holder name is required." Display="Dynamic" ForeColor="Red" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="card-type">Card Type</label>
                                        <asp:DropDownList ID="ddlCardType" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Visa" Value="visa" />
                                            <asp:ListItem Text="MasterCard" Value="mastercard" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvCardType" ControlToValidate="ddlCardType" ErrorMessage="Please select a card type." InitialValue="" Display="Dynamic" ForeColor="Red" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label for="card-number">Card Number</label>
                                        <asp:TextBox ID="txtCardNumber" CssClass="form-control" MaxLength="19" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvCardNumber" ControlToValidate="txtCardNumber" ErrorMessage="Card number is required." Display="Dynamic" ForeColor="Red" runat="server" />
                                        <asp:RegularExpressionValidator ID="revCardNumber" ControlToValidate="txtCardNumber" ValidationExpression="^\d{16}$" ErrorMessage="Card number must be 16 digits." Display="Dynamic" ForeColor="Red" runat="server" />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="card-expiry">Expiry Date</label>
                                            <asp:TextBox ID="txtCardExpiry" CssClass="form-control" MaxLength="5" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvCardExpiry" ControlToValidate="txtCardExpiry" ErrorMessage="Expiry date is required." Display="Dynamic" ForeColor="Red" runat="server" />
                                            <asp:RegularExpressionValidator ID="revCardExpiry" ControlToValidate="txtCardExpiry" ValidationExpression="^(0[1-9]|1[0-2])\/?([0-9]{2})$" ErrorMessage="Invalid expiry date format. Use MM/YY." Display="Dynamic" ForeColor="Red" runat="server" />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="card-cvv">CVV*</label>
                                            <asp:TextBox ID="txtCardCvv" CssClass="form-control" MaxLength="3" runat="server" />
                                            <asp:RequiredFieldValidator ID="rfvCardCvv" ControlToValidate="txtCardCvv" ErrorMessage="CVV is required." Display="Dynamic" ForeColor="Red" runat="server" />
                                            <asp:RegularExpressionValidator ID="revCardCvv" ControlToValidate="txtCardCvv" ValidationExpression="^\d{3}$" ErrorMessage="CVV must be 3 digits." Display="Dynamic" ForeColor="Red" runat="server" />
                                        </div>
                                    </div>

                                </asp:Panel>

                            </div>
                        </div>
                    </div>
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
                                        <p>RM <%# Eval("Price", "{0:F2}") %></p>
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

                    <!--
                        <div class="card-footer border-secondary bg-transparent">
                            <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" id="order-btn"><a style="text-decoration:none; color:black" href="ConfirmPayment.aspx">Place Order</a></button>
                        </div>
                        -->
                    <!--VIEWMORE BUTTON-->
                    <div class="viewMoreSection">
                        <asp:LinkButton ID="lnkPlaceOrder" runat="server" CssClass="viewMoreButton" OnClick="lnkPlaceOrder_Click">Place Order</asp:LinkButton>
                    </div>


                    <div class="popup-container" id="popup">
                        <div class="popup">
                            <h2>Thank you for your order!</h2>
                            <p>Your transaction number is <span id="transaction-number"></span></p>
                            <p>Your order was placed on <span id="order-date"></span></p>
                            <p>Check your order status <a href="#" id="order-status-link">here</a></p>
                            <button id="close-popup">Close</button>
                        </div>
                    </div>

                </div>

            </div>
        </form>
    </div>

    <!-- Checkout End -->

</asp:Content>
