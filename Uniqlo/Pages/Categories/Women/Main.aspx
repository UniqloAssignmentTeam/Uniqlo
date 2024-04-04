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

                  <div class = "purchase-info">
                    <input type = "number" class="qty" min = "0" value = "1">
                     <!--ANIMATION ADD TO CART BUTTON-->
                      <div class="cart-button">
                          <a href="#">
	                        <span class="add-to-cart">Add To Cart</span>
	                        <span class="added">Added</span>
                              <i class="fas fa-shopping-cart"></i>
                              <i class="fas fa-solid fa-shirt"></i>
                         </a>
                      </div>

                      <!--END OF CART BUTTON-->
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
          </div>
        </div>
    </div>
    <footer>
        <script src="../../../Javascript/product.js"></script>
        <script src="../../../Javascript/modalProduct.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
    </footer>
</asp:Content>
