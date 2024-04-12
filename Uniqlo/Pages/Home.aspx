<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Uniqlo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/home.css" rel="stylesheet" />
    </header>

    <!--SLIDER-->
    <div class="homeBody">
        <div class="slideshow-container">
            <div class="mySlides fade">
                  <div class="numbertext">1 / 3</div>
                  <img src="../Images/storeLocator.jpg" style="width:100%"/>
            </div>

            <div class="mySlides fade">
                  <div class="numbertext">2 / 3</div>
                  <img src="../Images/valueBuy.jpg" style="width:100%"/>
            </div>

            <div class="mySlides fade">
                  <div class="numbertext">3 / 3</div>
                  <img src="../Images/accessories.jpg" style="width:100%"/>
            </div>

            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
        </div>
        <br />
        <div style="text-align:center">
           <span class="dot" onclick="currentSlide(1)"></span> 
           <span class="dot" onclick="currentSlide(2)"></span> 
           <span class="dot" onclick="currentSlide(3)"></span> 
        </div>

        <!--VALUE BUY Banner-->
        <div class="banner fade">
            <img src="../Images/valueBuyBanner.jpg" style="width: 100%;" />
        </div>

        <!-- INFORMATION CARD FOR CATEGORY-->
        <h1>Category</h1>

        <!--WOMAN SECTION-->
        <h2>Women</h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <div class="img">
                        <a href="Categories/Women/Tops.aspx" class="tooltip">
                            <img src="../Images/womenTopBanner.png" class="img" alt="img" draggable="false"/>
                            <span class="tooltiptext">Click Here</span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <div class="img">
                        <a href="Categories/Women/Bottoms.aspx" class="tooltip">
                            <img src="../Images/womanBottomBanner.png" class="img" alt="img" draggable="false"/>
                            <span class="tooltiptext">Click Here</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--MEN SECTION-->
        <h2>Men</h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <div class="img">
                        <a href="Categories/Men/Tops.aspx" class="tooltip">
                            <img src="../Images/menTopBanner.png" class="img" alt="img" draggable="false"/>
                            <span class="tooltiptext">Click Here</span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <div class="img">
                        <a href="Categories/Men/Bottoms.aspx" class="tooltip">
                            <img src="../Images/menBottomBanner.jpg" class="img" alt="img" draggable="false"/>
                            <span class="tooltiptext">Click Here</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    


    <footer>
        <script src="../Javascript/slider.js"></script>
    </footer>
</asp:Content>
