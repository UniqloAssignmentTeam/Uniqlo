﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Uniqlo.Pages.Categories.Women.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
        <header>
        <link href="../../../css/category.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            .hyperlink{
                text-decoration: none;
                color: #6F6F6F;
            }
        </style>
    </header>
    <div class="categoryBody">
        <h1 class="bestSellerHeader">Women's Products</h1>
        <h2 class="bestSellerHeader" style="margin-top: -4px;">Best Seller</h2>
               
        <div class="wrapper">
            <i id="left" class="fa-solid fa-angle-left"></i>
            <asp:DataList ID="carouselDataList" runat="server" RepeatDirection="Horizontal" Width="100%">
                <HeaderTemplate>
                    <ul class="carousel">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="card" style="list-style-type: none;">
                            <div class="topSellingCard" id="product1" data-product-id="1">
                                <div class="product-image-container">
                                    <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("ProductName") %>' style="width: 100%" />
                                    <div class="wishlistSection">
                                        <div class="wishlist-heart-group">
                                            <input name="wishListProduct" id="wishListProduct1" data-product-id="1" type="checkbox" />
                                            <label for="wishListProduct" data-hover-text="Wish List">
                                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                                    <g transform="translate(0,-952.36218)">
                                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                                    </g>
                                                </svg>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="topSellingContainer">
                                    <div class="product-name"><h3><b><%# Eval("ProductName") %></b></h3></div>
                                    <div class="product-description"><p><%# Eval("Description") %></p></div>
                                    <div class="product-price">
                                        <p style="text-decoration: line-through; margin-right: 10px;"><%# Convert.ToDecimal(Eval("DiscountAmount")) > 0  ? "<p style='text-decoration: line-through; margin-right: 10px;'>" + String.Format("{0:C}", Eval("Price")) + "</p>" : "<p style='margin-right: 10px;'>" + String.Format("{0:C}", Eval("Price")) + "</p>" %></p>
                                        <p style="color: red;"><%# Convert.ToDecimal(Eval("DiscountAmount")) > 0  ? "<span style='color: red;'>" + String.Format("{0:C}", Convert.ToDecimal(Eval("Price")) - Convert.ToDecimal(Eval("DiscountAmount"))) + "</span>" : "" %></p>
                                    </div>
                                    <div class="product-rating">
                                        <%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %>
                                        <span><%# Eval("ReviewCount") %></span>
                                    </div>
                                </div>
                            </div>    
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                </ul>
            </FooterTemplate>
            </asp:DataList>
            <i id="right" class="fa-solid fa-angle-right"></i>
        </div>


        <!--PRODUCT LIST-->
        <div>
            <!--DROP DOWN LIST-->
            <div style="display: flex;">
                <div class="dropdown-bigcontainer">
                    <div class="productListHeader">Sort By</div>
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList1', 'dropdownDisplay1')">
                        <div class="dropdown-display" id="dropdownDisplay1">All</div>
                        <div class="dropdown-list" id="dropdownList1">
                            <div onclick="selectOption('Price: Low to High', 'dropdownDisplay1')">Price: Low to High</div>
                            <div onclick="selectOption('Price: High to Low', 'dropdownDisplay1')">Price: High to Low</div>
                            <div onclick="selectOption('Top Rated', 'dropdownDisplay1')">Top Rated</div>
                        </div>
                    </div>     
                </div>

                <div class="wrap-items-search-buttons" style="margin-top: 85px;">
                    <div class="search">
                        <span class="material-symbols-outlined">search</span>
                        <input class="search-input" type="search" placeholder="Search" />
                    </div>
                </div>
            </div>


            <!--PRODUCT LIST DISPLAY HERE-->
            <div class="limitedOfferCardBigContainer">
                <!--START OF COLUMN-->
                <asp:DataList ID="dataList" runat="server" RepeatDirection="Horizontal" Width="100%">
                   <ItemTemplate>
                       <asp:HyperLink ID="productLink" runat="server" NavigateUrl='<%# "/Pages/ProductDetails.aspx?ProdID=" +  Eval("ProductId") %>' CssClass="hyperlink">
                           <div class="limitedOfferCardContainer">
                               <div class="limitedOfferCard" id="product9" data-product-id="1">
                                   <div class="product-image-container">
                                       <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("ProductName") %>' style="width: 100%" />
                                       <div class="wishlistSection">
                                           <div class="wishlist-heart-group">
                                               <input name="wishListProduct" id="wishListProduct9" data-product-id="1" type="checkbox" />
                                               <label for="wishListProduct" data-hover-text="Wish List">
                                                   <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                                       <g transform="translate(0,-952.36218)">
                                                           <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                                       </g>
                                                   </svg>
                                               </label>
                                           </div>
                                       </div>
                                   </div>
                                   <div class="limitedOfferContainer">
                                       <div class="product-name">
                                           <h3><b><%# Eval("ProductName") %></b></h3>
                                       </div>
                                       <div class="product-description">
                                           <p><%# Eval("Description") %></p>
                                       </div>
                                       <div class="product-price">
                                            <%# Convert.ToDecimal(Eval("DiscountAmount")) > 0  ? "<p style='text-decoration: line-through; margin-right: 10px;'>" + String.Format("{0:C}", Eval("Price")) + "</p>" : "<p style='margin-right: 10px;'>" + String.Format("{0:C}", Eval("Price")) + "</p>" %>
                                       
                                           <p style="color: red;"> <%# Convert.ToDecimal(Eval("DiscountAmount")) > 0  ? String.Format("{0:C}", Eval("DiscountAmount")) : "" %></p>
                                       </div>
                                       <div class="product-rating">
                                           <%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %>
                                           <span><%# Eval("ReviewCount") %></span>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </asp:HyperLink>
                   </ItemTemplate>
               </asp:DataList>
            </div>
        </div>

     </div>

    





    <footer>
        <script src="../../../Javascript/wishlist.js"></script>
        <script src="../../../Javascript/product.js"></script>
        <script src="../../../Javascript/modalProductItem.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
        <script src="../../../Javascript/colorRadioList.js"></script>
    </footer>
</asp:Content>