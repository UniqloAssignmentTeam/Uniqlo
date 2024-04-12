<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

<!DOCTYPE html> 
<html lang="en"> 

<head> 
	<meta charset="UTF-8"> 
	<meta name="viewport" content= 
		"width=device-width,initial-scale=1.0"> 
	<title>Social Media Login Form</title> 
    <link href="../css/Login.css" rel="stylesheet" />
	<link rel="stylesheet" href= 
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"> 
</head> 

<body> 
	<div class="login-container"> 
		<h1>GeeksforGeeks</h1> 
		<h3>Social Media Login</h3> 
		<div class="login-form"> 
			<input type="text"
				id="email"
				placeholder="Email"
				autocomplete="off" required> 
			<input type="password"
				id="password"
				placeholder="Password"
				autocomplete="off" required> 
			<button onclick="submitForm()">Login</button> 
		</div> 
		<div class="social-buttons"> 
			<button class="facebook"> 
				<i class="fab fa-facebook-f"></i> 
				Login with Facebook 
			</button> 
			<button class="twitter"> 
				<i class="fab fa-twitter"></i> 
				Login with Twitter 
			</button> 
			<button class="google"> 
				<i class="fab fa-google"></i> 
				Login with Google 
			</button> 
			<button class="instagram"> 
				<i class="fab fa-instagram"></i> 
				Login with Instagram 
			</button> 
		</div> 
	</div> 

	<script> 
        function submitForm() {
            const email =
                document.getElementById('email').value;
            const password =
                document.getElementById('password').value;

            window.alert('The form is submitted');

            document.getElementById('email').value = '';
            document.getElementById('password').value = '';
        }
    </script> 
</body> 

</html>






</asp:Content>
