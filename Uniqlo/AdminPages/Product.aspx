<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


    <link href="../css/productAdmin.css" rel="stylesheet" />
    <div class="productBody">




    <h2>Product</h2>

    <div class="search-container">
          <asp:TextBox ID="SearchBox" runat="server" CssClass="search-input" placeholder="Search" MaxLength="30"></asp:TextBox>
    </div>
   



    <asp:Repeater ID="Repeater1" runat="server"></asp:Repeater>
    <asp:DropDownList ID="categoryID" runat="server"></asp:DropDownList>
     <asp:DropDownList ID="clothSize" runat="server"></asp:DropDownList>
    <asp:CheckBox ID="maleFilter" runat="server" />
    <asp:CheckBox ID="femaleFilter" runat="server" />





</div>
</asp:Content>
