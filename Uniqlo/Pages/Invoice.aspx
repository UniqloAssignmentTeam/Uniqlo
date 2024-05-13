<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Uniqlo.Pages.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <style>
            .invoice-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

                .invoice-header img {
                    max-width: 150px;
                    height: auto;
                }

            .invoice-details {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                margin-bottom: 20px;
            }

                .invoice-details p {
                    margin: 5px;
                }

            .invoice-table {
                border-collapse: collapse;
                width: 100%;
            }

                .invoice-table th,
                .invoice-table td {
                    border: 1px solid #ddd;
                    padding: 10px;
                    text-align: center;
                }

            .invoice-total {
                display: flex;
                justify-content: flex-end;
                margin-top: 20px;
            }

                .invoice-total p {
                    margin: 5px;
                }

            .invoice-footer {
                margin-top: 40px;
                font-size: 14px;
            }

                .invoice-footer p {
                    margin: 5px;
                }
        </style>
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style1.css" rel="stylesheet" />
        <link href="../css/delivery.css" rel="stylesheet" />
    </header>

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
                <li class="step-wizard-item">
                    <span class="progress-count">3</span>
                    <span class="progress-label">Confirmation</span>
                </li>
                <li class="step-wizard-item current-item">
                    <span class="progress-count">4</span>
                    <span class="progress-label">Invoice</span>
                </li>
            </ul>
        </section>
        <div class="row px-xl-5">
            <div class="col-lg-12">
                <div class="mb-4">
                    <br />
                    <br />

                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Invoice</h4>
                        </div>
                        <div class="card-body">
                            <div class="invoice-details">
                                <div>
                                    <p>
                                        <strong>Payment ID:</strong>
                                        <asp:Label ID="lblPaymentId" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Payment Date & Time:</strong>
                                        <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Payment Method:</strong>
                                        <asp:Label ID="lblPaymentType" runat="server"></asp:Label>
                                    </p>
                                    <br />
                                    <p>
                                        <strong>Customer Name:</strong>
                                        <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Address:</strong>
                                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Email:</strong>
                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                    </p>
                                    <p>
                                        <strong>Contact No:</strong>
                                        <asp:Label ID="lblContactNo" runat="server"></asp:Label>
                                    </p>
                                </div>
                            </div>

                            <table class="invoice-table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Price (RM)</th>
                                        <th>Item Price (RM)</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <asp:Repeater ID="rptCartItems" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") + ", " + Eval("Color") + ", " + Eval("Size") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price", "{0:F2}") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblItemPrice" runat="server" Text='<%# Eval("Item_Price", "{0:F2}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                            <div class="invoice-container">
                                <div class="invoice-details pr-5 pt-3" style="display: block;">
                                    <p><strong>Total Price:</strong>
                                        <asp:Label ID="lblTotalPrice" runat="server"></asp:Label></p>
                                    <p><strong>Delivery Charges:</strong>
                                        <asp:Label ID="lblDeliveryCharges" runat="server"></asp:Label></p>
                                    <p><strong>Total:</strong>
                                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label></p>
                                </div>
                            </div>

                            <div class="invoice-footer" style="text-align: center;">
                                <p>PDF copy of invoice has been send to <asp:Label ID="lblEmail2" runat="server"></asp:Label></p>
                                <asp:Button ID="btnPDF" runat="server" Text="Download PDF" OnClick="btnPDF_Click" />
                                <p>Thank you for your purchase. To check on the status of your order, please visit <a href="profile.jsp">Here</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Checkout End -->
</asp:Content>
