<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Uniqlo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/home.css" rel="stylesheet" />
    </header>

    <!--SLIDER-->
    <div class="homeBody">
        <div class="slideshow-container">
            <div class="mySlides fade">
                  <div class="numbertext">1 / 4</div>
                  <a href="AboutUs.aspx"><img src="../Images/storeLocator.jpg" style="width:100%; height: 650px;"/></a>
            </div>

            <div class="mySlides fade">
                  <div class="numbertext">2 / 4</div>
                  <a href="ValueBuy.aspx"><img src="../Images/valueBuy.jpg" style="width:100%; height: 650px;"/></a>
            </div>

            <div class="mySlides fade">
                  <div class="numbertext">3 / 4</div>
                  <a href="Categories/Women/Main.aspx"><img src="../Images/uniqloWomanBigBanner.jpg" style="width:100%; height: 650px;" /></a>
            </div>            
            <div class="mySlides fade">
                  <div class="numbertext">4 / 4</div>
                  <a href="Categories/Men/Main.aspx"><img src="../Images/uniqloMenBigBanner.jpg" style="width:100%; height: 650px;" /></a>
            </div>

            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
        </div>
        <br />
        <div style="text-align:center">
           <span class="dot" onclick="currentSlide(1)"></span> 
           <span class="dot" onclick="currentSlide(2)"></span> 
           <span class="dot" onclick="currentSlide(3)"></span> 
           <span class="dot" onclick="currentSlide(4)"></span> 
        </div>

        <!--VALUE BUY Banner-->
        <div class="banner fade">
            <a href="ValueBuy.aspx"><img src="../Images/valueBuyBanner.jpg" style="width: 100%;" /></a>
        </div>

        <!-- INFORMATION CARD FOR CATEGORY-->
        <h1>Category</h1>

        <!--WOMAN SECTION-->
        <h2><a href="Categories/Women/Main.aspx" style="color: #6F6F6F; text-decoration: none;">Women</a></h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <div class="img">
                        <a href="Categories/Women/Tops.aspx" class="tooltip">
                            <img src="../Images/womenBanner.jpg" class="img" alt="img" draggable="false"/>
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
        <h2><a href="Categories/Men/Main.aspx" style="color: #6F6F6F; text-decoration: none;">Men</a></h2>
        <div class="row">
            <div class="column">
                <div class="card">
                    <div class="img">
                        <a href="Categories/Men/Tops.aspx" class="tooltip">
                            <img src="../Images/menBanner2.jpg" class="img" alt="img" draggable="false"/>
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
