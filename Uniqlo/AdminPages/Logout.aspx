<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Uniqlo.AdminPages.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link href="../css/logout.css" rel="stylesheet" />
    <div class="mainBody">
        <div class="containerLogout">
            <img src="../Images/Uniqlo-Logos.png" />
            <p>You have successfully logged out!</p>
            <p> You will be redirected to <a href="adminLogin.aspx">Login</a></p>
        </div>
    </div>
</asp:Content>
