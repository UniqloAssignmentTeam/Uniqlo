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
                        <br /><br />
                        <h4 class="font-weight-semi-bold mb-4">Delivery Information</h4>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Name</label>
                                <input class="form-control" type="text" name="name" value="Tan Choo Jun"  readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>E-mail</label>
                                <input class="form-control" type="text" name="email" value="cjtan@gmail.com" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Mobile No</label>
                                <input class="form-control" type="text" name="contact_no" value="0148169029" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Country</label>
                                <input class="form-control" type="text" value="Malaysia" readonly="readonly" >
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address Line</label>
                                <input class="form-control" type="text" value="1, Jalan Lembah Permai" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Post Code</label>
                                <input class="form-control" type="text" value="11900" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>State</label>
                                <input class="form-control" type="text" value="Penang" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>City</label>
                                <input class="form-control" type="text" value="Tanjung Bungah" readonly="readonly">
                            </div>
                                                        <div class="col-md-12 form-group">
    <label>
        <br />
        Delivery Instruction </label>
    <input class="form-control" name="city" type="text" value="" readonly="readonly">
</div>
                        </div>
                    </div>
                    <br /><br />
                    <h4 class="font-weight-semi-bold mb-4">Payment Method</h4>
                    <div class="form-group">
                        <label>Paid By : </label>
                        <input class="form-control" type="text" readonly="readonly" value="Credit Card">
                    </div>
                    
                        <!--if  not cash-->
                    <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Card Holder Name : </label>
                        <input class="form-control" type="text" readonly="readonly" value="Tan Choo Jun">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Card Type : </label>
                        <input class="form-control" type="text" readonly="readonly" value="Master Card">
                    </div>
                    </div>
                    <div class="form-group">
                        <label>Card Number : </label>
                        <input class="form-control" type="text" readonly="readonly" value="9784560321459872">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Expiry Date : </label>
                            <input class="form-control" type="text" readonly="readonly" value="04/28">
                        </div>
                        <div class="form-group col-md-6">
                            <label>CVV : </label>
                            <input class="form-control" type="text" readonly="readonly" value="888">
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

                            <!--% for (int i = 0; i < cartItems.size(); i++) {%-->

                                                        <div class="d-flex justify-content-between">
                                <p>AIRism Cotton Short Sleeve T-Shirt, White, M x 1</p>
                                <p>RM 30.00</p>
                            </div>

                            <div class="d-flex justify-content-between">
    <p>Sweat Cargo Pants, Pink, M x 1</p>
    <p>RM 79.90</p>
</div>
                          

                            <hr class="mt-0">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Total Price</h6>
                                <h6 class="font-weight-medium">  RM 109.90</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Delivery Charges</h6>
                                <h6 class="font-weight-medium">  RM 15</h6>
                            </div>
                                                        
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">RM 124.90</h5>
                            </div>
                        </div>
                    </div>
                    <form action="checkoutReviewServlet" >
                        <div class="viewMoreSection">
                            <a href="Invoice.aspx" class="viewMoreButton">Confirm Order</a>
                        </div>
                    </form>
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
