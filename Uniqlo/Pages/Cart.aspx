<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Uniqlo.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/Cart.css" rel="stylesheet" />
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        </header>
        <h2>Shopping Cart</h2>
        
        <div class="cart-items">
            <!-- Cart Item 1 -->
            <div class="cart-item">
                <div class="item-image">
                    <img src="../Images/uniqloKidsDresses.png" alt="Product Image" />
                </div>
                <div class="item-details">
                    <h3 class="item-name">Kid's Dress - Blue Floral</h3>
                    <p class="item-price">Price: RM 89.99</p>
                    <p class="item-size">Size: M</p>
                    <div class="item-quantity">
                        Quantity: 
                        <button class="quantity-edit" data-action="decrease">-</button>
                        <span class="quantity">9</span>
                        <button class="quantity-edit" data-action="increase">+</button>
                    </div>
                    <p class="item-subtotal">Subtotal: RM <%= (89.99m * 9).ToString("F2") %></p>
                </div>
                <div class="item-actions">
                    <button class="btn-remove">Remove</button>
                </div>
            </div>
            
            <!-- Cart Item 2 -->
            <div class="cart-item">
                <div class="item-image">
                    <img src="../Images/uniqloKidsDresses.png" alt="Product Image" />
                </div>
                <div class="item-details">
                    <h3 class="item-name">Kid's Shorts - Beach Style</h3>
                    <p class="item-price">Price: RM 99.99</p>
                    <p class="item-size">Size: L</p>
                    <div class="item-quantity">
                        Quantity: 
                        <button class="quantity-edit" data-action="decrease">-</button>
                        <span class="quantity">5</span>
                        <button class="quantity-edit" data-action="increase">+</button>
                    </div>
                    <p class="item-subtotal">Subtotal: RM <%= (99.99m * 5).ToString("F2") %></p>
                </div>
                <div class="item-actions">
                    <button class="btn-remove">Remove</button>
                </div>
            </div>
        </div>
        
        <!-- Cart Summary -->
        <div class="cart-summary">
            <h3>Cart Summary</h3>
            <p>Total Items: <span id="totalItemsLabel" class="total-items" runat="server"></span></p>
            <p>Total Price: RM <span id="totalPriceLabel" class="total-price" runat="server"></span></p>
            <button class="btn-checkout">Proceed to Checkout</button>
        </div>
    </div>
</asp:Content>
