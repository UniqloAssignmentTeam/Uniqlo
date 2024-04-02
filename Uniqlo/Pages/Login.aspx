<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

<<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Login</h2>
  <form>
    <div class="form-group">
      <label for="email">Email:</label>
        <asp:TextBox id="email" type="email" class="form-control" placeholder="Enter email" runat="server"></asp:TextBox>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
       <asp:TextBox id="password" type="password" class="form-control" placeholder="Enter password" runat="server"></asp:TextBox>
    </div>
    <div class="checkbox">
      <label><input type="checkbox"> Show My Password</label>
    </div>
      <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
  </form>
</div>

</body> 



</html>


</asp:Content>
