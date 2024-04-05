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
                <img src="../../../Images/uniqloWomenTop.jpg" alt="Avatar" style="width: 100%"/>

                <div class="limitedOfferContainer">
                    <div class="product-name"><h4><b>Blue T-shirt</b></h4></div>
                    <div class="product-description"><p>Soft cotton t-shirt in blue</p></div>
                    <div class="product-price"><p>RM 30.00</p></div>
                </div>
            </div>        
            <div class="limitedOfferCard" id="product2" data-product-id="2">
                <img src="../../../Images/uniqloWomenTop.jpg" alt="Avatar" style="width: 100%"/>
                <div class="limitedOfferContainer">
                    <h4><b>John Doe</b></h4> 
                    <p>Architect & Engineer</p> 
                </div>
            </div>        
            <div class="limitedOfferCard">
                <img src="../../../Images/uniqloWomenTop.jpg" alt="Avatar" style="width: 100%"/>
                <div class="limitedOfferContainer">
                    <h4><b>John Doe</b></h4> 
                    <p>Architect & Engineer</p> 
                </div>
            </div>        
            <div class="limitedOfferCard">
                <img src="../../../Images/uniqloWomenTop.jpg" alt="Avatar" style="width: 100%"/>
                <div class="limitedOfferContainer">
                    <h4><b>John Doe</b></h4> 
                    <p>Architect & Engineer</p> 
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
                        <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
                        <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                        <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                        <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
                    </div>
                  </div>
                  <div class = "img-select">
                    <div class = "img-item">
                      <a href = "#" data-id = "1">
                          <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
                      </a>
                    </div>
                    <div class = "img-item">
                      <a href = "#" data-id = "2">
                          <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                      </a>
                    </div>
                    <div class = "img-item">
                      <a href = "#" data-id = "3">
                          <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                      </a>
                    </div>
                    <div class = "img-item">
                      <a href = "#" data-id = "4">
                          <img src="../../../Images/Categories/Woman/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
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
                          <h3>Size: Women <label id="size"></label></h3>
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
              <div class="section">
                <div class="row">
                    <div class="col s12 m12">
                        <h3 class="center-align">Reviews</h3>
                    </div>
                    <div class="col m4 s12 center-align">
                        <h3 style="margin-top: 0px;">4.7</h3>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star-half-alt"></i>
                        <p><i class="fa-solid fa-user"></i> 21 Total</p>
                    </div>
                    <div class="col m8 s12">
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="col s2 right-align">
                                <p class="flow-text" style="margin: -8px 0px 0px;">5</p>
                            </div>
                            <div class="col s10 valign-wrapper">
                                <div class="progress">
                                    <div class="determinate" style="width: 50%"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="col s2 right-align">
                                <p class="flow-text" style="margin: -8px 0px 0px;">4</p>
                            </div>
                            <div class="col s10 valign-wrapper">
                                <div class="progress">
                                    <div class="teal accent-4 determinate" style="width: 20%"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="col s2 right-align">
                                <p class="flow-text" style="margin: -8px 0px 0px;">3</p>
                            </div>
                            <div class="col s10 valign-wrapper">
                                <div class="progress">
                                    <div class=" yellow accent-3 determinate" style="width: 10%"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="col s2 right-align">
                                <p class="flow-text" style="margin: -8px 0px 0px;">2</p>
                            </div>
                            <div class="col s10 valign-wrapper">
                                <div class="progress">
                                    <div class="orange accent-2 determinate" style="width: 12%"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 0px;">
                            <div class="col s2 right-align">
                                <p class="flow-text" style="margin: -8px 0px 0px;">1</p>
                            </div>
                            <div class="col s10 valign-wrapper">
                                <div class="progress">
                                    <div class="deep-orange determinate" style="width: 8%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- One review section -->
                    <div class="col s12">
                        <h5>Korim Mia</h5>

                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star_border</i>
                        <i class="material-icons">star_border</i>
                        <i>25th June, 2020</i>
                        <p>Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto,
                            doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem
                            officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam
                            repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor
                            ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit.
                            Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                        </p>
                    </div>
                    <!-- One review section End -->
                    <!-- One review section -->
                    <div class="col s12">
                        <h5>Rohim Mia</h5>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star</i>
                        <i class="material-icons">star_border</i>
                        <i>25th June, 2020</i>
                        <p>Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto,
                            doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem
                            officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam
                            repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor
                            ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit.
                            Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.
                        </p>
                    </div>
                    <!-- One review section end -->
                    <!-- Write review section -->
                    <div class="col s12">
                        <h5>Write a review</h5>
                        <div class="row">
                            <form class="col s12 review_form" action="" method="POST">
                                <div class="row">
                                    <div class="col s12">
                                        <i class="material-icons stars" data-value="1">star_border</i>
                                        <i class="material-icons stars" data-value="2">star_border</i>
                                        <i class="material-icons stars" data-value="3">star_border</i>
                                        <i class="material-icons stars" data-value="4">star_border</i>
                                        <i class="material-icons stars" data-value="5">star_border</i>
                                        <input type="hidden" name="star" id="star">
                                        <!-- take input from this hidden field for stars -->
                                    </div>
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea"></textarea>
                                        <label for="textarea1">Your review</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <button type="submit" class="btn btn-small submit">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Write review section end -->
                </div>
            </div>
          </div>
        </div>
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
