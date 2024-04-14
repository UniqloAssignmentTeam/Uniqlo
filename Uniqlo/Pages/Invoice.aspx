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
                        <br /><br />
                        
                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Invoice</h4>
                            </div>
                            <div class="card-body">
                                <div class="invoice-details" >
                                    <div>
                                        <p><strong>Payment ID:</strong> 1</p>
                                        <p><strong>Date & Time:</strong> 2024-04-14 10:30:00</p>
                                        <br />
                                        <p><strong>Customer Name:</strong>Tan Choo Jun</p>
                                        <p><strong>Address:</strong>1, Jalan Lembah Permai, 11900 Tanjung Bungah, Penang, Malaysia</p>
                                        <p><strong>Email:</strong>cjtan@gmail.com</p>
                                        <p><strong>Mobile No:</strong>0148169029</p>
                                    </div>
                                </div>

                                <table class="invoice-table">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Item Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        <tr>
                                            <td>AIRism Cotton Short Sleeve T-Shirt, White, M</td>
                                            <td>1</td>
                                            <td>RM 30.00</td>
                                            <td>RM 30.00</td>
                                        </tr>
                                        <tr>
    <td>Sweat Cargo Pants, Pink, M</td>
    <td>1</td>
    <td>RM 79.90</td>
    <td>RM 79.90</td>
</tr>
                                    </tbody>
                                </table>

                                <div class="invoice-container">
                                    <div class="invoice-details pr-5 pt-3" style="display: block;">
                                        <p><strong>Total Price:</strong> RM 109.90</p>
                                        <p><strong>Delivery Charges:</strong> RM 15</p>
                                        <p><strong>Total:</strong>RM 124.90</p>
                                    </div>
                                </div>

                                <div class="invoice-footer"style="text-align: center;">
                                    <p>PDF copy of invoice has been send to cjtan@gmail.com</p>
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
