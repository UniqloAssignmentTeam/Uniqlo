<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Uniqlo.Pages.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link href="../css/logout.css" rel="stylesheet" />
    <div class="mainBody">
        <div class="containerLogout">
            <img src="../Images/Uniqlo-Logos.png" />
            <p>You have successfully logged out!</p>
            <p> You will be redirected to <a href="Login.aspx">Login</a></p>
        </div>
    </div>
    
</asp:Content>
