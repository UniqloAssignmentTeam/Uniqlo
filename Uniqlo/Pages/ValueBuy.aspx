<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ValueBuy.aspx.cs" Inherits="Uniqlo.Pages.ValueBuy" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <header>

        <link href="../css/ValueBuy.css" rel="stylesheet" />
    </header>

    <asp:ScriptManager ID="ScriptManagerStaff" runat="server" />
  <asp:UpdatePanel ID="UpdatePanelStaff" runat="server">
  <ContentTemplate>



    <div class="productBody">
        <!--LIMITED OFFER CARD-->
        <h1 class="header">Value Buy</h1>

        <!--VALUE BUY Banner-->
        <div class="banner">
            <img src="../Images/uniqloValueBuyBanner.jpg" style="width: 100%;" />
        </div>


        <!--DROP DOWN LIST-->
        <div class="dropdown-bigcontainer" style="margin-bottom: 10px;">
            <div class="productListHeader">Sort By</div>
            <div style="display: flex;">

                <div class="dropdown-container" style="margin-right: 15px;">
                      <asp:DropDownList ID="genderSortDDL" runat="server"  CssClass="dropdown-display">
                          <asp:ListItem>Gender</asp:ListItem>
                          <asp:ListItem Value="M">Men</asp:ListItem>
                          <asp:ListItem Value="F">Women</asp:ListItem>
                      </asp:DropDownList>
                </div>
             


                <div class="dropdown-container">
                    <asp:DropDownList ID="categorySortDDL" runat="server" CssClass="dropdown-display">
                        <asp:ListItem>Category</asp:ListItem>
                        <asp:ListItem>Tops</asp:ListItem>
                        <asp:ListItem>Bottom</asp:ListItem>
                    </asp:DropDownList>
                </div>

                  


                <div style="display: flex; width: 100%; justify-content: flex-end;">
                    <div class="dropdown-container">
                        <asp:DropDownList ID="sortByDDL" runat="server" CssClass="dropdown-display">
                            <asp:ListItem>Sort By</asp:ListItem>
                            <asp:ListItem>Most Popular</asp:ListItem>
                            <asp:ListItem>High to Low</asp:ListItem>
                             <asp:ListItem>Low to High</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

            </div>
        </div>



        <!--LIMITED OFFER START-->

















        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="4" Width="100%">
            <ItemTemplate>



                <div class="limitedOfferCardContainer">
                    <div class="limitedOfferCard" id="product9" data-product-id="1">
                        <div class="product-image-container">
                            <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("Product_Name") %>' style="width: 100%" />
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
                                <h3><b><%# Eval("Product_Name") %></b></h3>
                            </div>
                            <div class="product-description">
                                <p><%# Eval("Description") %></p>
                            </div>
                            <div class="product-price">
                                <p style="text-decoration: line-through; margin-right: 10px;">RM <%# Eval("Price", "{0:C}") %></p>
                                <p style="color: red;">RM <%# Eval("Discount_Amount", "{0:C}") %></p>
                            </div>
                            <div class="product-rating">
                                <%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %>
                                <span><%# Eval("ReviewCount") %></span>
                            </div>

                        </div>
                    </div>
                   
                </div>
















            </ItemTemplate>
        </asp:DataList>



                     </ContentTemplate>
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="categorySortDDL" EventName="SelectedIndexChanged" />
    <asp:AsyncPostBackTrigger ControlID="genderSortDDL" EventName="SelectedIndexChanged" />
    <asp:AsyncPostBackTrigger ControlID="sortByDDL" EventName="SelectedIndexChanged" />
    
