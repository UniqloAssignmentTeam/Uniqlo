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
            <div class="cart-item" id="cart1" data-product-id="1">
                <div class="cart-item-image-container">
                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="AIRism Cotton Short Sleeve T-Shirt"/>
                </div>
                <div class="item-details">
                    <div class="item-name">
                        <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                    </div>
                    <div class="item-description">
                        <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                    </div>
                    <div class="item-details">
                        <p><b>Size:</b> M</p> 
                        <p><b>Stock Left:</b> 57</p>
                    </div>
                    <div class="item-price">
                        <p style="text-decoration: line-through; margin-right: 10px;">RM 59.90</p>
                        <p style="color: red;">RM 30.00</p>
                    </div>
                    <p>Quantity: </p>
                    <input type="number" class="qty" min="0" value="1">
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
                        <p><b>Stock Left:</b> 27</p>
                    </div>
                    <div class="item-price">
                        <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                        <p style="color: red;">RM 79.90</p>
                    </div>
                    <p>Quantity: </p>
                    <input type="number" class="qty" min="0" value="1">
                    <p class="item-subtotal"><b>Subtotal: RM 79.90</b></p>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="cart-summary">
                <h3>Cart Summary</h3>
                <p><b>Total Items: </b><span id="totalItemsLabel" class="total-items"></span></p>
                <p><b>Total Price: RM </b><span id="totalPriceLabel" class="total-price"></span></p>
                <div class="buttons-container">
                    <button class="btn-checkout">Proceed to Checkout</button>
                    <button class="btn-continue-shopping">Continue Shopping</button>
                </div>
            </div>
        </div>

        <script>
            // Calculate and display total items and total price
            window.addEventListener('DOMContentLoaded', (event) => {
                var cartItems = document.querySelectorAll('.cart-item');
                var totalItems = 0;
                var totalPrice = 0;

                cartItems.forEach(function (cartItem) {
                    var quantity = parseInt(cartItem.querySelector('.qty').value);
                    var subtotal = parseFloat(cartItem.querySelector('.item-subtotal').textContent.replace('Subtotal: RM ', ''));
                    totalItems += quantity;
                    totalPrice += subtotal;
                });

                document.getElementById('totalItemsLabel').textContent = totalItems;
                document.getElementById('totalPriceLabel').textContent = totalPrice.toFixed(2);
            });
        </script>
    </div>
</asp:Content>