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
         <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </head>
    <div class="mainBody">

        <div class="form signup">
            <div class="form-content">
                <header>Sign Up</header>

                    <!-- Full Name Field -->
                    <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
                    <div class="field input-field">
                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txtName" type="text" placeholder="Full Name" class="input" runat="server" required></asp:TextBox>
                    </div>
                    <!-- Email Field -->
                    <div class="field input-field">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email" class="input" required></asp:TextBox>
                    </div>
                    <!-- Create Password Field -->
                    <div class="field input-field">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Create password" class="input"></asp:TextBox>
                    </div>
                    <!-- Phone Number Field -->
                    <div class="field input-field">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" type="text" placeholder="Phone Number" class="input"></asp:TextBox>
                    </div>
                    <!-- Gender -->
                    <div class="field input-field">
                        <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                        <br />
                        <asp:DropDownList ID="ddlGender" runat="server" placeholder="Gender" CssClass="input" Height="50px" Width="396px">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <!-- Address -->
                    <div class="field input-field">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" type="text" placeholder="Address" class="input"></asp:TextBox>
                    </div>
                    <!-- City -->
                    <div class="field input-field">
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                        <asp:TextBox ID="txtCity" runat="server" type="text" placeholder="City" class="input"></asp:TextBox>
                    </div>
                    <!-- State -->
                    <div class="field input-field">
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        <asp:TextBox ID="txtState" runat="server" type="text" placeholder="State" class="input"></asp:TextBox>
                    </div>
                    <!-- Postcode -->
                    <div class="field input-field">
                        <asp:Label ID="lblPostcode" runat="server" Text="Postcode"></asp:Label>
                         <asp:TextBox ID="txtPostcode" runat="server" type="text" placeholder="Postcode" class="input"></asp:TextBox>
                    </div>
                    <!-- Country -->
                    <div class="field input-field">
                        <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                        <asp:TextBox ID="txtCountry" runat="server" type="text" placeholder="Country" class="input"></asp:TextBox>
                    </div>
                    <!-- Profile Photo -->
                    <div class="field input-field">
                        <asp:Label ID="lblProfilePhoto" runat="server" Text="Profile Photo"></asp:Label>
                        <asp:FileUpload ID="fileProfilePhoto" runat="server" />
                    </div>
                 <div class="g-recaptcha" data-sitekey="6Lc38NgpAAAAANFR2iSW9Bm0ir6yRA-RqVdC0cVv"></div>
                    <!-- Sign Up Button -->
                    <div class="field button-field">
                        
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                    </div>
                
                
                <!-- Redirect to Login -->
                <div class="form-link">
                    <span>Already have an account? <a href="/Pages/Login.aspx" class="link login-link">Login</a></span>
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
    </div>
</asp:Content>