</Triggers>


    </asp:UpdatePanel>





























        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="card-wrapper">
                    <div class="productItemCard">
                        <!-- card left -->
                        <div class="product-imgs">
                            <div class="img-display">
                                <div class="img-showcase">
                                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="uniqlo image" />
                                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt="uniqlo image" />
                                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt="uniqlo image" />
                                    <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt="uniqlo image" />
                                </div>
                            </div>
                            <div class="img-select">
                                <div class="img-item">
                                    <a href="#" data-id="1">
                                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="uniqlo image" />
                                    </a>
                                </div>
                                <div class="img-item">
                                    <a href="#" data-id="2">
                                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt="uniqlo image" />
                                    </a>
                                </div>
                                <div class="img-item">
                                    <a href="#" data-id="3">
                                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt="uniqlo image" />
                                    </a>
                                </div>
                                <div class="img-item">
                                    <a href="#" data-id="4">
                                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt="uniqlo image" />
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- card right -->
                        <div class="product-content">
                            <h2 class="product-title product-name" id="modalProductName"></h2>
                            <div class="product-rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <span>4.7(21)</span>
                            </div>

                            <div class="product-price">
                                <p class="last-price">Price: <span>RM 59.90</span></p>
                                <p class="new-price"><span id="modalProductPrice" class="product-price"></span></p>
                            </div>

                            <div class="product-detail">
                                <h2>about this item: </h2>
                                <p id="modalProductDescription" class="product-description"></p>
                                <ul>
                                    <li>Stock: <span>100</span></li>
                                    <li>Category: <span>Top</span></li>
                                    <li>Shipping Area: <span>Malaysia</span></li>
                                    <li>Shipping Fee: <span>Free of charge for order with total value above RM150. Additional RM20 shipping fees for order below RM150.</span></li>
                                </ul>
                            </div>

                            <div class="productColorSection">
                                <div class="purchase-color">
                                    <h3>Color:
                                <label id="color">White</label></h3>
                                    <div class="purchase-color-item">
                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" ValidateRequestMode="Enabled" Visible="True" CssClass="color-radio-list">
                                            <asp:ListItem Value="#"></asp:ListItem>
                                            <asp:ListItem Value="#"></asp:ListItem>
                                            <asp:ListItem Value="#"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>

                            <div class="productQtySizeSection">
                                <div class="purchase-size">
                                    <h3>Size: Women
                                        <label id="size">S</label></h3>
                                    <div class="purchase-size-item">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" ValidateRequestMode="Enabled" Visible="True" CssClass="custom-radio-list">
                                            <asp:ListItem>S</asp:ListItem>
                                            <asp:ListItem>M</asp:ListItem>
                                            <asp:ListItem>L</asp:ListItem>
                                            <asp:ListItem>XL</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>

                                <div class="purchase-info">
                                    <h3>Quantity: </h3>
                                    <input type="number" class="qty" min="0" value="1">
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


                            <div class="social-links">
                                <p>Share At: </p>
                                <a href="#">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-instagram"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-whatsapp"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-pinterest"></i>
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
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star-half-alt star"></i>
                            <div class="reviewRatingNumUser"><i class="fa-solid fa-user"></i>21 Total</div>
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
                        <!--VIEWMORE BUTTON-->
                        <div class="viewMoreSection">
                            <a href="#" class="viewMoreReviewButton" id="openReviewBtn">VIEW MORE</a>
                        </div>
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
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star star"></i>
                            <i class="fas fa-star-half-alt star"></i>
                            (21)
                        </div>
                    </div>
                    <hr />

                    <div class="reviewSectionDropDownLists">
                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList4', 'dropdownDisplay4')">
                            <div class="dropdown-display" id="dropdownDisplay4">
                                Star 
                            <i class="fas fa-star star reviewStar"></i>
                                (All)
                            </div>
                            <div class="dropdown-list" id="dropdownList4">
                                <div onclick="selectOption('5 Star (8)', 'dropdownDisplay4')">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    (8)
                                </div>
                                <div onclick="selectOption('4 Star (5)', 'dropdownDisplay4')">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    (5)
                                </div>
                                <div onclick="selectOption('3 Star (4)', 'dropdownDisplay4')">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    (4)
                                </div>
                                <div onclick="selectOption('2 Star (3)', 'dropdownDisplay4')">
                                    <i class="fas fa-star star"></i>
                                    <i class="fas fa-star star"></i>
                                    (3)
                                </div>
                                <div onclick="selectOption('1 Star (1)', 'dropdownDisplay4')">
                                    <i class="fas fa-star star"></i>
                                    (1)
                                </div>
                            </div>
                        </div>


                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList5', 'dropdownDisplay5')">
                            <div class="dropdown-display" id="dropdownDisplay5">Variation (All)</div>
                            <div class="dropdown-list" id="dropdownList5">
                                <div onclick="selectOption('Variation (S)', 'dropdownDisplay5')">S</div>
                                <div onclick="selectOption('Variation (M)', 'dropdownDisplay5')">M</div>
                                <div onclick="selectOption('Variation (L)', 'dropdownDisplay5')">L</div>
                                <div onclick="selectOption('Variation (XL)', 'dropdownDisplay5')">XL</div>
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
                <h4 class="noMoreRatingFound">No More Ratings Found
                </h4>
            </div>
        </div>
   
    <footer>
        <script src="../Javascript/valueBuy.js"></script>
        <script src="../Javascript/wishlist.js"></script>
        <script src="../Javascript/productItem.js"></script>
        <script src="../Javascript/modalProduct.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
        <script src="../../../Javascript/colorRadioList.js"></script>
    </footer>
</asp:Content>
