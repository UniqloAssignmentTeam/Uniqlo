<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateStaff.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../css/Admin/addStaff.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </header>

    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO UPDATE STAFF</h2>
        </div>
        <div class="modal-content">
            <div class="product-content">
                <div class="form-group">
                    <label for="productName">Staff ID</label>
                    <asp:TextBox ID="staffID" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <asp:TextBox ID="email" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorEmail" runat="server" ControlToValidate="email" ErrorMessage="Please enter a valid email address."
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email"
                        ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <asp:TextBox ID="password" runat="server" MaxLength="30"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server" ControlToValidate="password"
                        ErrorMessage="Password must be at least 8 characters long including numbers, uppercase and lowercase letters."
                        ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="password"
                        ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <i id="togglePassword" class="fa fa-eye" onclick="togglePasswordVisibility()"></i>
                </div>
                <div class="form-group">
                    <label for="staffName">Staff Name</label>
                    <asp:TextBox ID="staffName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorName" runat="server" ControlToValidate="staffName"
                        ErrorMessage="Name must contain only letters and be 3-50 characters long and only characters."
                        ValidationExpression="^[A-Za-z ]{3,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Name" ControlToValidate="staffName"
                        ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="productName">Gender</label>
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                        <asp:DropDownList ID="staffGender" runat="server" CssClass="dropdown-display">
                            <asp:ListItem Value="">Gender</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:CustomValidator ID="CustomValidatorProduct" runat="server" ValidateEmptyText="true" ControlToValidate="staffGender"
                    ErrorMessage="Please select a Gender" ForeColor="Red" Display="Dynamic" OnServerValidate="ValidateStaffGender_ServerValidate"></asp:CustomValidator>
                <div class="form-group">
                    <label for="productName">Role</label>
                    <div class="dropdown-container">
                        <asp:DropDownList ID="staffRole" runat="server" CssClass="dropdown-display">
                            <asp:ListItem Value="">Role</asp:ListItem>
                            <asp:ListItem>Staff</asp:ListItem>
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ControlToValidate="staffRole" InitialValue=""
                    ErrorMessage="Please select a role." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <asp:TextBox ID="contactNumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPhone" runat="server" ControlToValidate="contactNumber"
                        ErrorMessage="Please enter a valid phone number." ValidationExpression="^\+?([0-9]{1,3})?([0-9]{10})$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="button-container">
                <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button" CausesValidation="false" OnClick="cancelBtn_Click" />
                <asp:Button ID="updateBtn" runat="server" Text="UPDATE" CssClass="continue-button" CausesValidation="true" OnClick="updateBtn_Click" />
            </div>
        </div>
    </div>

    <script>
        // Function to show success alert
        function showSuccessAlert() {
            Swal.fire({
                title: 'Success!',
                text: 'Staff details updated successfully.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'StaffHome.aspx';
                }
            });
        }

        // Check session variable and trigger SweetAlert if staff updated
        window.onload = function () {
            var staffUpdated = '<%= Session["StaffUpdated"] %>';
            if (staffUpdated === 'True') {
                showSuccessAlert();
                <% Session["StaffUpdated"] = null; %> // Clear session variable
            }
        }

        // Eye Icon
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

    document.addEventListener("DOMContentLoaded", function () {
        var passwordField = document.getElementById('<%= password.ClientID %>');
        var toggleIcon = document.getElementById('togglePassword');
        passwordField.type = 'password'; // Ensure password is hidden by default
        toggleIcon.classList.remove('fa-eye');
        toggleIcon.classList.add('fa-eye-slash'); // Set default icon to slashed eye
    });
    </script>
</asp:Content>