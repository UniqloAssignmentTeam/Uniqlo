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
    </style>
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        </header>
        <div class="backButtonClass">
            <a href="/AdminPages/AdminOrder/Order.aspx" class="backLinkClass"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
        </div>
        <h1>ORDER ID : 1001</h1>
       
        <div class="cart-page-container">
            <div class="cart-items-container" style="width: 70%;">
                <!-- Cart Item 1 -->
                <div class="cart-item" id="cart1" data-product-id="1">
                    <div class="cart-item-image-container">
                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="AIRism Cotton Short Sleeve T-Shirt"/>
                    </div>
                    <div class="item-details">
                        <div class="item-name">
                            <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                        </div>
                        <div class="item-description"> 
                            <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p><br />
                        </div>
                        <div class="item-details">
                            <p><b>Size:</b> M</p>
                            <p><b>Color:</b> Red</p>
                        </div>
                            <p><b>Price:</b> RM30.00</p>
                            <p><b>Quantity:</b> 1</p>
                        <p class="item-subtotal"><b>Subtotal: RM 30.00</b></p>
                    </div>
                </div>

                <!-- Cart Item 2 -->
                <div class="cart-item" id="cart2" data-product-id="2">
                    <div class="cart-item-image-container">
                        <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Sweat Cargo Pants"/>
                    </div>
                    <div class="item-details">
                        <div class="item-name">
                            <h3><b>Sweat Cargo Pants</b></h3>
                        </div>
                        <div class="item-description">
                            <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                        </div>
                        <div class="item-details">
                            <p><b>Size:</b> M</p>
                            <p><b>Color:</b> Red</p>
                        </div>
                        <p><b>Price:</b> RM30.00</p>
                        <p><b>Quantity:</b> 1</p>
                        <p class="item-subtotal"><b>Subtotal: RM 30.00</b></p>
                    </div>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="cart-summary" style="width: 30%;">
                <h3>Order Summary</h3>
                <p><b>Date: </b>14/3/2024 </p>
                <p><b>Payment method: </b>Cash </p>
                <div style="display: flex; "><b>Payment status: </b>
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')" style="margin-left: 10px;">
                        <div class="dropdown-display" id="dropdownDisplay2">Unpaid</div>
                        <div class="dropdown-list" id="dropdownList2">
                            <div onclick="selectOption('Paid', 'dropdownDisplay2')">Paid</div>
                            <div onclick="selectOption('Unpaid', 'dropdownDisplay2')">Unpaid</div>
                        </div>
                    </div>       
                </div>
                <!-- <p><b>Total Price: </b> <span id="totalItemsLabel" class="total-items"></span> </p> -->
                <p><b>Total Price: </b>RM109.90 </p>
                <p><b>Total Items: </b>2</p>
                <p><b>Shipping Charges : </b>RM20</p>
                <p><b>Total: </b>RM129.90</p>
                <div class="viewMoreSection">
                    <a href="#" class="viewMoreButton">Submit</a>
                </div>
            </div>
        </div>

        <script>


            // Calculate and display total items and total price
            //window.addEventListener('DOMContentLoaded', (event) => {
              //  var cartItems = document.querySelectorAll('.cart-item');
                //var totalItems = 0;
                //var totalPrice = 0;

                //cartItems.forEach(function (cartItem) {
                  //  var quantity = parseInt(cartItem.querySelector('.qty').value);
                    //var subtotal = parseFloat(cartItem.querySelector('.item-subtotal').textContent.replace('Subtotal: RM ', ''));
                   // totalItems += quantity;
                    //totalPrice += subtotal;
               // });

               // document.getElementById('totalItemsLabel').textContent = totalItems;
                //document.getElementById('totalPriceLabel').textContent = totalPrice.toFixed(2);
            //});

        </script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
    </div>

</asp:Content>
