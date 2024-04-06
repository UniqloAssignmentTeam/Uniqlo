<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ValueBuy.aspx.cs" Inherits="Uniqlo.AdminPages.ValueBuy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/ValueBuy.css" rel="stylesheet" />
    <div class="productBody">
    <header>
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
    </header>
        <h2>Value Buy</h2>

        <div class="wrap-items-search" style="display: flex;">
            <div class="search">
                <input class="search-input" type="search" placeholder="Search" />
            </div>
            <div class="filter">
                <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="ddlFilter">
                    <asp:ListItem Text="All Categories" Value="" />
                    <asp:ListItem>Kids</asp:ListItem>
                    <asp:ListItem>Men</asp:ListItem>
                    <asp:ListItem>Women</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filter" style="margin-left: 10px;">
                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="ddlFilter">
                    <asp:ListItem>In Stock</asp:ListItem>
                    <asp:ListItem>Low In Stock</asp:ListItem>
                    <asp:ListItem>No Stock</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <!--Header-->
        <div class="row">
            <div class="col productHeader">
                Product
            </div>
            <div class="col priceHeader">
                Price (RM)
            </div>
            <div class="col availabilityHeader">
                Availability
            </div>
            <div class="col genderHeader">
                Gender
            </div>
            <div class="col categoryHeader">
                Category
            </div>
            <div class="col actionBtnHeader">
                Action
            </div>
        </div>

        <!-- Product Items-->
        <!-- Product 1 -->
        <div class="row">
            <div class="prodImage">
                <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
            </div>
            <div class="col product">
                Kid's Dress - Blue Floral
            </div>
            <div class="col price">
                <span class="strike">Original: 50.00</span><br>
                Price After Discount: 40.00
            </div>
            <div class="col availability">
                In Stock
            </div>
            <div class="col gender">
                Kids
            </div>
            <div class="col category">
                Dresses
            </div>
            <div class="col actionBtn">
                <asp:Button ID="btnAction1" runat="server" Text="Add to Cart" />
            </div>
        </div>
        <hr />
        <!-- Product 2 -->
        <div class="row">
            <div class="prodImage">
                <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
            </div>
            <div class="col product">
                Men's Casual Shirt - Checked
            </div>
            <div class="col price">
                <span class="strike">Original: 100.00</span><br>
                Price After Discount: 85.00
            </div>
            <div class="col availability">
                In Stock
            </div>
            <div class="col gender">
                Men
            </div>
            <div class="col category">
                Shirts
            </div>
            <div class="col actionBtn">
                <asp:Button ID="btnAction2" runat="server" Text="Add to Cart" />
            </div>
        </div>
        <hr />
        <!-- Product 3 -->
        <div class="row">
            <div class="prodImage">
                <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
            </div>
            <div class="col product">
                Women's Jeans - Slim Fit
            </div>
            <div class="col price">
                <span class="strike">Original: 80.00</span><br>
                Price After Discount: 60.00
            </div>
            <div class="col availability">
                In Stock
            </div>
            <div class="col gender">
                Women
            </div>
            <div class="col category">
                Jeans
            </div>
            <div class="col actionBtn">
                <asp:Button ID="btnAction3" runat="server" Text="Add to Cart" />
            </div>
        </div>
        <hr />
        <!-- Product 4 -->
        <div class="row">
            <div class="prodImage">
                <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
            </div>
            <div class="col product">
                Kid's Shorts - Beach Style
            </div>
            <div class="col price">
                <span class="strike">Original: 60.00</span><br>
                Price After Discount: 54.00
            </div>
            <div class="col availability">
                In Stock
            </div>
            <div class="col gender">
                Kids
            </div>
            <div class="col category">
                Shorts
            </div>
            <div class="col actionBtn">
                <asp:Button ID="btnAction4" runat="server" Text="Add to Cart" />
            </div>
        </div>
        <hr />
        <!-- Product 5 -->
        <div class="row">
            <div class="prodImage">
                <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
            </div>
            <div class="col product">
                Women's Elegant Dress - Black
            </div>
            <div class="col price">
                <span class="strike">Original: 150.00</span><br>
                Price After Discount: 105.00
            </div>
            <div class="col availability">
                In Stock
            </div>
            <div class="col gender">
                Women
            </div>
            <div class="col category">
                Dresses
            </div>
            <div class="col actionBtn">
                <asp:Button ID="btnAction5" runat="server" Text="Add to Cart" />
            </div>
        </div>
        <hr />
    </div>
</asp:Content>
