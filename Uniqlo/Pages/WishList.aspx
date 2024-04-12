<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="Uniqlo.Pages.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/Wishlist.css" rel="stylesheet" />
    </header>
    <div class="wishlistBody">
        <h1 class="header">My Wishlist</h1>
        <div class="wishlistContainer">
            <!-- Product 1 -->
            <div class="wishlistItemCard" id="wishlistItem1" data-product-id="1">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="AIRism Cotton Short Sleeve T-Shirt" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct1" data-product-id="1" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="red" id="heart-path" stroke="red" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="wishlistInfoContainer">
                    <div class="product-name">
                        <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                    </div>
                    <div class="product-description">
                        <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                    </div>
                    <div class="product-rating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star-half-alt star"></i>
                            <span>4.7 (21)</span>
                    </div>
                    <div class="product-details">
                        <p><b>Size:</b> M</p> 
                        <p><b>Stock Left:</b> 57</p>
                    </div>
                    <div class="product-price">
                            <p style="text-decoration: line-through; margin-right: 10px;">RM 59.90</p>
                            <p style="color: red;">RM 30.00</p>
                    </div>
                    <div class="product-actions">
                        <button class="btnMoveToCart">Add to Cart</button>
                        <button class="btnRemove">Remove</button>
                    </div>

                </div>
            </div>
            <!-- Product 2 -->
            <div class="wishlistItemCard" id="wishlistItem2" data-product-id="2">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Sweat Cargo Pants" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct2" data-product-id="2" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="red" id="heart-path" stroke="red" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="wishlistInfoContainer">
                    <div class="product-name">
                        <h3><b>Sweat Cargo Pants</b></h3>
                    </div>
                    <div class="product-description">
                        <p>Sweatpants with cargo details. Adjust the hems to create your own style.</p>
                    </div>
                    <div class="product-rating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <span>5.0 (50)</span>
                    </div>
                    <div class="product-details">
                        <p><b>Size:</b> S</p> 
                        <p><b>Stock Left:</b> 43</p>
                    </div>
                        <div class="product-price">
                            <p style="text-decoration: line-through; margin-right: 10px;">RM 120.00</p>
                            <p style="color: red;">RM 79.90</p>
                        </div>
                    <div class="product-actions">
                        <button class="btnMoveToCart">Add to Cart</button>
                        <button class="btnRemove">Remove</button>
                    </div>
                </div>
            </div>
            <!-- Product 3 -->
            <div class="wishlistItemCard" id="wishlistItem3" data-product-id="3">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Outerwear/SoftBrushedLongSleeveShirt1.jpg" alt="Soft Brushed Long Sleeve Shirt" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct3" data-product-id="3" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="red" id="heart-path" stroke="red" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="wishlistInfoContainer">
                    <div class="product-name">
                        <h3><b>Soft Brushed Long Sleeve Shirt</b></h3>
                    </div>
                    <div class="product-description">
                        <p>Soft, comfortable brushed fabric. Perfect on its own or as an outer layer.</p>
                    </div>
                    <div class="product-rating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fa-regular fa-star star"></i>
                            <span>4.0 (15)</span>
                    </div>
                    <div class="product-details">
                        <p><b>Size:</b> S</p> 
                        <p><b>Stock Left:</b> 26</p>
                    </div>
                        <div class="product-price">
                            <p>RM 79.90</p>
                        </div>
                    <div class="product-actions">
                        <button class="btnMoveToCart">Add to Cart</button>
                        <button class="btnRemove">Remove</button>
                    </div>
                </div>
            </div>
            <!-- Product 4 -->
            <div class="wishlistItemCard" id="wishlistItem4" data-product-id="4">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Outerwear/PocketableUVProtectionParka1.jpg" alt="Pocketable UV Protection Parka" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct4" data-product-id="4" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="red" id="heart-path" stroke="red" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="wishlistInfoContainer">
                    <div class="product-name">
                        <h3><b>Pocketable UV Protection Parka</b></h3>
                    </div>
                    <div class="product-description">
                        <p>Lightweight, pocketable design for easy carrying. A high-performance parka for protection against sun and light rain.</p>
                    </div>            
                        <div class="product-rating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star-half-alt star"></i>
                            <span>4.2 (5)</span>
                        </div>
                    <div class="product-details">
                        <p><b>Size:</b> M</p> 
                        <p><b>Stock Left:</b> 36</p>
                    </div>
                        <div class="product-price">
                            <p style="text-decoration: line-through; margin-right: 10px;">RM 159.90</p>
                            <p style="color: red;">RM 129.90</p>
                        </div>
                    <div class="product-actions">
                        <button class="btnMoveToCart">Add to Cart</button>
                        <button class="btnRemove">Remove</button>
                    </div>
                </div>
            </div>
            <!-- Product 5 -->
            <div class="wishlistItemCard" id="wishlistItem5" data-product-id="5">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Sweat Cargo Pants" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct5" data-product-id="2" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="red" id="heart-path" stroke="red" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="wishlistInfoContainer">
                    <div class="product-name">
                        <h3><b>Sweat Cargo Pants</b></h3>
                    </div>
                    <div class="product-description">
                        <p>Sweatpants with cargo details. Adjust the hems to create your own style.</p><br />
                    </div>
                        <div class="product-rating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star-half-alt star"></i>
                            <span>4.5 (27)</span>
                        </div>
                    <div class="product-details">
                        <p><b>Size:</b> S</p> 
                        <p><b>Stock Left:</b> 43</p>
                    </div>
                        <div class="product-price">
                            <p>RM 79.90</p>
                        </div>
                    <div class="product-actions">
                        <button class="btnMoveToCart">Add to Cart</button>
                        <button class="btnRemove">Remove</button>
                    </div>
                </div>
            </div>
            <!-- Product 6 -->
            <div class="wishlistItemCard" id="wishlistItem6" data-product-id="6">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Outerwear/SoftBrushedLongSleeveShirt3.jpg" alt="Ultra Stretch Active Jogger Pants" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct6" data-product-id="5" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="red" id="heart-path" stroke="red" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="wishlistInfoContainer">
                    <div class="product-name">
                        <h3><b>Ultra Stretch Active Jogger Pants</b></h3>
                    </div>
                    <div class="product-description">
                        <p>Ultra stretch fabric ensures freedom of movement and comfort in active scenarios.</p><br />
                    </div>
                        <div class="product-rating">
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fa-regular fa-star star"></i>
                            <span>4.1 (19)</span>
                        </div>
                    <div class="product-details">
                        <p><b>Size:</b> M</p> 
                        <p><b>Stock Left:</b> 17</p>
                    </div>
                        <div class="product-price">
                            <p style="text-decoration: line-through; margin-right: 10px;">RM 159.90</p>
                            <p style="color: red;">RM 129.90</p>
                        </div>
                    <div class="product-actions">
                        <button class="btnMoveToCart">Add to Cart</button>
                        <button class="btnRemove">Remove</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


