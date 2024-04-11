<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Tops.aspx.cs" Inherits="Uniqlo.Pages.Categories.Women.Tops" %>
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
                                <span>5.0 (50)</span>
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
                                <span>5.0 (50)</span>
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
                                <span>5.0 (50)</span>
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
                                <span>5.0 (50)</span>
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
                                <i class="fa-regular fa-star star"></i>
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
            </div>



        </div>



    </div>
    





    <footer>
        <script src="../../../Javascript/product.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
    </footer>
</asp:Content>
