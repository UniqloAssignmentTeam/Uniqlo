﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/productAdmin.css" rel="stylesheet" />
    <div class="productBody">
       
 <h2>Product</h2>
 <div class="wrap-items-search-buttons">

  
   
     <div class="search">
        <span class="material-symbols-outlined">search</span>
         <input class="search-input" type="search" placeholder="Search" />
     </div>
       
            
            
     <div class="side-search">

     <div class="category-group">
        <asp:DropDownList ID="ddlCategory" runat="server">
        <asp:ListItem>Men</asp:ListItem>
        <asp:ListItem>Women</asp:ListItem>
        </asp:DropDownList>
    </div>



     <div class="size-group">
         <asp:DropDownList ID="ddlSize" runat="server">
         <asp:ListItem>L</asp:ListItem>
         <asp:ListItem>M</asp:ListItem>
         <asp:ListItem>S</asp:ListItem>
         </asp:DropDownList>
    </div>
</div>


        <div class="export-add">

            <div class="export-excel">
         <asp:Button ID="btnExport" runat="server" Text="Button" />
            </div>

            <div class="product-add">
         <asp:Button ID="btnAddProduct" runat="server" Text="Button" />
             </div>
         </div>



</div>


</div>
      
</asp:Content>