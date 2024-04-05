<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Uniqlo.Pages.Categories.Women.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
    </header>
    <div class="productBody">
        <!--CATEGORY SECTION-->
        <h1 class="genderHeader">Search by Category</h1>
        <div class="wrapper">
            <i id="left" class="fa-solid fa-angle-left"></i>
            <ul class="carousel">
                <li class="card">
                    <div class="img">
                        <img src="../../../Images/uniqloWomenTop.jpg" alt="img" draggable="false"/></div>
                    <h2>Tops</h2>
                </li>
                <li class="card">
                    <div class="img">
                        <img src="../../../Images/uniqloWomenPants.jpg" alt="img" draggable="false"/></div>
                    <h2>Bottoms</h2>
                </li>
                <li class="card">
                    <div class="img">
                        <img src="../../../Images/uniqloWomanOuterwear.jpg" alt="img" draggable="false"/></div>
                    <h2>Outerwear</h2>
                </li>
                <li class="card">
                    <div class="img">
                        <img src="../../../Images/uniqloWomanDress.jpg" alt="img" draggable="false"/></div>
                    <h2>Dresses and Skirts</h2>
                </li>
            </ul>
            <i id="right" class="fa-solid fa-angle-right"></i>
        </div>

        <!--LIMITED OFFER CARD-->
        <h1 class="genderHeader">Limited Offers</h1>
        <div class="limitedOfferCardContainer">
            <div class="limitedOfferCard" id="product1" data-product-id="1">
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

        <!--VIEWMORE BUTTON-->
        <div class="viewMoreSection">
            <button class="viewMoreButton">VIEW MORE</button>
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
                            <button class="viewMoreButton">VIEW MORE</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--VIEWMOREBUTTON END-->
    </div>
    <footer>
        <script src="../../../Javascript/product.js"></script>
        <script src="../../../Javascript/modalProduct.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
    </footer>
</asp:Content>
