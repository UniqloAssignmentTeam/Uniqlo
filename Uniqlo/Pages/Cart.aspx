<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Uniqlo.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/Cart.css" rel="stylesheet" />
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        </header>
        <h1>Shopping Cart</h1>
        
        <div class="cart-items-container">
        <!-- Cart Item 1 -->
        <div class="cart-item" id="cart1" data-cart-id="1">
            <div class="cart-item-image-container" style="width: 40%">
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" style="width: 100%" />
            </div>
            <div class="item-details">
                <div class="item-name">
                    <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                </div>
                <div class="item-price">
                    <p style="margin-right: 10px;">
                        <span style="text-decoration: line-through;">RM 59.90</span>
                        <span style="color: red; margin-left: 10px;"><b>RM 30.00</b></span>
                    </p>
                </div>
                <div class="item-size">
                    <p>Size: M</p>
                </div>
                <div class="item-quantity">
                    Quantity:
                    <button class="quantity-edit" data-action="decrease">-</button>
                    <span class="quantity">9</span>
                    <button class="quantity-edit" data-action="increase">+</button>
                </div>
                <p class="item-subtotal"><b>Subtotal: RM <%= (89.99m * 9).ToString("F2") %></b></p>
            </div>
            <div class="item-actions">
                <button class="btn-remove">Remove</button>
            </div>
        </div>
            
        <!-- Cart Item 2 -->
        <div class="cart-item" id="cart2" data-cart-id="2">
            <div class="cart-item-image-container" style="width: 40%">
                <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" style="width: 100%" />
            </div>
            <div class="item-details">
                <div class="item-name">
                    <h3><b>Sweat Cargo Pants</b></h3>
                </div>
                <div class="item-price">
                    <p style="margin-right: 10px;">
                        <span style="text-decoration: line-through;">RM 120.00</span>
                        <span style="color: red; margin-left: 10px;"><b>RM 79.90</b></span>
                    </p>
                </div>
                <div class="item-size">
                    <p>Size: M</p>
                </div>
                <div class="item-quantity">
                    Quantity:
                    <button class="quantity-edit" data-action="decrease">-</button>
                    <span class="quantity">2</span>
                    <button class="quantity-edit" data-action="increase">+</button>
                </div>
                <p class="item-subtotal"><b>Subtotal: RM <%= (79.90m * 2).ToString("F2") %></b></p>
            </div>
            <div class="item-actions">
                <button class="btn-remove">Remove</button>
            </div>
        </div>
        
        <!-- Cart Summary -->
        <div class="cart-summary">
            <h3>Cart Summary</h3>
            <p><b>Total Items: </b><span id="totalItemsLabel" class="total-items"></span></p>
            <p><b>Total Price: RM </b><span id="totalPriceLabel" class="total-price"></span></p>
            <button class="btn-checkout">Proceed to Checkout</button>
        </div>
     </div>
    </div>

    <script>
        // Calculate and display total items and total price
        var cartItems = document.querySelectorAll('.cart-item');
        var totalItems = 0;
        var totalPrice = 0;

        cartItems.forEach(function (cartItem) {
            var quantity = parseInt(cartItem.querySelector('.quantity').textContent);
            var subtotal = parseFloat(cartItem.querySelector('.item-subtotal').textContent.replace('Subtotal: RM ', ''));
            totalItems += quantity;
            totalPrice += subtotal;
        });

        document.getElementById('totalItemsLabel').textContent = totalItems;
        document.getElementById('totalPriceLabel').textContent = totalPrice.toFixed(2);
    </script>
</asp:Content>