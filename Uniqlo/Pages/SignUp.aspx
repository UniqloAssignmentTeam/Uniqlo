<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Uniqlo.Pages.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../css/SignUp.css" rel="stylesheet" />
</head>
<body>

<div class="container">
  <h2>Create Your UNIQLO Account</h2>
  <form action="/signup" method="post">
    <div class="row">
      <div class="col">
          <asp:TextBox ID="txtName" name="name" placeholder="Full Name" runat="server"></asp:TextBox>
      </div>

      <div class="row">
          <div class="col">
              <asp:CheckBoxList ID="ChkBoxGender" runat="server"></asp:CheckBoxList>
      </div>
       </div>
    </div>
    <div class="row">
      <div class="col">
        <input type="text" name="contact_no" placeholder="Contact Number">
      </div>
    </div>
    <div class="row">
      <div class="col">
        <input type="text" name="address" placeholder="Address">
      </div>
      <div class="col">
        <input type="text" name="state" placeholder="State">
      </div>
    </div>
    <div class="row">
      <div class="col">
        <input type="text" name="city" placeholder="City">
      </div>
      <div class="col">
        <input type="text" name="postcode" placeholder="Postcode">
      </div>
    </div>
    <div class="row">
      <div class="col">
        <input type="text" name="country" placeholder="Country">
      </div>
    </div>
    <div class="row">
      <div class="col">
        <input type="email" name="email" placeholder="Email" required>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <input type="password" name="password" id="password" placeholder="Password" required>
        <input type="checkbox" onclick="showPassword()"> Show Password
      </div>
    </div>
    <div class="row">
      <div class="col">
        <button type="submit" class="btn">Sign Up</button>
      </div>
    </div>
  </form>
</div>

<div class="bottom-container">
  <a href="#" class="btn">Already have an account? Sign in</a>
</div>

<script>
function showPassword() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>

</body>


</asp:Content>
