<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Uniqlo.Pages.Categories.Women.Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
    </header>
    <div class="productBody">
        <!--CATEGORY SECTION-->
        <h1 class="genderHeader">Women</h1>

        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 2</div>
                <a href="Tops.aspx">
                    <img src="../../../Images/womenTopBanner.png" style="width: 100%; height: 400px;" />
                </a>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 2</div>
                <a href="Bottoms.aspx">
                    <img src="../../../Images/womanBottomBanner.png" style="width: 100%; height: 400px;" />
                </a>
            </div>

            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>

        </div>

        <!--LIMITED OFFER CARD-->
        <h1 class="genderHeader">Limited Offers</h1>
        <asp:DataList ID="dlValueBuy" runat="server" RepeatDirection="Horizontal" Width="100%">
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
                                <p style="text-decoration: line-through; margin-right: 10px;"> <%# Eval("Price", "{0:C}") %></p>
                                <p style="color: red;"> <%# Eval("Discount_Amount", "{0:C}") %></p>
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

        <!--VIEWMORE BUTTON-->
        <div class="viewMoreSection">
            <a href="../../ValueBuy.aspx" class="viewMoreButton">VIEW MORE</a>
        </div>
    </div>

    <footer>
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
