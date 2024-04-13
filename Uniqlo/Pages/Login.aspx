<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<head> 
	<meta charset="UTF-8"> 
	<meta name="viewport" content= 
		"width=device-width,initial-scale=1.0"> 
	<title>Social Media Login Form</title> 
    <link href="../css/Login.css" rel="stylesheet" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
</head> 


    <div class="mainBody">
	<div class="login-container"> 
		<h1><img src="../Images/Uniqlo-Logos.png" /></h1> 
		<h3>Login</h3> 
		<div class="login-form"> 
			<input type="text"
				id="email"
				placeholder="Email"
				autocomplete="off" required> 
			<input type="password"
				id="password"
				placeholder="Password"
				autocomplete="off" required> 
			<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="main_btnlogin" />
		</div> 
		<div class="social-buttons"> 
			<button class="facebook"> 
				<i class="fab fa-facebook-f"></i>&nbsp
				Login with Facebook</button> 
			<button class="google"> 
				<i class="fab fa-google"></i> &nbsp
				Login with Google 
			</button> 
		</div> 
        <p>Do not have an account?Click
			<a href="SignUp.aspx">here</a> to register</p>
	</div> 
		</div>

</asp:Content>
