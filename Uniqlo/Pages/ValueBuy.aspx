<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ValueBuy.aspx.cs" Inherits="Uniqlo.AdminPages.ValueBuy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/ValueBuy.css" rel="stylesheet" />
    <div class="productBody">
    <header>
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
    </header>
        <h2>Value Buy</h2>

        <div class="limitedOfferCardContainer">
    <div class="limitedOfferCard" id="product1" data-product-id="1">
        <div class="product-image-container">
            <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg"  alt="Avatar" style="width: 100%"/>
            <div class="limitedOfferContainer">
                <div class="product-name"><h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3></div>
                <div class="product-description"><p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p></div>
                <div class="product-price">
                    <p style="text-decoration: line-through; margin-right: 10px;">RM 59.90</p>
                    <p style="color: red;">RM 30.00</p>
                </div>
                <div class = "product-rating">
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star-half-alt"></i>
                    <span>4.7 (21)</span>
                </div>
            </div>
        </div>
        <div class="limitedOfferContainer">
            <div class="product-name"><h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3></div>
            <div class="product-description"><p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p></div>
            <div class="product-price">
                <p style="text-decoration: line-through; margin-right: 10px;">RM 59.90</p>
                <p style="color: red;">RM 30.00</p>
            </div>
            <div class = "product-rating">
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star-half-alt"></i>
                <span>4.7 (21)</span>
            </div>
        </div>
    </div>        
    <div class="limitedOfferCard" id="product2" data-product-id="2">
        <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%"/>
        <div class="limitedOfferContainer">
            <div class="product-name"><h3><b>Sweat Cargo Pants</b></h3></div>
            <div class="product-description"><p>Sweatpants with cargo details. Adjust the hems to create your own style.</p></div>
            <div class="product-price">
                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                <p style="color: red;">RM 79.90</p>
            </div>
            <div class = "product-rating">
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <span>5.0 (50)</span>
            </div>
        </div>
    </div>        
    <div class="limitedOfferCard">
        <img src="../../../Images/Categories/Woman/Outerwear/SoftBrushedLongSleeveShirt1.jpg" alt="Avatar" style="width: 100%"/>
        <div class="limitedOfferContainer">
            <div class="product-name"><h3><b>Soft Brushed Long Sleeve Shirt</b></h3></div>
            <div class="product-description"><p>Soft, comfortable brushed fabric. Perfect on its own or as an outer layer.</p></div>
            <div class="product-price">
                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                <p style="color: red;">RM 79.90</p>
            </div>
            <div class = "product-rating">
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fa-regular fa-star"></i>
                <span>4.0 (15)</span>
            </div>
        </div>
    </div>        
    <div class="limitedOfferCard">
        <img src="../../../Images/Categories/Woman/Outerwear/PocketableUVProtectionParka1.jpg" alt="Avatar" style="width: 100%"/>
        <div class="limitedOfferContainer">
            <div class="product-name"><h3><b>Pocketable UV Protection Parka</b></h3></div>
            <div class="product-description"><p>Lightweight, pocketable design for easy carrying. A high-performance parka for protection against sun and light rain.</p></div>
            <div class="product-price">
                <p style="text-decoration: line-through; margin-right: 10px;">RM 159.90</p>
                <p style="color: red;">RM 129.90</p>
            </div>
            <div class = "product-rating">
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star"></i>
                <i class = "fas fa-star-half-alt"></i>
                <span>4.2 (5)</span>
            </div>
        </div>
    </div>
</div>
</asp:Content>
