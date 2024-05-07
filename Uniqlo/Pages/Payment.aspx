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
            <form action="paymentServlet" method="doGet">
                <div class="row px-xl-5" >

                    <div class="col-lg-8" style="min-width:">
                        <div class="mb-4" >
                            <br /><br />
                            <h4 class="font-weight-semi-bold mb-4">Payment Method</h4>
                            <div class="card border-secondary mb-5">
                                <div class="card-header bg-secondary border-0">
                                    <h4 class="font-weight-semi-bold m-0">Payment</h4>
                                </div>
                                <div class="card-body">

                                    <div class="form-group">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" name="payment_method" id="cash" value="cash" required>
                                            <label class="custom-control-label" for="cash">Cash</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" name="payment_method" id="creditCard" value="creditCard" required>
                                            <label class="custom-control-label" for="creditCard">Credit Card</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" name="payment_method" id="debitCard" value="debitCard" required>
                                            <label class="custom-control-label" for="debitCard">Debit Card</label>
                                        </div>
                                    </div>

                                    <div id="card-info" style="display: none">
                                        <div class="form-group">
                                            <label for="card-holder-name">Card Holder Name</label>
                                            <input class="form-control" type="text" id="card-holder-name" name="holder_name" placeholder="John Tan">
                                        </div>
                                        <div class="form-group">
                                            <label for="card-type">Card Type</label>
                                            <select class="form-control" id="card-type" name="card_type">
                                                <option value="visa">Visa</option>
                                                <option value="mastercard">MasterCard</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="card-number">Card Number</label>
                                            <input type="text" class="form-control" id="card-number" name="card_number" placeholder="1234 5678 1234 5678" maxlength="19">
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="card-expiry">Expiry Date</label>
                                                <input type="text" class="form-control" id="card-expiry" name="expiry_date" placeholder="MM/YY" maxlength="5">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="card-cvv">CVV*</label>
                                                <input type="text" class="form-control" id="card-cvv" name="CVV" maxlength="3" pattern="[0-9]{3}" oninput="this.value=this.value.replace(/[^0-9]/g,'');">
                                            </div>
                                        </div>
                                    </div>

                                    <script>
                                        const cashRadio = document.getElementById("cash");
                                        const creditCardRadio = document.getElementById("creditCard");
                                        const debitCardRadio = document.getElementById("debitCard");
                                        const cardInfo = document.getElementById("card-info");

                                        cashRadio.addEventListener("change", function () {
                                            if (cashRadio.checked) {
                                                cardInfo.style.display = "none";
                                            }
                                        });

                                        creditCardRadio.addEventListener("change", function () {
                                            if (creditCardRadio.checked) {
                                                cardInfo.style.display = "block";
                                            }
                                        });

                                        debitCardRadio.addEventListener("change", function () {
                                            if (debitCardRadio.checked) {
                                                cardInfo.style.display = "block";
                                            }
                                        });
                                    </script>

                                </div>
                            </div>
                        </div>
                    </div>
                                                    <div class="col-lg-4">
                    <br /><br />
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Summary</h4>
                        </div>
                        <div class="card-body">
                            <h5 class="font-weight-medium mb-3">Products</h5>

                            

                            <div class="d-flex justify-content-between">
                                <p>AIRism Cotton Short Sleeve T-Shirt, White, M x 1</p>
                                <p>RM 30.00</p>
                            </div>

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
                            <a href="ConfirmPayment.aspx" class="viewMoreButton">Place Order</a>
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
