<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Uniqlo.Pages.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
     <!-- Signup Form -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

                    <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>

<!-- Full Name Field -->
<div class="field input-field">
    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" type="text" placeholder="Full Name" CssClass="input"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
</div>

<!-- Email Field -->
<div class="field input-field">
    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="Email" CssClass="input"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</div>

<!-- Password Field -->
<div class="field input-field">
    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" placeholder="Create password" CssClass="input"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red"></asp:RequiredFieldValidator>
</div>

<!-- Phone Number Field -->
<div class="field input-field">
    <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
    <asp:TextBox ID="txtPhone" runat="server" type="text" placeholder="Phone Number" CssClass="input"></asp:TextBox>
    <!-- Add any additional validation as needed -->
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
    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" ErrorMessage="Gender is required." ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
</div>

<!-- Country Field -->
<div class="field input-field">
    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="input" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" Height="40px" Width="1020px" ForeColor="Gray">
        <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Country is required." ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
</div>

<!-- State Field -->
<div class="field input-field">
    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlState" runat="server" CssClass="input" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"  Height="40px" Width="1020px" ForeColor="Gray">
        <asp:ListItem Text="Select State" Value=""></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState" ErrorMessage="State is required." ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>
</div>

<!-- City Field -->
<div class="field input-field">
    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
    <br />
    <asp:TextBox ID="txtCity" runat="server" type="text" placeholder="City" CssClass="input"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required." ForeColor="Red"></asp:RequiredFieldValidator>
</div>

<!-- Postcode Field -->
<div class="field input-field">
    <asp:Label ID="lblPostcode" runat="server" Text="Postcode"></asp:Label>
    <asp:TextBox ID="txtPostcode" runat="server" type="text" placeholder="Postcode" CssClass="input"></asp:TextBox>
    <!-- Add any additional validation as needed -->
</div>

<!-- Address Field -->
<div class="field input-field">
    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
    <asp:TextBox ID="txtAddress" runat="server" type="text" placeholder="Address" CssClass="input"></asp:TextBox>
    <!-- Add any additional validation as needed -->
</div>

<!-- Profile Photo Field -->
<!--<div class="field input-field">
    <asp:Label ID="lblProfilePhoto" runat="server" Text="Profile Photo"></asp:Label>
    <asp:FileUpload ID="fileProfilePhoto" runat="server" /></div>  -->
    <!-- Add any additional validation as needed -->
 
         


                 
                    <!-- Sign Up Button -->
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="button-field" />

                    <!-- Message for image -->
                    
                    <!--
                        <asp:Label ID="lblUploadMess" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="lblReg" runat="server" Text="Label"></asp:Label>-->
        
                
                
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
