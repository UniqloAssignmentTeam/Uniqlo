<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderItem.aspx.cs" Inherits="Uniqlo.AdminPages.OrderItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../../css/Admin/OrderItem.css" rel="stylesheet" />
    <style>
            .backButtonClass{
                margin: 20px 0px; 
                border: 2px solid white; 
                width: 50px; 
                height: 50px; 
                padding: 10px 10px 10px 15px; 
                background-color: #f0f0f0; 
                border-radius: 99%;
            }

            .backButtonClass:hover{
              background-color: #d0d0d0; 
            }

            .backLinkClass{
                color: #6F6F6F; 
                text-decoration: none;
            }

            .backButtonClass:hover > .backLinkClass {
              color: #8F8F8F; 
            }      

            .viewMoreButton{
                outline: none;
                background: none;
                border: none;
                font-weight: bold;
                z-index: 100;
            }
    </style>
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        </header>
        <div class="backButtonClass">
            <a href="/AdminPages/AdminOrder/OrderHome.aspx" class="backLinkClass"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
        </div>
        <h1>ORDER ID : <asp:Label ID="orderIDLabel" runat="server" Text=""></asp:Label></h1>
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="cart-page-container">
            <div class="cart-items-container" style="display: flex; width: 100%;">
                <div style="width: 70%;">
                    <asp:DataList ID="DataList1" runat="server">
                        <ItemTemplate>
                            <!-- Cart Item 1 -->
                            <div class="cart-item" data-product-id="1">
                                <div class="cart-item-image-container" style="width: 40%">
                                    <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("Product_Name") %>' style="width: 100%" />
                                </div>


                                <div class="item-details" style="width: 60%">


                                    <div class="item-name">


                                        <h3><b><%# Eval("Product_Name") %></b></h3>


                                    </div>
                                    <div class="item-description">
                                        <p><%# Eval("Product_Description") %></p>
                                        <br />
                                    </div>
                                    <div class="item-details">


                                        <p><b>Size:</b> <%# Eval("Size") %></p>
                                        <p><b>Color:</b>  <%# Eval("Color") %></p>
                                    </div>
                                    <p><b>Item Price:</b> <%# Eval("Item_Price", "{0:C}") %></p>
                                    <p><b>Quantity:</b> <%# Eval("Qty") %></p>
                                    <p class="item-subtotal"><b>Sub Total: <%# Eval("Subtotal", "{0:C}") %></b></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <!-- Cart Summary -->
                <div style="width: 30%;">
                    <asp:FormView ID="orderSummaryFormView" runat="server" DataKeyNames="Order_ID">

                        <HeaderTemplate>
                            <table style="width: 100%" class="table cart-summary">
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr style="width: 30%;">
                                <td>
                                    <h2>Order Summary</h2>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Date: </b>
                                    <asp:Label ID="paymentDateLbl" runat="server" Text='<%# Eval("Payment_DateTime", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Payment method: </b>
                                    <asp:Label ID="paymentMethodlbl" runat="server" Text='<%# Eval("Payment_Method", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="display: flex;">
                                    <div style="padding-top: 6px;"><b>Payment status: </b></div>
                                    <div class="dropdown-wrapper" style="margin-left: 10px;">
                                      <asp:DropDownList ID="paymentStatuslbl" runat="server" CssClass="dropdown-display" AutoPostBack="false" SelectedValue='<%# Eval("Payment_Status") %>'>
                                    <asp:ListItem Value="Paid">Paid</asp:ListItem>
                                    <asp:ListItem Value="Unpaid">Unpaid</asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Delivery status: </b>
                                    <asp:Label ID="deliveryStatuslbl" runat="server" Text='<%# Eval("Delivery_Status") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Total Price: </b>
                                    <asp:Label ID="subTotallbl" runat="server" Text='<%# Eval("Sub_Total", "{0:C}") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Total Items: </b>
                                    <asp:Label ID="totalItemlbl" runat="server" Text='<%# Eval("Total_Item") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Discount Amount : </b>
                                    RM
                                    <asp:Label ID="Label1" runat="server" Text='<%# (Convert.ToDecimal(Eval("Total_Payment")) - Convert.ToDecimal(Eval("Shipping_Amount")) - Convert.ToDecimal(Eval("Sub_Total"))).ToString("0.00") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Shipping Charges : </b>
                                    <asp:Label ID="shipAmountlbl" runat="server" Text='<%# Eval("Shipping_Amount", "{0:C}") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Total: </b>
                                    <asp:Label ID="totalPaymentlbl" runat="server" Text='<%# Eval("Total_Payment", "{0:C}") %>'></asp:Label>
                                </td>
                            </tr>
                            </ItemTemplate>
                       <FooterTemplate>
                            <tr>
                                <td>
                                    <div class="viewMoreSection">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="viewMoreButton" OnClick="submitForm" />
                                    </div>
                                </td>
                            </tr>
                            </table>
                        </FooterTemplate>
                    </asp:FormView>
                </div>
               </div> 
            </div>
        <script src="../../../Javascript/productAdminDDL.js"></script>
    </div>

</asp:Content>
