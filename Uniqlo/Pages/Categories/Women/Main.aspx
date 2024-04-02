<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Uniqlo.Pages.Categories.Women.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
    </header>
    <div class="productBody">
        <!--WOMAN SECTION-->
        <h1 class="genderHeader">Women</h1>
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
    </div>
    <footer>
        <script src="../../../Javascript/product.js"></script>
    </footer>
</asp:Content>
