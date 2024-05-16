<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Uniqlo.Pages.Categories.Women.Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
        <style>
            .hyperlink{
                text-decoration: none;
                color: #6F6F6F;
            }

        </style>


    </header>
    <div class="productBody">
        <!--CATEGORY SECTION-->
        <h1 class="genderHeader">Women</h1>

        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <a href="/Pages/Categories/Women/Products.aspx">
                    <img src="../../../Images/womenTopBanner.png" style="width: 100%; height: 400px;" />
                </a>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <a href="/Pages/Categories/Women/Products.aspx">
                    <img src="../../../Images/womensBanner.jpg" style="width: 100%; height: 400px;" />
                </a>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <a href="/Pages/Categories/Women/Products.aspx">
                    <img src="../../../Images/womenBanners.jpg" style="width: 100%; height: 400px;" />
                </a>
            </div>
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>

        </div>

        <!--LIMITED OFFER CARD-->
        <h1 class="genderHeader">Limited Offers</h1>
        <asp:DataList ID="dlValueBuy" runat="server" RepeatDirection="Horizontal" Width="100%" >
            <ItemTemplate>
                <asp:HyperLink ID="productLink" runat="server" NavigateUrl='<%# "/Pages/ProductDetails.aspx?ProdID=" + Uniqlo.EncryptionHelper.Encrypt((string) Eval("Product_Id").ToString()) %>' CssClass="hyperlink">
                    <div class="limitedOfferCardContainer">
                        <div class="limitedOfferCard" id="product9" data-product-id="1">
                            <div class="product-image-container">
                                <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("Product_Name") %>' style="width: 100%" />
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
                    </asp:HyperLink>
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
