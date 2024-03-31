<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <h2>Product</h2>


    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Repeater ID="Repeater1" runat="server"></asp:Repeater>
    <asp:DropDownList ID="categoryID" runat="server"></asp:DropDownList>
     <asp:DropDownList ID="clothSize" runat="server"></asp:DropDownList>
    <asp:CheckBox ID="maleFilter" runat="server" />
    <asp:CheckBox ID="femaleFilter" runat="server" />

</asp:Content>
