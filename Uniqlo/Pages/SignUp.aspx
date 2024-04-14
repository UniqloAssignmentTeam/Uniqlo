<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Uniqlo.Pages.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<!-- Signup Form -->
    <head>
       <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <!-- CSS -->
        <link href="../css/SignUp.css" rel="stylesheet" />
               
       <!-- Boxicons CSS -->
       <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
                       
   </head>
<div class="form signup">
    <div class="form-content">
        <header>Sign Up</header>
        <form action="#">
            <!-- Full Name Field -->
            <div class="field input-field">
                <input type="text" placeholder="Full Name" class="input" required>
            </div>

            <!-- Email Field -->
            <div class="field input-field">
                <input type="email" placeholder="Email" class="input" required>
            </div>

            <!-- Create Password Field -->
            <div class="field input-field">
                <input type="password" placeholder="Create password" class="password" required>
                <i class='bx bx-hide eye-icon'></i>
            </div>

            <!-- Confirm Password Field -->
            <div class="field input-field">
                <input type="password" placeholder="Confirm password" class="password" required>
                <i class='bx bx-hide eye-icon'></i>
            </div>

               <!-- Phone Number Field -->
             <div class="field input-field">
                <input type="text" placeholder="Phone Number" class="input" required>
  
             </div>
            <br />
            <div class="Gender:">
            <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem> <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
            </div>
         

            <!-- Sign Up Button -->
            <div class="field button-field">
                <button type="submit" onclick="alert('Registration Successfully')">Sign Up</button>
            </div>
        </form>

        <!-- Redirect to Login -->
        <div class="form-link">
            <span>Already have an account? <a href="Login.aspx" class="link login-link">Login</a></span>
        </div>
    </div>
    
    <!-- Separator Line -->
    <div class="line"></div>
    
    <!-- Social Login Options -->
    <div class="media-options">
        <a href="facebook.com" class="field facebook">
            <i class='bx bxl-facebook facebook-icon'></i>
            <span>Login with Facebook</span>
        </a>
    </div>
    <div class="media-options">
        <a href="google.com" class="field google">
             <i class="fa-brands fa-google"></i>  
            <span>Login with Google</span>
        </a>
    </div>
    </div>
</asp:Content>