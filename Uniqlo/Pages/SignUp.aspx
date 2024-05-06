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
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="txtName" type="text" placeholder="Full Name" class="input"  runat="server" required OnTextChanged="txtName_TextChanged" ValidateRequestMode="Enabled"></asp:TextBox>
            </div>

            <!-- Email Field -->
            <div class="field input-field">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email" class="input" required></asp:TextBox>
            </div>

            <!-- Create Password Field -->
            <div class="field input-field">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Create password" class="password"></asp:TextBox>
            </div>

               <!-- Phone Number Field -->
             <div class="field input-field">
                 <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                 <asp:TextBox ID="txtPhone" runat="server" type="text" placeholder="Phone Number" class="input" OnTextChanged="txtPhone_TextChanged"></asp:TextBox>
             </div>

            <!-- Gender -->
            <div class="field input-field">
                <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                <asp:DropDownList ID="ddlGender" runat="server" placeholder="Gender" CssClass="field input-field" Height="35px" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged" Width="410px">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                </asp:DropDownList>
            </div>

            <br />
         

            <!-- Sign Up Button -->
            <div class="field button-field">
            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" type="submit" OnClick="btnSignUp_Click"/>
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
            <span>Sign Up with Facebook</span>
        </a>
    </div>
    <div class="media-options">
        <a href="google.com" class="field google">
             <i class="fa-brands fa-google"></i>  
            <span>Sign Up with Google</span>
        </a>
    </div>
    </div>
</asp:Content>