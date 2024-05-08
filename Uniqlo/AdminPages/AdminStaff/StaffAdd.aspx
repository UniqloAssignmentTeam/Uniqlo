﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StaffAdd.aspx.cs" Inherits="Uniqlo.AdminPages.AdminStaff.StaffAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
                <header>
                    <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />
                <link href="../../css/Admin/addStaff.css" rel="stylesheet" />
        </header>
       
    
 
 
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO ADD STAFF</h2>
        </div>
        <div class="modal-content">
            

            <div class="product-content">
               
                <div class="form-group">
                    <label for="staffName">Staff Name</label>
                     <asp:TextBox ID="staffName" runat="server"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegexValidatorName" runat="server" 
    ControlToValidate="staffName" ErrorMessage="Name must contain only letters." ValidationExpression="^[A-Za-z ]+$" CssClass="errorMessage">
</asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Name" ControlToValidate="staffName"></asp:RequiredFieldValidator>
                  
                    </div>
              




                              <div class="form-group">
    <label for="productName">Gender</label>
    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
        <asp:DropDownList ID="staffGender" runat="server" CssClass="dropdown-display">
             <asp:ListItem Value="M">Male</asp:ListItem>
             <asp:ListItem Value="F">Female</asp:ListItem>
                                </asp:DropDownList>
    </div>
               </div>
                <div class="form-group">

    <label for="productName">Role</label>
    <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
        

            <asp:DropDownList ID="staffRole" runat="server" CssClass="dropdown-display">
    <asp:ListItem>Staff</asp:ListItem>
    <asp:ListItem>Manager</asp:ListItem>
    <asp:ListItem>Admin</asp:ListItem>
</asp:DropDownList>
    </div>
</div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                   <asp:TextBox ID="contactNumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPhone" runat="server" 
    ControlToValidate="contactNumber" 
    ErrorMessage="Please enter a valid phone number." 
    ValidationExpression="^\+?([0-9]{1,3})?([0-9]{10})$" CssClass="errorMessage">
</asp:RegularExpressionValidator>
                </div>
               


                  <div class="form-group">
      <label for="email">E-mail</label>
     <asp:TextBox ID="email" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegexValidatorEmail" runat="server" ControlToValidate="email" ErrorMessage="Please enter a valid email address." 
    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errorMessage">
</asp:RegularExpressionValidator>
  </div>
                 
                                <div class="form-group">
    <label for="password">Password</label>
   <asp:TextBox ID="password" runat="server"></asp:TextBox>
  <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server" 
    ControlToValidate="password" 
    ErrorMessage="Password must be at least 8 characters long including numbers, uppercase and lowercase letters." 
    ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" CssClass="errorMessage">
</asp:RegularExpressionValidator>
   <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
    ControlToValidate="password" 
    ErrorMessage="Password is required." CssClass="errorMessage">
</asp:RequiredFieldValidator>


</div>
              
            </div>

          
                  <div class="button-container">
  
         <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button"/>
         <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button" OnClick="addBtn_Click"/>
</div>
        </div>
    </div>
    


        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>

</asp:Content>
