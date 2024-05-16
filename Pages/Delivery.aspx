<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="Uniqlo.Pages.Delivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/delivery.css" rel="stylesheet" />
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style1.css" rel="stylesheet" />
    </header>

    <div class="body">
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
                <form class="d-flex">
                    <div class="col-lg-8">
                        <div class="mb-4">
                            <br />
                            <br />

                            <h4 class="font-weight-semi-bold mb-4">Delivery Address<i class="fas fa-map-marker-alt" onclick="openGoogleMaps()" data-bs-toggle="tooltip" title="Click to auto-detect your current location"></i></h4>
                            <div class="row">

                                <div class="col-md-6 form-group">
                                    <label>Name</label>

                                    <asp:TextBox class="form-control" ID="txtName" value="Tan Choo Jun" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>E-mail</label>
                                    <asp:TextBox class="form-control" ID="txtEmail" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Contact No</label>
                                    <asp:TextBox class="form-control" ID="txtContact" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Country</label>
                                    <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" placeholder="Malaysia"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtCountry" ErrorMessage="Country is required" Display="Dynamic" ForeColor="Red" runat="server" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Address Line</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="123 Street" required="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtAddress" ErrorMessage="Address is required" Display="Dynamic" ForeColor="Red" runat="server" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Post Code</label>
                                    <asp:TextBox ID="txtPostcode" runat="server" CssClass="form-control" MaxLength="5" placeholder="11500"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revPostcode" runat="server" ControlToValidate="txtPostcode" ValidationExpression="^\d{5}$" ErrorMessage="Post code must be 5 digits" ForeColor="Red" Display="Dynamic" />
    <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" ControlToValidate="txtPostcode" ErrorMessage="Post code is required" ForeColor="Red" Display="Dynamic" />

                                </div>
                                <div class="col-md-6 form-group">
                                    <label>State</label>
                                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" required="true" placeholder="Penang"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtState" ErrorMessage="State is required" Display="Dynamic" ForeColor="Red" runat="server" />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>City</label>
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" required="true" placeholder="George Town"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtCity" ErrorMessage="City is required" Display="Dynamic" ForeColor="Red" runat="server" />
                                </div>


                                <div class="col-md-12 form-group">
                                    <label>
                                        <br />
                                        Delivery Instruction (If Any)</label>
                                    <asp:TextBox ID="txtDelivery_Note" class="form-control" placeholder="Left it at the door" runat="server"></asp:TextBox>
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

                        <!--VIEWMORE BUTTON-->
                        <div class="viewMoreSection">
    <asp:LinkButton ID="btnProceedToPayment" runat="server" CssClass="viewMoreButton" Text="Next" OnClick="btnProceedToPayment_Click" />
</div>

                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>
