<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
 <head>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-k6RqeWeci5ZR/Lv4MR0sA0FfDOMo5qVmj7PeIv6m4H+7elXyCfN6n10fRFBgCnp9auHX8zFH2KsXoD6/ZT8p0A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Responsive Login and Signup Form </title>
        <!-- CSS -->
     <link href="../css/Login.css" rel="stylesheet" />
                
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
                        
    </head>
        <section class="container forms">
            <div class="form login" style="left: 0px; top: 0px">
                <div class="form-content">
                    <header>Login</header>
                    <form action="#">
                        <div class="field input-field">
                            <input type="email" placeholder="Email" class="input">
                        </div>
                        <div class="field input-field">
                            <input type="password" placeholder="Password" class="password">
                            <i class='bx bx-hide eye-icon'></i>
                        </div>
                        <div class="form-link">
                            <a href="ForgotPassword.aspx" class="forgot-pass">Forgot password?</a>
                        </div>
                        <div class="field button-field">
                           <button href="Pages/Home.aspx">Login</button>
                            
                        </div>
                    </form>
                    <div class="form-link">
                        <span>Don't have an account? <a href="SignUp.aspx" class="link signup-link">Sign Up</a></span>
                    </div>
                </div>
                <div class="line"></div>
                <div class="media-options">
                    <a href="#" class="field facebook">
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

<!-- Signup Form -->
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
                <input type="text" placeholder="Contact Number" class="input" required>
 
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
                <button type="submit" onclick="alert('Registration Successfully')">Sign Uputton>
 
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

        </section>
        <!-- JavaScript -->
    <script src="../Javascript/Login.js"></script>



</asp:Content>
