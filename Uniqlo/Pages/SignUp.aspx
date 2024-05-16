<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Uniqlo.Pages.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
       <!-- Signup Form -->
    <header>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="../css/SignUp.css" rel="stylesheet" />
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </header>
    <div class="mainBody" style="margin-bottom: 100px; margin-top: 40px; width: 50%;">
        <div class="form signup" >
            <div class="form-content" style="width: 70%; margin: 0 auto;">
                <header>Sign Up</header>

                <asp:Label ID="lblErrorMsg" runat="server" Text="" style="display:none;"></asp:Label>
                <!-- Full Name Field -->
                <div class="field input-field">
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" type="text" placeholder="Full Name" CssClass="input" MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorName" runat="server" ControlToValidate="txtName" ErrorMessage="Name must contain only letters." ValidationExpression="^[A-Za-z ]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Name" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <!-- Email Field -->
                <div class="field input-field">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email" CssClass="input" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address." ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <!-- Password Field -->
                <div class="field input-field">
                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    <div class="password-container">
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Create password" CssClass="input" MaxLength="50" TextMode="Password"></asp:TextBox>
                        <i id="togglePassword" class="fa fa-eye" onclick="togglePasswordVisibility()"></i>
                    </div>
                    <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be at least 8 characters long including numbers, uppercase and lowercase letters." ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <!-- Confirm Password Field -->
                <div class="field input-field">
                    <asp:Label ID="Label1" runat="server" Text="Confirm Password"></asp:Label>
                    <div class="password-container">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm password" CssClass="input" MaxLength="50" TextMode="Password"></asp:TextBox>
                        <i id="togglePassword2" class="fa fa-eye" onclick="toggleConfirmPasswordVisibility()"></i>
                    </div>
                    <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match." Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                </div>

                <!-- Phone Number Field -->
                <div class="field input-field">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" type="text" placeholder="Phone Number" CssClass="input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please enter a valid phone number." ValidationExpression="^\+?([0-9]{1,3})?([0-9]{10})$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <!-- Gender Field -->
                <div class="field input-field">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                    <br />
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display">
                        <asp:ListItem Value="">Select Gender</asp:ListItem>
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" ErrorMessage="Gender is required." Display="Dynamic" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
                </div>

                <!-- reCAPTCHA -->
                <asp:Label ID="captchaLbl" runat="server" Text="Captcha Invalid. Please Try Again." Visible="false" ForeColor="Red"></asp:Label>
                <div class="g-recaptcha" data-sitekey="6LeFetopAAAAALbDjZrPI5w7-yysmbhgyD3t3Iou"></div>

                <!-- Sign Up Button -->
                 <div class="button-container" style="margin-bottom: 50px;">
                      <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="continue-button" OnClick="btnSignUp_Click" />
                 </div>

                <!-- Redirect to Login -->
                <div class="form-link">
                    <span>Already have an account? <a href="/Pages/Login.aspx" class="link login-link">Login</a></span>
                </div>
            </div>

            <!-- Separator Line -->
        </div>
    </div>

    <footer>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
                var toggleIcon = document.getElementById('togglePassword');
                if (passwordField.type === 'password') {
                    toggleIcon.classList.remove('fa-eye');
                    toggleIcon.classList.add('fa-eye-slash');
                } else {
                    toggleIcon.classList.remove('fa-eye-slash');
                    toggleIcon.classList.add('fa-eye');
                }
            });

            function togglePasswordVisibility() {
                var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
                var toggleIcon = document.getElementById('togglePassword');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    toggleIcon.classList.remove('fa-eye-slash');
                    toggleIcon.classList.add('fa-eye');
                } else {
                    passwordField.type = 'password';
                    toggleIcon.classList.remove('fa-eye');
                    toggleIcon.classList.add('fa-eye-slash');
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                var passwordField = document.getElementById('<%= txtConfirmPassword.ClientID %>');
                var toggleIcon = document.getElementById('togglePassword2');
                if (passwordField.type === 'password') {
                    toggleIcon.classList.remove('fa-eye');
                    toggleIcon.classList.add('fa-eye-slash');
                } else {
                    toggleIcon.classList.remove('fa-eye-slash');
                    toggleIcon.classList.add('fa-eye');
                }
            });

            function toggleConfirmPasswordVisibility() {
                var passwordField = document.getElementById('<%= txtConfirmPassword.ClientID %>');
                var toggleIcon = document.getElementById('togglePassword2');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    toggleIcon.classList.remove('fa-eye-slash');
                    toggleIcon.classList.add('fa-eye');
                } else {
                    passwordField.type = 'password';
                    toggleIcon.classList.remove('fa-eye');
                    toggleIcon.classList.add('fa-eye-slash');
                }
            }
        </script>
    </footer>
   
</asp:Content>
