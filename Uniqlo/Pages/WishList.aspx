<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="Uniqlo.Pages.WishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
    <link href="../css/productAdmin.css" rel="stylesheet" />
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
            <h2>Wish List</h2>
        </header>
        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <span class="material-symbols-outlined">search</span>
                    <input class="search-input" type="search" placeholder="Search" />
                </div>

                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="ddlFilter">
                    <asp:ListItem>In Stock</asp:ListItem>
                    <asp:ListItem>Low In Stock</asp:ListItem>
                    <asp:ListItem>No Stock</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="ddlFilter">
                    <asp:ListItem>Kids</asp:ListItem>
                    <asp:ListItem>Men</asp:ListItem>
                    <asp:ListItem>Women</asp:ListItem>
                </asp:DropDownList>

                <div class="move">
                    <asp:Button ID="btnExcelExport" runat="server" Text="Export" CssClass="excel-export" Font-Bold="True" ToolTip="Export To Excel" />
                    <asp:Button ID="btnAddProduct" runat="server" Text="➕ Add Product" CssClass="product-add" ToolTip="Add Product" Font-Bold="True" />
                </div>
            </div>
        </div>

        <div class="table">
            <div class="row">
                <div class="col prodImageHeader">
                </div>
                <div class="col prodHeader">
                    Product
                </div>
                <div class="col statusHeader">
                    Wishlist Status
                </div>
                <div class="col priceHeader">
                    Price (RM)
                </div>
                <div class="col categoryHeader">
                    Category
                </div>
                <div class="col actionBtnHeader">
                    Action
                </div>
            </div>

            <!-- Wishlist Item 1 -->
            <div class="row">
                <div class="col prodImage">
                    <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
                </div>
                <div class="col prod">
                    Women's Jeans - Slim Fit
                </div>
                <div class="col status">
                    In Wishlist
                </div>
                <div class="col price">
                    50.00
                </div>
                <div class="col category">
                    Women Jeans
                </div>
                <div class="col actionBtn">
                    <asp:Button ID="btnAction1" runat="server" Text="Add to Cart" />
                </div>
            </div>

            <!-- Wishlist Item 2 -->
            <div class="row">
                <div class="col prodImage">
                    <img src="../Images/uniqloKidsDresses.png" width="80" height="80" alt="Product Image" />
                </div>
                <div class="col prod">
                    Kid's Dress - Blue Floral
                </div>
                <div class="col status">
                    In Wishlist
                </div>
                <div class="col price">
                    60.00
                </div>
                <div class="col category">
                    Kid's Dress
                </div>
                <div class="col actionBtn">
                    <asp:Button ID="btnAction2" runat="server" Text="Add to Cart" />
                </div>
            </div>

            <!-- Add more wishlist items as needed -->

        </div>
    </div>
</asp:Content>

