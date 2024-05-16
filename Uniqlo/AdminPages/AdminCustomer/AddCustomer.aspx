<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="Uniqlo.AdminPages.AdminCustomer.AddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />
        <link href="../../css/Admin/addStaff.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            .button-container {
                display: flex;
                text-align: center;
                margin: 60px 0px 60px 0px;
                width: 80%;
                margin-top: 50px;
                margin-left: 210px;
            }
            .cancel-button {
                border: 2px solid lightgrey;
                padding: 20px 100px 20px 60px;
                background: none;
                outline: none;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease;
                text-decoration: none;
                color: black;
                width: 30%;
            }


            .continue-button {
                border: 2px solid lightgrey;
                padding: 20px 90px 20px 60px;
                background: none;
                outline: none;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease;
                text-decoration: none;
                color: black;
                width: 30%;
            }

                .continue-button:hover, .cancel-button:hover {
                    background-color: black;
                    color: white;
                }
   

        </style>
    </header>

    <div class="container">
        <div class="customerItemCard">
            <h2 class="customer-title" style="padding-left: 370px">UNIQLO ADD CUSTOMER</h2>
        </div>
        <div class="modal-content" style="padding-top: 30px;padding-left: 250px;">
            <div class="customer-content">
                <div class="form-group">
                    <label for="name">Name</label>
                    <asp:TextBox ID="txtName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name must contain only letters." ValidationExpression="^[A-Za-z ]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <div class="dropdown-container">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ControlToValidate="ddlGender" InitialValue="" 
                        ErrorMessage="Please select a gender." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPhone" runat="server" ControlToValidate="txtContactNumber" 
                        ErrorMessage="Please enter a valid phone number." ValidationExpression="^\+?([0-9]{1,3})?([0-9]{10})$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContactNumber" InitialValue="" 
                        ErrorMessage="Please insert a contact number." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="state">State</label>
                    <asp:TextBox ID="txtState" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" runat="server" ControlToValidate="txtState" ErrorMessage="State is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="city">City</label>
                    <asp:TextBox ID="txtCity" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="postcode">Postcode</label>
                    <asp:TextBox ID="txtPostcode" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostcode" runat="server" ControlToValidate="txtPostcode" ErrorMessage="Postcode is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="country">Country</label>
                    <asp:TextBox ID="txtCountry" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCountry" runat="server" ControlToValidate="txtCountry" ErrorMessage="Country is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="email">E-mail</label>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="40"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter a valid email address." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" MaxLength="30" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server" ControlToValidate="txtPassword" 
                        ErrorMessage="Password must be at least 8 characters long including numbers, uppercase and lowercase letters." 
                        ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="button-container" style="margin-left: -30px;">
                <div class="cancel-div">
                   <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button" CausesValidation="false" PostBackUrl="~/AdminPages/AdminCustomer/CustomerHome.aspx" />
                </div>
                <div class="continue-div">
                    <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button" OnClick="addBtn_Click"/>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Function to show success alert
        function showSuccessAlert() {
            Swal.fire({
                title: 'Success!',
                text: 'New customer added successfully.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = 'CustomerHome.aspx';
                }
            });
        }

        // Check session variable and trigger SweetAlert if customer added
        window.onload = function () {
            var customerAdded = '<%= Session["CustomerAdded"] %>';
            if (customerAdded === 'True') {
                showSuccessAlert();
                <% Session["CustomerAdded"] = null; %> 
            }
        }
    </script>
</asp:Content>
