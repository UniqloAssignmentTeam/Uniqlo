<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Outerwear.aspx.cs" Inherits="Uniqlo.Pages.Categories.Kids.Outerwear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/category.css" rel="stylesheet" />
    </header>
    <div class="categoryBody">
        <h1 class="bestSellerHeader">Best Sellers</h1>
        <div class="wrapper">
            <i id="left" class="fa-solid fa-angle-left"></i>
            <ul class="carousel">
                <li class="card">
                    <div class="topSellingCard" id="product1" data-product-id="1">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%"/>
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
                            <div class="product-name"><h3><b>Sweat Cargo Pants</b></h3></div>
                            <div class="product-description"><p>Sweatpants with cargo details. Adjust the hems to create your own style.</p></div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class = "product-rating">
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <div>5.0 (50)</div>
                            </div>
                        </div>
                    </div>    
                </li>
                <li class="card">
                    <div class="topSellingCard" id="product2" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%"/>
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct2" data-product-id="2" type="checkbox" />
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
                            <div class="product-name"><h3><b>Sweat Cargo Pants</b></h3></div>
                            <div class="product-description"><p>Sweatpants with cargo details. Adjust the hems to create your own style.</p></div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class = "product-rating">
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <div>5.0 (50)</div>
                            </div>
                        </div>
                    </div>    
                </li>
                <li class="card">
                    <div class="topSellingCard" id="product3" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%"/>
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct3" data-product-id="2" type="checkbox" />
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
                            <div class="product-name"><h3><b>Sweat Cargo Pants</b></h3></div>
                            <div class="product-description"><p>Sweatpants with cargo details. Adjust the hems to create your own style.</p></div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class = "product-rating">
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <div>5.0 (50)</div>
                            </div>
                        </div>
                    </div>    
                </li>
                <li class="card">
                    <div class="topSellingCard" id="product4" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%"/>
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct4" data-product-id="2" type="checkbox" />
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
                            <div class="product-name"><h3><b>Sweat Cargo Pants</b></h3></div>
                            <div class="product-description"><p>Sweatpants with cargo details. Adjust the hems to create your own style.</p></div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class = "product-rating">
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <div>5.0 (50)</div>
                            </div>
                        </div>
                    </div>    
                </li>
            </ul>
            <i id="right" class="fa-solid fa-angle-right"></i>
        </div>


        <!--PRODUCT LIST-->
        <div>
            <!--DROP DOWN LIST-->
            <div class="dropdown-bigcontainer">
                <div class="productListHeader">Sort By</div>
                <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                    <div class="dropdown-display" id="dropdownDisplay2">All</div>
                    <div class="dropdown-list" id="dropdownList2">
                        <div onclick="selectOption('Price: Low to High', 'dropdownDisplay2')">Price: Low to High</div>
                        <div onclick="selectOption('Price: High to Low', 'dropdownDisplay2')">Price: High to Low</div>
                        <div onclick="selectOption('Top Rated', 'dropdownDisplay2')">Top Rated</div>
                    </div>
                </div>     
            </div>

            <!--PRODUCT LIST DISPLAY HERE-->
            <div class="limitedOfferCardBigContainer">
                <!--START OF COLUMN-->
                <div class="limitedOfferCardContainer">
                    <div class="limitedOfferCard" id="product5" data-product-id="1">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct5" data-product-id="1" type="checkbox" />
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
                                <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 59.90</p>
                                <p style="color: red;">RM 30.00</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                                <span>4.7 (21)</span>
                            </div>
                        </div>
                    </div>
                    <div class="limitedOfferCard" id="product6" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct6" data-product-id="2" type="checkbox" />
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
                                <h3><b>Sweat Cargo Pants</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Sweatpants with cargo details. Adjust the hems to create your own style.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <span>5.0 (50)</span>
                            </div>
                        </div>
                    </div>
                    <div class="limitedOfferCard" id="product7" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Outerwear/SoftBrushedLongSleeveShirt1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct7" data-product-id="2" type="checkbox" />
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
                                <h3><b>Soft Brushed Long Sleeve Shirt</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Soft, comfortable brushed fabric. Perfect on its own or as an outer layer.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                                <span>4.0 (15)</span>
                            </div>
                        </div>
                    </div>
                    <div class="limitedOfferCard" id="product8" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Outerwear/PocketableUVProtectionParka1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct8" data-product-id="2" type="checkbox" />
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
                                <h3><b>Pocketable UV Protection Parka</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Lightweight, pocketable design for easy carrying. A high-performance parka for protection against sun and light rain.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 159.90</p>
                                <p style="color: red;">RM 129.90</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                                <span>4.2 (5)</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END OF COLUMN-->
                <div class="limitedOfferCardContainer">
                    <div class="limitedOfferCard" id="product9" data-product-id="1">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="Avatar" style="width: 100%" />
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
                                <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 59.90</p>
                                <p style="color: red;">RM 30.00</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                                <span>4.7 (21)</span>
                            </div>
                        </div>
                    </div>
                    <div class="limitedOfferCard" id="product10" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct10" data-product-id="2" type="checkbox" />
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
                                <h3><b>Sweat Cargo Pants</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Sweatpants with cargo details. Adjust the hems to create your own style.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <span>5.0 (50)</span>
                            </div>
                        </div>
                    </div>
                    <div class="limitedOfferCard" id="product11" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Outerwear/SoftBrushedLongSleeveShirt1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct11" data-product-id="2" type="checkbox" />
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
                                <h3><b>Soft Brushed Long Sleeve Shirt</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Soft, comfortable brushed fabric. Perfect on its own or as an outer layer.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                                <p style="color: red;">RM 79.90</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fa-regular fa-star star"></i>
                                <span>4.0 (15)</span>
                            </div>
                        </div>
                    </div>
                    <div class="limitedOfferCard" id="product12" data-product-id="2">
                        <div class="product-image-container">
                            <img src="../../../Images/Categories/Woman/Outerwear/PocketableUVProtectionParka1.jpg" alt="Avatar" style="width: 100%" />
                            <div class="wishlistSection">
                                <div class="wishlist-heart-group">
                                    <input name="wishListProduct" id="wishListProduct12" data-product-id="2" type="checkbox" />
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
                                <h3><b>Pocketable UV Protection Parka</b></h3>
                            </div>
                            <div class="product-description">
                                <p>Lightweight, pocketable design for easy carrying. A high-performance parka for protection against sun and light rain.</p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM 159.90</p>
                                <p style="color: red;">RM 129.90</p>
                            </div>
                            <div class="product-rating">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                                <span>4.2 (5)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
        </div>

        </div>



        <!-- The Modal -->
        <div id="myModal" class="modal">

          <!-- Modal content -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <div class = "card-wrapper">
              <div class = "productItemCard">
                <!-- card left -->
                <div class = "product-imgs">
                  <div class = "img-display">
                    <div class = "img-showcase">
                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
                    </div>
                  </div>
                  <div class = "img-select">
                    <div class = "img-item">
                      <a href = "#" data-id = "1">
                          <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>   
                      </a>
                    </div>
                    <div class = "img-item">
                      <a href = "#" data-id = "2">
                          <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                      </a>
                    </div>
                    <div class = "img-item">
                      <a href = "#" data-id = "3">
                          <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                      </a>
                    </div>
                    <div class = "img-item">
                      <a href = "#" data-id = "4">
                          <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
                      </a>
                    </div>
                  </div>
                </div>
                <!-- card right -->
                <div class = "product-content">
                  <h2 class = "product-title product-name" id="modalProductName"></h2>
                  <div class = "product-rating">
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star"></i>
                    <i class = "fas fa-star-half-alt"></i>
                    <span>4.7(21)</span>
                  </div>

                  <div class = "product-price">
                    <p class = "last-price">Old Price: <span>RM 59.90</span></p>
                    <p class = "new-price">New Price: <span id="modalProductPrice" class="product-price"></span></p>
                  </div>

                  <div class = "product-detail">
                    <h2>about this item: </h2>
                    <p id="modalProductDescription" class="product-description"></p>
                    <ul>
                      <li>Available: <span>In Stock</span></li>
                      <li>Category: <span>Tops</span></li>
                      <li>Shipping Area: <span>Malaysia</span></li>
                      <li>Shipping Fee: <span>Free of charge for order with total value above RM150. Additional RM20 shipping fees for order below RM150.</span></li>
                    </ul>
                  </div>

                  <div class="productQtySizeSection">
                      <div class="purchase-size">
                          <h3>Size: Women <label id="size">S</label></h3>
                          <div class="purchase-size-item">
                              <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" ValidateRequestMode="Enabled" Visible="True" CssClass="custom-radio-list">
                                  <asp:ListItem>S</asp:ListItem>
                                  <asp:ListItem>M</asp:ListItem>
                                  <asp:ListItem>L</asp:ListItem>
                                  <asp:ListItem>XL</asp:ListItem>
                              </asp:RadioButtonList>
                          </div>
                      </div>

                      <div class = "purchase-info">
                        <h3>Quantity: </h3>
                        <input type = "number" class="qty" min = "0" value = "1">
                      </div>
                  </div>
      
                  <!--ANIMATION ADD TO CART BUTTON-->
                  <div class="cart-button">
                     <a href="#">
                        <span class="add-to-cart">Add To Cart</span>
                        <span class="added">Added</span>
                        <i class="fas fa-shopping-cart"></i>
                        <i class="fas fa-solid fa-shirt"></i>
                     </a>
                  </div>

                <!--
                  <div class = "social-links">
                    <p>Share At: </p>
                    <a href = "#">
                      <i class = "fab fa-facebook-f"></i>
                    </a>
                    <a href = "#">
                      <i class = "fab fa-twitter"></i>
                    </a>
                    <a href = "#">
                      <i class = "fab fa-instagram"></i>
                    </a>
                    <a href = "#">
                      <i class = "fab fa-whatsapp"></i>
                    </a>
                    <a href = "#">
                      <i class = "fab fa-pinterest"></i>
                    </a>
                  </div>
                -->
                </div>
              </div>
            </div>
              <!--REVIEW SECTIONS-->
            <div class="reviewSection">
                <div class="reviewRatingAndBar">
                    <div class="reviewRating">
                        <h3>4.7</h3>
                        <i class="fas fa-star star"></i>
                        <i class = "fas fa-star star"></i>
                        <i class = "fas fa-star star"></i>
                        <i class = "fas fa-star star"></i>
                        <i class = "fas fa-star-half-alt star"></i>
                        <div class="reviewRatingNumUser"><i class="fa-solid fa-user"></i> 21 Total</div>
                    </div>
                    <div class="reviewBar">
                        <h3>Reviews</h3>
                        <div class="reviewBarDetails">
                            <div class="reviewBarDetailsRow">
                                <div class="reviewBarDetailsCol number">
                                    5
                                </div>                                
                                <div class="reviewBarDetailsCol progress">
                                    <div class="progressBar green"></div>
                                </div>   
                            </div>
                            <div class="reviewBarDetailsRow">
                                <div class="reviewBarDetailsCol number">
                                    4
                                </div>                                
                                <div class="reviewBarDetailsCol progress">
                                    <div class="progressBar lightGreen"></div>
                                </div>   
                            </div>
                            <div class="reviewBarDetailsRow">
                                <div class="reviewBarDetailsCol number">
                                    3
                                </div>                                
                                <div class="reviewBarDetailsCol progress">
                                    <div class="progressBar yellow"></div>
                                </div>   
                            </div>
                            <div class="reviewBarDetailsRow">
                                <div class="reviewBarDetailsCol number">
                                    2
                                </div>                                
                                <div class="reviewBarDetailsCol progress">
                                    <div class="progressBar orange"></div>
                                </div> 
                            </div>
                            <div class="reviewBarDetailsRow">
                                <div class="reviewBarDetailsCol number">
                                    1
                                </div>                                
                                <div class="reviewBarDetailsCol progress">
                                    <div class="progressBar red"></div>
                                </div>                                
                            </div>
                          </div>
                        </div>
                    </div>
                    <div class="commentSection">
                        <div class="commentSectionNewRow">
                            <h3>Korim Mia</h3>
                            <div class="commentRatingSection">
                                <div class="commentRatingSectionStars">
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star-half-alt star"></i>
                                </div>
                                <div class="commentRatingSectionDate">
                                    25th June, 2020
                                </div>
                            </div>
                            <div class="commentRatingSectionDetails">
                                Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                            </div>
                        </div>
                        <div class="commentSectionNewRow">
                            <h3>Korim Mia</h3>
                            <div class="commentRatingSection">
                                <div class="commentRatingSectionStars">
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star-half-alt star"></i>
                                </div>
                                <div class="commentRatingSectionDate">
                                    25th June, 2020
                                </div>
                            </div>
                            <div class="commentRatingSectionDetails">
                                Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                            </div>
                        </div>
                        <div class="commentSectionNewRow">
                            <h3>Korim Mia</h3>
                            <div class="commentRatingSection">
                                <div class="commentRatingSectionStars">
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star-half-alt star"></i>
                                </div>
                                <div class="commentRatingSectionDate">
                                    25th June, 2020
                                </div>
                            </div>
                            <div class="commentRatingSectionDetails">
                                Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                            </div>
                        </div>
                        <!--VIEWMORE BUTTON-->
                        <div class="viewMoreSection">
                            <a href="#" class="viewMoreReviewButton" id="openReviewBtn">VIEW MORE</a>
                        </div>
                    </div>
                </div>
            </div>


            <!--REVIEW VIEW MORE SECTION MODAL-->
            <div id="reviewModal" class="reviewModal">

              <!-- Modal content -->
              <div class="review-modal-content">
                <span class="closeReview">&times;</span>
                <div class="commentSection">
                    <h2>AIRism Cotton Short Sleeve T-Shirt</h2>
                    <div class="reviewModalSection">
                        <h2>Reviews</h2>
                        <div class="reviewModalRatingSection">
                            4.7
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class = "fas fa-star star"></i>
                            <i class = "fas fa-star star"></i>
                            <i class = "fas fa-star-half-alt star"></i>
                            (21)
                        </div>
                    </div>
                    <hr />

                    <div class="reviewSectionDropDownLists">
                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList1', 'dropdownDisplay1')">
                            <div class="dropdown-display" id="dropdownDisplay1">
                                Star 
                                <i class="fas fa-star star reviewStar"></i> 
                                (All)
                            </div>
                            <div class="dropdown-list" id="dropdownList1">
                                <div onclick="selectOption('5 Star (8)', 'dropdownDisplay1')">                        
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    (8)
                                </div>
                                <div onclick="selectOption('4 Star (5)', 'dropdownDisplay1')">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    (5)
                                </div>
                                <div onclick="selectOption('3 Star (4)', 'dropdownDisplay1')">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    (4)
                                </div>
                                <div onclick="selectOption('2 Star (3)', 'dropdownDisplay1')">
                                    <i class="fas fa-star star"></i>
                                    <i class = "fas fa-star star"></i>
                                    (3)
                                </div>
                                <div onclick="selectOption('1 Star (1)', 'dropdownDisplay1')">
                                    <i class = "fas fa-star star"></i>
                                    (1)
                                </div>
                            </div>
                        </div>

        
                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                            <div class="dropdown-display" id="dropdownDisplay2">Variation (All)</div>
                            <div class="dropdown-list" id="dropdownList2">
                                <div onclick="selectOption('Variation (S)', 'dropdownDisplay2')">S</div>
                                <div onclick="selectOption('Variation (M)', 'dropdownDisplay2')">M</div>
                                <div onclick="selectOption('Variation (L)', 'dropdownDisplay2')">L</div>
                                <div onclick="selectOption('Variation (XL)', 'dropdownDisplay2')">XL</div>
                            </div>
                        </div>                    
        
                    </div>
                    </div>

                    <div class="commentSectionNewRow" style="margin-top: 60px;">
                        <h3>Korim Mia</h3>
                        <div class="commentRatingSection">
                            <div class="commentRatingSectionStars">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                            </div>
                            <div class="commentRatingSectionDate">
                                25th June, 2020
                            </div>
                        </div>
                        <div class="commentRatingSectionDetails">
                            Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                        </div>
                    </div>
                    <div class="commentSectionNewRow">
                        <h3>Korim Mia</h3>
                        <div class="commentRatingSection">
                            <div class="commentRatingSectionStars">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                            </div>
                            <div class="commentRatingSectionDate">
                                25th June, 2020
                            </div>
                        </div>
                        <div class="commentRatingSectionDetails">
                            Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                        </div>
                    </div>
                    <div class="commentSectionNewRow">
                        <h3>Korim Mia</h3>
                        <div class="commentRatingSection">
                            <div class="commentRatingSectionStars">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                            </div>
                            <div class="commentRatingSectionDate">
                                25th June, 2020
                            </div>
                        </div>
                        <div class="commentRatingSectionDetails">
                            Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                        </div>
                    </div>                
                    <div class="commentSectionNewRow">
                        <h3>Korim Mia</h3>
                        <div class="commentRatingSection">
                            <div class="commentRatingSectionStars">
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star star"></i>
                                <i class="fas fa-star-half-alt star"></i>
                            </div>
                            <div class="commentRatingSectionDate">
                                25th June, 2020
                            </div>
                        </div>
                        <div class="commentRatingSectionDetails">
                            Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                        </div>
                    </div>
                    <h4 class="noMoreRatingFound">
                        No More Ratings Found
                    </h4>
                  </div>
                </div>
        </div>







    <footer>
        <script src="../../../Javascript/product.js"></script>
        <script src="../../../Javascript/modalProductItem.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
    </footer>
</asp:Content>
