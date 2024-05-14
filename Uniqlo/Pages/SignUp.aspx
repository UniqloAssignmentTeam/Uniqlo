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
         <style>
        .button-field {
    background-color: #4CAF50; /* Green background */
    border: none; /* Remove border */
    color: white; /* White text */
    padding: 15px 20px; /* Padding */
    text-align: center; /* Center text */
    text-decoration: none; /* Remove underline */
    display: inline-block; /* Make it inline-block */
    font-size: 16px; /* Font size */
    cursor: pointer; /* Add cursor pointer on hover */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s; /* Smooth transition */
}

.button-field:hover {
    background-color: #45a049; /* Darker green on hover */
}



</style>
    </header>
    <div class="mainBody">
        <div class="form signup">
            <div class="form-content">
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
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Create password" CssClass="input" MaxLength="50" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be at least 8 characters long including numbers, uppercase and lowercase letters." ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="input" Height="40px" Width="1020px" ForeColor="Gray">
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
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="button-field" />

                <!-- Redirect to Login -->
                <div class="form-link">
                    <span>Already have an account? <a href="/Pages/Login.aspx" class="link login-link">Login</a></span>
                </div>
            </div>

            <!-- Separator Line -->
            <div class="line"></div>
        </div>
    </div>
   
</asp:Content>
