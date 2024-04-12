<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/Login.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>
    <div class="mainBody">
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
    <div class="checkboxPassword">
      <label><input type="checkbox"> Show My Password</label>
    </div>
      <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
      <p><a href="SignUp.aspx">Sign Up Here</a> if you haven't register an account</p>
  </form>
</div>
</div>
</body> 



</asp:Content>
