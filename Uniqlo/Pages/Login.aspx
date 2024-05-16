<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniqlo.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


    <header>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS -->
        <link href="../css/Login.css" rel="stylesheet" />

        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    </header>
    <section class="container forms">
        <div class="form login">
            <div class="form-content">
                <header>Login</header>


                <asp:Label ID="errorMSG" runat="server" Text=""></asp:Label>
                <div class="field input-field">
                    <asp:TextBox ID="txtEmail" type="email" placeholder="Email" CssClass="input" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="field input-field">
                    <div class="password-container">
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="input password" MaxLength="50" TextMode="Password" style="height: 50px;"></asp:TextBox>
                        <i id="togglePassword" class="fa fa-eye" onclick="togglePasswordVisibility()"></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-link">
                    <a href="ForgotPassword.aspx" class="forgot-pass">Forgot password?</a>
                </div>
                <div class="field button-field">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="LoginValidation" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="LoginValidation" DisplayMode="BulletList" ForeColor="Red" />
                <input type="hidden" id="recaptchaResponse" name="recaptchaResponse" runat="server" />
                <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>



                <div class="form-link">
                    <span>Don't have an account?</span>
                    <asp:HyperLink ID="signUpLink" runat="server" NavigateUrl="SignUp.aspx">Sign Up</asp:HyperLink>
                </div>
            </div>
        </div>





    </section>
    <!-- JavaScript -->
    
    <footer>
        <script src="../Javascript/Login.js"></script>
        <script>
            function togglePasswordVisibility() {
                var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
                            var toggleIcon = document.getElementById('togglePassword');
                            if (passwordField.type === 'password') {
                                passwordField.type = 'text';
                                toggleIcon.classList.remove('fa-eye');
                                toggleIcon.classList.add('fa-eye-slash');
                            } else {
                                passwordField.type = 'password';
                                toggleIcon.classList.remove('fa-eye-slash');
                                toggleIcon.classList.add('fa-eye');
                            }
            }
        </script>
    </footer>







</asp:Content>
