<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Uniqlo.Pages.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<header>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="path_to_your_styles.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .container {
            max-width: 90%;
            margin: auto;
            padding: 20px;
        }
        .main-body {
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            color: #555;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .form-group button {
            padding: 10px 20px;
            background-color: #4285f4;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #357ae8;
        }
        input[type="text"], input[type="number"], input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }


    </style>
</header>

    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
        <div class="main-body" style="padding: 50px 35px">
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            <div style="background-color: white; padding: 30px 70px 30px 70px;">
                <table style="width: 100%; border: none;" class="table">
                    <tr class="row">
                        <td>
                            <h1>Edit Profile</h1>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="fullName">Full Name:</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegexValidatorName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Name must contain only letters." ValidationExpression="^[A-Za-z ]+$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Name" ControlToValidate="txtFullName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="email">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email address." ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="phone">Phone No.:</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="input" MaxLength="15"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegexValidatorPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please enter a valid phone number." ValidationExpression="^\+?([0-9]{1,3})?([0-9]{10})$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="address">Address:</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="input" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="postcode">Postcode:</label>
                            <asp:TextBox ID="txtPostcode" runat="server" CssClass="input" MaxLength="10"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revPostcode" runat="server" ControlToValidate="txtPostcode" ErrorMessage="Invalid postcode format." ValidationExpression="^\d{5}$" Display="None"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="city">City:</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="state">State:</label>
                            <asp:TextBox ID="txtState" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="col">
                            <label for="country">Country:</label>
                            <asp:TextBox ID="txtCountry" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                </table>

                <div class="form-group">
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="save-button" OnClientClick="confirmSaveChanges(event)" OnClick="btnSaveChanges_Click" style="cursor: pointer;"/>
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="back-button" OnClick="btnBack_Click" style="cursor: pointer;"/>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">
    function confirmSaveChanges(event) {
        event.preventDefault(); // Prevent the default form submission
        Swal.fire({
            title: 'Are you sure?',
            text: "Do you want to save the changes?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, save it!'
        }).then((result) => {
            if (result.isConfirmed) {
                // If confirmed, submit the form
                __doPostBack('<%= btnSaveChanges.UniqueID %>', '');
            }
        });
    }

    function showSuccessMessage(message) {
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: message
        });
    }

    function showErrorMessage(message) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: message
        });
    }
</script>
</asp:Content>
