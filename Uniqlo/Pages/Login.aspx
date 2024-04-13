<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
 <head>
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
            <div class="form login">
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
                            <button>Login</button>
                        </div>
                    </form>
                    <div class="form-link">
                        <span>Don't have an account? <a href="#" class="link signup-link">Sign Up</a></span>
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
                    <a href="#" class="field google">
                        <img src="#" alt="" class="google-img">
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
            </div>

            <!-- Confirm Password Field -->
            <div class="field input-field">
                <input type="password" placeholder="Confirm password" class="password" required>
                <i class='bx bx-hide eye-icon'></i>
            </div>

            <!-- Gender Field using Radio Button List -->
            <div class="field input-field">
                <label for="gender">Gender:</label>
                <div id="gender" class="gender-options">
                    <input type="radio" id="male" name="gender" value="M" required>
                    <label for="male">Male</label>
                    
                    <input type="radio" id="female" name="gender" value="F" required>
                    <label for="female">Female</label>
                </div>
            </div>

            <!-- Phone Number Field -->
            <div class="field input-field">
                <input type="text" placeholder="Phone Number" class="input" required>
            </div>

            <!-- Sign Up Button -->
            <div class="field button-field">
                <button type="submit">Sign Up</button>
            </div>
        </form>

        <!-- Redirect to Login -->
        <div class="form-link">
            <span>Already have an account? <a href="login.aspx" class="link login-link">Login</a></span>
        </div>
    </div>
    
    <!-- Separator Line -->
    <div class="line"></div>
    
    <!-- Social Login Options -->
    <div class="media-options">
        <a href="#" class="field facebook">
            <i class='bx bxl-facebook facebook-icon'></i>
            <span>Login with Facebook</span>
        </a>
    </div>
    <div class="media-options">
        <a href="#" class="field google">
            <img src="#" alt="" class="google-img">
            <span>Login with Google</span>
        </a>
    </div>
</div>

        </section>
        <!-- JavaScript -->
    <script src="../Javascript/Login.js"></script>
    </body>


</asp:Content>
