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
            <div class="limitedOfferCard" id="myBtn">
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

        <!--MODAL BOX-->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <!--MODAL CONTENT-->
                <div class="container">
                    <div class="grid product">
                      <div class="column-xs-12 column-md-7">
                        <div class="product-gallery">
                          <div class="product-image">
                            <img class="active" src="https://source.unsplash.com/W1yjvf5idqA">
                          </div>
                          <ul class="image-list">
                            <li class="image-item"><img src="https://source.unsplash.com/W1yjvf5idqA"></li>
                            <li class="image-item"><img src="https://source.unsplash.com/VgbUxvW3gS4"></li>
                            <li class="image-item"><img src="https://source.unsplash.com/5WbYFH0kf_8"></li>
                          </ul>
                        </div>
                      </div>
                      <div class="column-xs-12 column-md-5">
                        <h1>Bonsai</h1>
                        <h2>$19.99</h2>
                        <div class="description">
                          <p>The purposes of bonsai are primarily contemplation for the viewer, and the pleasant exercise of effort and ingenuity for the grower.</p>
                          <p>By contrast with other plant cultivation practices, bonsai is not intended for production of food or for medicine. Instead, bonsai practice focuses on long-term cultivation and shaping of one or more small trees growing in a container.</p>
                        </div>
                        <button class="add-to-cart">Add To Cart</button>
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
    </footer>
</asp:Content>
