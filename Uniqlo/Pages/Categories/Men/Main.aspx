<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Uniqlo.Pages.Categories.Men.Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
    </header>
    <div class="productBody">
        <!--CATEGORY SECTION-->
        <h1 class="genderHeader">Men</h1>
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 2</div>
                <a href="Tops.aspx">
                    <img src ="../../../Images/menTopBanner.png" style="width: 100%; height: 400px;" />
                </a>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 2</div>
                <a href="Bottoms.aspx">
                    <img src="../../../Images/menBottomBanner.jpg" style="width: 100%; height: 400px;" />
                </a>
            </div>

            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>

        </div>

        <!--LIMITED OFFER CARD-->
        <h1 class="genderHeader">Limited Offers</h1>
        <asp:DataList ID="dlValueBuy" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="4" Width="100%">
        <ItemTemplate>


               <div class="limitedOfferCardContainer">
       <div class="limitedOfferCard" id="product1" data-product-id="1">
           <div class="product-image-container">
               <img src='<%# Eval("ImagePath") %>' alt="Product Image" style="width: 100%" />
               <div class="wishlistSection">
                   <div class="wishlist-heart-group">
                       <input name="wishListProduct" id="wishListProduct" data-product-id="1" type="checkbox" />
                       <label for="wishListProduct" data-hover-text="Wish List">
                           <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                               <g transform="translate(0,-952.36218)">
                                   <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path1" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
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
                 <p style="text-decoration: line-through; margin-right: 10px;">RM <%# Eval("Price") %></p>
                   <p style="color: red;"> RM <%# Eval("DiscountPrice") %></p>
               </div>
              <div class="ratings">
     <%# GenerateStars(Convert.ToDouble(Eval("AverageRating"))) %>
     <span>(<%# Eval("ReviewCount") %> reviews)</span>
 </div>
           </div>
       </div>
       </div>












</ItemTemplate>
            </asp:DataList>


        

        <div class="limitedOfferCardContainer">
            <div class="limitedOfferCard" id="product1" data-product-id="1">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="Avatar" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct" data-product-id="1" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path1" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
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
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>4.7 (21)</span>
                    </div>
                </div>
            </div>
            <div class="limitedOfferCard" id="product2" data-product-id="2">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Avatar" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct2" data-product-id="2" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path2" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
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
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <span>5.0 (50)</span>
                    </div>
                </div>
            </div>
            <div class="limitedOfferCard" id="product3" data-product-id="2">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Outerwear/SoftBrushedLongSleeveShirt1.jpg" alt="Avatar" style="width: 100%" />
                    <div class="wishlistSection">
                        <div class="wishlist-heart-group">
                            <input name="wishListProduct" id="wishListProduct3" data-product-id="2" type="checkbox" />
                            <label for="wishListProduct" data-hover-text="Wish List">
                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                    <g transform="translate(0,-952.36218)">
                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path3" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
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
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <span>4.0 (15)</span>
                    </div>
                </div>
            </div>
            <div class="limitedOfferCard" id="product4" data-product-id="2">
                <div class="product-image-container">
                    <img src="../../../Images/Categories/Woman/Outerwear/PocketableUVProtectionParka1.jpg" alt="Avatar" style="width: 100%" />
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
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>4.2 (5)</span>
                    </div>
                </div>
            </div>
        </div>

        <!--VIEWMORE BUTTON-->
        <div class="viewMoreSection">
            <a href="../../ValueBuy.aspx" class="viewMoreButton">VIEW MORE</a>
        </div>


    </div>
    <footer>
        <script src="../../../Javascript/category.js"></script>
        <script src="../../../Javascript/slider.js"></script>
        <script src="../../../Javascript/modalProduct.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
        <script src="../../../Javascript/wishList.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
        <script src="../../../Javascript/colorRadioList.js"></script>
    </footer>
</asp:Content>
