<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Uniqlo.Pages.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


<header>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="path_to_your_styles.css">
    <style>
        /* Apply similar styles to the ones in the provided code */

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

<body>
    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
        <div class="main-body">
            <h2>Edit Profile</h2>
            <form action="save_profile_changes_url" method="post">
                <!-- Replace 'save_profile_changes_url' with the URL that handles form submissions -->

                <!-- Full Name -->
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
          
                     <asp:TextBox ID="txtID" runat="server"
                Text='<%#Bind("Customer_ID") %>'
                 ></asp:TextBox>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email:</label>
                        <asp:TextBox ID="TextBox1" runat="server"
                Text='<%#Bind("Customer_ID") %>'
                ></asp:TextBox>
                </div>

                <!-- Phone Number -->
                <div class="form-group">
                    <label for="phone">Phone No.:</label>
                         <asp:TextBox ID="TextBox2" runat="server"
                Text='<%#Bind("Customer_ID") %>'
                ></asp:TextBox>
                </div>

                <!-- Address -->
                <div class="form-group">
                    <label for="address">Address:</label>
     <asp:TextBox ID="TextBox3" runat="server"
Text='<%#Bind("Customer_ID") %>'
 ></asp:TextBox>
                </div>

                <!-- Postcode -->
                <div class="form-group">
                    <label for="postcode">Postcode:</label>
                        <asp:TextBox ID="TextBox4" runat="server"
Text='<%#Bind("Customer_ID") %>'
 ></asp:TextBox>
                </div>

                <!-- City -->
                <div class="form-group">
                    <label for="city">City:</label>
                         <asp:TextBox ID="TextBox5" runat="server"
Text='<%#Bind("Customer_ID") %>'
 ></asp:TextBox>
                </div>

                <!-- State -->
                <div class="form-group">
                    <label for="state">State:</label>
                         <asp:TextBox ID="TextBox6" runat="server"
Text='<%#Bind("Customer_ID") %>'
 ></asp:TextBox>
                </div>

                <!-- Country -->
                <div class="form-group">
                    <label for="country">Country:</label>
                         <asp:TextBox ID="TextBox7" runat="server"
Text='<%#Bind("Customer_ID") %>'
 ></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="file">Profile Photo:</label>
                         <asp:TextBox ID="TextBox8" type="file" name="file" value="file" runat="server"
Text='<%#Bind("Customer_ID") %>' OnTextChanged="TextBox8_TextChanged"
 ></asp:TextBox>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                <asp:Button ID="btnSaveChanges" runat="server"  Text="Save Changes" CssClass="save-button" OnClientClick="return confirm('Are you sure you want to save changes?');" OnClick="btnSaveChanges_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="back-button" type="button" OnClick="btnBack_Click" />
               </div>
            </form>
        </div>
    </div>
</body>


</asp:Content>
