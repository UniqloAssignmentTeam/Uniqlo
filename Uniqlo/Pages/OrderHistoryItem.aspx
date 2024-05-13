<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="OrderHistoryItem.aspx.cs" Inherits="Uniqlo.Pages.OrderHistoryItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="../css/Admin/OrderItem.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        <style>
            .backButtonClass {
                margin: 20px 0px;
                border: 2px solid white;
                width: 50px;
                height: 50px;
                padding: 10px 10px 10px 15px;
                background-color: #f0f0f0;
                border-radius: 99%;
            }

                .backButtonClass:hover {
                    background-color: #d0d0d0;
                }

            .backLinkClass {
                color: #6F6F6F;
                text-decoration: none;
            }

            .backButtonClass:hover > .backLinkClass {
                color: #8F8F8F;
            }

            /*Button in table*/
            .orderReceivedSection {
                margin: auto;
                margin-top: 20px;
                width: 300px;
                height: 50px;
                padding: 10px 0px 0px 130px;
                border: 2px solid black;
                transition: all 0.5s ease;
                font-weight: bold;
                cursor: pointer;
                margin-bottom: 20px;
            }

                .orderReceivedSection:hover {
                    background-color: black;
                }

                    .orderReceivedSection:hover > .orderReceivedButton {
                        color: white;
                    }

            .orderReceivedButton {
                text-decoration: none;
                color: black;
                background: none;
                outline: none;
                border: none;
                font-weight: bold;
                font-size: 14px;
            }

            /*MODAL*/
            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 180px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 50%;
            }

            /* The Close Button */
            .close, .secClose, .thirdClose {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                background: none;
                outline: none;
                border: none;
            }

                .close:hover,
                .close:focus {
                    color: #000;
                    text-decoration: none;
                    cursor: pointer;
                }

                .secClose:hover,
                .secClose:focus {
                    color: #000;
                    text-decoration: none;
                    cursor: pointer;
                }

                .thirdClose:hover,
                .thirdClose:focus {
                    color: #000;
                    text-decoration: none;
                    cursor: pointer;
                }

                .thirdModalButton{
                    z-index: 10;
                }

            .modal-rating-content {
                margin-top: 60px;
                font-size: 20px;
                margin-bottom: 10px;
                margin-left: 60px;
            }

            .commentRatingSectionStars {
                margin-top: 16px;
                margin-left: 100px;
                font-size: 25px;
            }

            .commentRatingSectionComment {
                margin-top: 30px;
            }

                .commentRatingSectionComment textarea {
                    margin-top: -10px;
                    width: 600px;
                    height: 110px;
                    font-size: 18px;
                    resize: none;
                }

            .commentRatingSectionContainer {
                border: 2px solid black;
                width: 91%;
                margin-left: 0;
                margin-top: 30px;
                margin-bottom: 30px;
                height: 50px;
                transition: all 0.5s ease;
                padding-top: 5px;
            }

            .commentRatingSectionButton {
                text-decoration: none;
                color: black;
                padding: 50px 300px 50px 275px;
                font-weight: bold;
                font-size: 15px;
            }

            .commentRatingSectionContainer:hover {
                background-color: black;
            }

                .commentRatingSectionContainer:hover > .commentRatingSectionButton {
                    color: white;
                }

            .star {
                color: #ffc107;
            }

            /*SECOND MODAL BUTTON*/

            .secModalBtnBorder1,
            .secModalBtnBorder2 {
                transition: all 0.5s ease;
                cursor: pointer;
            }

            .secModalBtn1,
            .secModalBtn2 {
                text-decoration: none;
                color: black;
                width: 100%;
                background: none;
                outline: none;
                border: none;
                padding: 10px 150px 0px 175px;
                cursor: pointer;
            }

            .secModalBtnBorder1:hover,
            .secModalBtnBorder2:hover {
                background-color: black;
            }

                .secModalBtnBorder1:hover > .secModalBtn1 {
                    color: white;
                }

                .secModalBtnBorder2:hover > .secModalBtn2 {
                    color: white;
                }

            /*CONFIRMATION MODAL*/
            .confirmationClearFix {
                width: 100%;
                margin-top: 90px;
            }

            /* Add a color to the cancel button */
            .confirmationCancelbtn, .confirmationDeletebtn {
                border: 2px solid black;
                padding: 20px 150px 20px 150px;
                background: none;
                outline: none;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease;
                width: 100%;
                text-decoration: none;
                color: black;
                width: calc((100% / 2) - 20px);
            }

                .confirmationDeletebtn:hover,
                .confirmationCancelbtn:hover {
                    background-color: black;
                    color: white;
                }


            /* Add padding and center-align text to the container */
            .confirmationContainer {
                padding: 16px;
                text-align: center;
            }

            /* The Modal (background) */
            .confirmationModal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 2; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 50px;
                margin-top: 55px;
            }

            /* Modal Content/Box */
            .confirmation-modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 50%; /* Could be more or less, depending on screen size */
                height: 440px;
            }


                .confirmation-modal-content h1 {
                    margin-top: 60px;
                }

                .confirmation-modal-content p {
                    margin-top: 30px;
                }

            /* The Modal Close Button (x) */
            .confirmationClose {
                float: right;
                font-size: 40px;
                font-weight: bold;
                color: #f1f1f1;
            }

                .confirmationClose:hover,
                .confirmationClose:focus {
                    color: black;
                    cursor: pointer;
                }

            /* Clear floats */
            .confirmationClearFix::after {
                content: "";
                clear: both;
                display: table;
            }

            .fa-star.checked {
                color: orange;
            }
            /* Change styles for cancel button and delete button on extra small screens */
            @media screen and (max-width: 300px) {
                .confirmationCancelbtn, .confirmationDeletebtn {
                    width: 100%;
                }
            }
        </style>
    </header>
    <div class="productBody">

        <div class="backButtonClass">
            <a href="Profile.aspx" class="backLinkClass"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
        </div>

        <h1>ORDER ID :<asp:Label ID="orderIDLabel" runat="server" Text=""></asp:Label></h1>








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

                                    <asp:HiddenField ID="hiddennOrderListID" runat="server" Value='<%# Eval("OrderList_ID") %>' />

                                    <div class="orderReceivedSection" id="<%# Eval("reviewBtn") %>">

                                        <asp:Button ID="reviewValidBtn" runat="server"
                                        Text='<%# Convert.ToBoolean(Eval("reviewBtn")) ? "View" : "Review" %>' CommandArgument='<%# Eval("OrderList_ID") %>' 
                                        CssClass="orderReceivedButton" AutoPostBack="false" UseSubmitBehavior="false" />


                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <!-- Cart Summary -->
                <div style="width: 30%;">
                    <asp:Repeater ID="orderSummaryRepeater" runat="server" ViewStateMode="Disabled">

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
                                <td>
                                    <b>Payment status: </b>
                                    <asp:Label ID="paymentStatuslbl" runat="server" Text='<%# Eval("Payment_Status") %>'></asp:Label>
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
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
               </div> 
            </div>









            </div>
                <asp:HiddenField ID="HiddenOrderListID" runat="server" ClientIDMode="Static"/>
            <script>
                function validateAndSubmit() {
                    var orderListID = document.getElementById('HiddenOrderListID').value;
                    if (orderListID === '') {
                        alert('Order List ID is not set. Please try again.');
                        return false;
                    }
                    return true;  // Proceed with submission
                }


                function assignOrderListID(orderListID) {
                    document.getElementById('HiddenOrderListID').value = orderListID;
                }









            </script>
</asp:Content>