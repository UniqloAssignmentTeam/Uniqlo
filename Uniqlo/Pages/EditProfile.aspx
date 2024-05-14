<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Uniqlo.Pages.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
<header>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="path_to_your_styles.css">
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
        .form-group input {
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
    </style>
</header>

    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
        <div class="main-body">
            <h2>Edit Profile</h2>
           
                <!-- Full Name -->
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                </div>
                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                </div>
                <!-- Phone Number -->
                <div class="form-group">
                    <label for="phone">Phone No.:</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input" MaxLength="15"></asp:TextBox>
                </div>
                <!-- Address -->
                <div class="form-group">
                    <label for="address">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input" MaxLength="100"></asp:TextBox>
                </div>
                <!-- Postcode -->
                <div class="form-group">
                    <label for="postcode">Postcode:</label>
                    <asp:TextBox ID="txtPostcode" runat="server" CssClass="input" MaxLength="10"></asp:TextBox>
                </div>
                <!-- City -->
                <div class="form-group">
                    <label for="city">City:</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                </div>
                <!-- State -->
                <div class="form-group">
                    <label for="state">State:</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                </div>
                <!-- Country -->
                <div class="form-group">
                    <label for="country">Country:</label>
                    <asp:TextBox ID="txtCountry" runat="server" CssClass="input" MaxLength="50"></asp:TextBox>
                </div>
                <!-- Profile Photo -->
                <div class="form-group">
                    <label for="file">Profile Photo:</label>
                    <asp:FileUpload ID="fileProfilePhoto" runat="server" CssClass="input" />
                </div>
                <!-- Submit Button -->
                <div class="form-group">
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="save-button" OnClientClick="return confirm('Are you sure you want to save changes?');" OnClick="btnSaveChanges_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="back-button" OnClick="btnBack_Click" />
                </div>
           
        </div>
    </div>

</asp:Content>
