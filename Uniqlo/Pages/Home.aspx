<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Uniqlo.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/home.css" rel="stylesheet" />
    </header>

    <!--SLIDER-->
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
                    <img src="../Images/uniqloWomenTop.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Tops</h3>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloWomenPants.jpg" class="img" alt="img" draggable="false"/>
                </div>
                <h3>Bottoms</h3>
            </div>
        </div>
  
        <div class="column">
            <div class="card">
                 <div class="img">
                     <img src="../Images/uniqloWomanOuterwear.jpg" class="img" alt="img" draggable="false"/>
                </div>
                <h3>Outerwear</h3>
            </div>
        </div>
  
        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloWomanDress.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Dresses and Skirts</h3>
            </div>
        </div>
    </div>

    <!--MEN SECTION-->
    <h2>Men</h2>
    <div class="row">
        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloMenTop.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Tops</h3>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloMenPants.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Bottoms</h3>
            </div>
        </div>
  
        <div class="column">
            <div class="card">
                 <div class="img">
                     <img src="../Images/uniqloMenOuterwear.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Outerwear</h3>
            </div>
        </div>
  
        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloMenAccessories.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Accessories</h3>
            </div>
        </div>
    </div>

    <!--KID SECTION-->
    <h2>Kids</h2>
    <div class="row">
        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloKidsTop.jpg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Tops</h3>
            </div>
        </div>

        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloKidsPants.png" class="img" alt="img" draggable="false" />
                </div>
                <h3>Bottoms</h3>
            </div>
        </div>
  
        <div class="column">
            <div class="card">
                 <div class="img">
                     <img src="../Images/uniqloKidsOuterwear.jpeg" class="img" alt="img" draggable="false" />
                </div>
                <h3>Outerwear</h3>
            </div>
        </div>
  
        <div class="column">
            <div class="card">
                <div class="img">
                    <img src="../Images/uniqloKidsDresses.png" class="img" alt="img" draggable="false" />
                </div>
                <h3>Dresses and Skirts</h3>
            </div>
        </div>
    </div>


    <footer>
        <script src="../Javascript/slider.js"></script>
    </footer>
</asp:Content>
