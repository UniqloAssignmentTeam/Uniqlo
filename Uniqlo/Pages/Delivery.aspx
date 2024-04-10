<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="Uniqlo.Pages.Delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <head>
        <link href="../css/delivery.css" rel="stylesheet" />
    </head>
        <div class="container-fluid pt-5">
        <section class="step-wizard">
            <ul class="step-wizard-list">
                <li class="step-wizard-item current-item">
                    <span class="progress-count">1</span>
                    <span class="progress-label">Customer Information</span>
                </li>
                <li class="step-wizard-item">
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
            <form action="checkoutServlet" method="doGet" class="d-flex">
                <div class="col-lg-8">
                    <div class="mb-4">
                        <br /><br />

                        <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
                        <div class="row">

                            <div class="col-md-6 form-group">
                                <label>Name</label>
                                <input class="form-control" type="text" value=""  readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>E-mail</label>
                                <input class="form-control" type="text" value="" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Mobile No</label>
                                <input class="form-control" type="text"  value="" readonly="readonly">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Country</label>
                                <input class="form-control" name="country" type="text" value="Malaysia" required>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address Line</label>
                                <input class="form-control" name="address" type="text" placeholder="123 Street" required>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Post Code</label>
                                <input class="form-control" name="postcode" type="text" placeholder="11500" pattern="[0-9]{5}" oninput="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="5" required>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>State</label>
                                <input class="form-control" name="state" type="text" placeholder="George Town" required>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>City</label>
                                <input class="form-control" name="city" type="text" placeholder="Penang" required>
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
                                <p>add order items</p>
                                <p>RM Get total price</p>
                            </div>

                          

                            <hr class="mt-0">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Total Price</h6>
                                <h6 class="font-weight-medium">  RM Cart total Price</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping Charges</h6>
                                <h6 class="font-weight-medium">  RM Shipping fee</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">SST Tax (6%)</h6>
                                <h6 class="font-weight-medium">  RM SSt amount</h6>
                            </div>

                            
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Discount (10%)</h6>
                                <h6 class="font-weight-medium">- RM Discount amount</h6>
                            </div>
                            
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">RM Grand total</h5>
                            </div>
                        </div>
                    </div>

                    <div class="card-footer border-secondary bg-transparent">
                        <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Next</button>
                    </div>

                </div>
            </form>          
        </div>
    </div>

</asp:Content>
