<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StaffAdd.aspx.cs" Inherits="Uniqlo.AdminPages.AdminStaff.StaffAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />
        <link href="../../css/Admin/addStaff.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </header>

    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO ADD STAFF</h2>
        </div>
        <div class="modal-content">
            <div class="product-content">
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <asp:TextBox ID="email" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorEmail" runat="server" ControlToValidate="email" ErrorMessage="Please enter a valid email address." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <asp:TextBox ID="password" runat="server" MaxLength="30" TextMode="Password" CssClass="password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server" ControlToValidate="password" 
                        ErrorMessage="Password must be at least 8 characters long including numbers, uppercase and lowercase letters." 
                        ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="password" 
                        ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <i id="togglePassword" class="fa fa-eye" onclick="togglePasswordVisibility()"></i>
                </div>

                <div class="form-group">
                    <label for="staffName">Staff Name</label>
                    <asp:TextBox ID="staffName" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorName" runat="server" ControlToValidate="staffName" 
                        ErrorMessage="Name must contain only letters." ValidationExpression="^[A-Za-z ]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Name" ControlToValidate="staffName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="productName">Gender</label>
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                        <asp:DropDownList ID="staffGender" runat="server" CssClass="dropdown-display">
                            <asp:ListItem Value="">Genders</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ControlToValidate="staffGender" InitialValue="" 
                        ErrorMessage="Please select a gender." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="productName">Role</label>
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                        <asp:DropDownList ID="staffRole" runat="server" CssClass="dropdown-display">
                            <asp:ListItem Value="">Role</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRole" runat="server" ControlToValidate="staffRole" InitialValue="" 
                        ErrorMessage="Please select a role." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <asp:TextBox ID="contactNumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPhone" runat="server" ControlToValidate="contactNumber" 
                        ErrorMessage="Please enter a valid phone number." ValidationExpression="^\+?([0-9]{1,3})?([0-9]{10})$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="contactNumber" InitialValue="" 
       ErrorMessage="Please enter contact number." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="button-container">
                <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button" CausesValidation="false" OnClick="cancelBtn_Click"/>
                <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button" OnClick="addBtn_Click"/>
            </div>
        </div>
    </div>

    <script>
        // Function to show success alert
        function showSuccessAlert() {
            Swal.fire({
                title: 'Success!',
                text: 'New staff member added successfully.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'StaffHome.aspx';
                }
            });
        }

        // Check session variable and trigger SweetAlert if staff added
        window.onload = function () {
            var staffAdded = '<%= Session["StaffAdded"] %>';
            if (staffAdded === 'True') {
                showSuccessAlert();
                <% Session["StaffAdded"] = null; %> 
            }
        }

        document.addEventListener("DOMContentLoaded", function () {
            var passwordField = document.getElementById('<%= password.ClientID %>');
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
                var passwordField = document.getElementById('<%= password.ClientID %>');
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

    </script>
</asp:Content>
