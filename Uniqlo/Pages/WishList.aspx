<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="Uniqlo.Pages.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/Wishlist.css" rel="stylesheet" />
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        </header>
        <h1>Wishlist</h1>
        
        <div class="wishlist-items-container">
        <!-- Wishlist Item 1 -->
        <div class="wishlist-item" id="wishlist1" data-product-id="1">
            <div class="wishlist-item-image-container" style="width: 100%">
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" style="width: 100%" />
            </div>
            <div class="item-details">
                <div class="item-name"><h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3></div>
                <div class="item-description"><p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p></div>
                <div class="item-price"><p style="margin-right: 10px;"><b>RM 59.90</b></p></div>
                <div class="item-size"><p>Size: M</p></div>
                <div class="item-actions"><button class="btn-add-to-cart">Add to Cart</button></div>
            </div>
        </div>
            
        <!-- Wishlist Item 2 -->
        <div class="wishlist-item" id="wishlist2" data-product-id="2">
            <div class="wishlist-item-image-container" style="width: 100%">
                <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" style="width: 100%" />
            </div>
            <div class="item-details">
                <div class="item-name"><h3><b>Sweat Cargo Pants</b></h3></div>
                <div class="item-description"><p>Sweatpants with cargo details. Adjust the hems to create your own style.</p></div>
                <div class="item-price">
                    <p style="margin-right: 10px;">
                        <span style="text-decoration: line-through;">RM 120.00</span>
                        <span style="color: red; margin-left: 10px;"><b>RM 79.90</b></span>
                    </p>
                </div>
                <div class="item-size"><p>Size: M</p></div>
                <div class="item-actions"><button class="btn-add-to-cart">Add to Cart</button></div>
            </div>
        </div>
     </div>
    </div>
</asp:Content>
