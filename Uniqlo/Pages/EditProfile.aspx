<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Uniqlo.Pages.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


<head>
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
</head>

<body>
    <div class="container">
        <div class="main-body">
            <h2>Edit Profile</h2>
            <form action="save_profile_changes_url" method="post">
                <!-- Replace 'save_profile_changes_url' with the URL that handles form submissions -->

                <!-- Full Name -->
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" id="fullName" name="fullName" value="Kenneth Valdez">
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="cjtan@gmail.com">
                </div>

                <!-- Phone Number -->
                <div class="form-group">
                    <label for="phone">Phone No.:</label>
                    <input type="tel" id="phone" name="phone" value="014 816-9029">
                </div>

                <!-- Address -->
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="1, Jalan Lembah Permai">
                </div>

                <!-- Postcode -->
                <div class="form-group">
                    <label for="postcode">Postcode:</label>
                    <input type="text" id="postcode" name="postcode" value="11900">
                </div>

                <!-- City -->
                <div class="form-group">
                    <label for="city">City:</label>
                    <input type="text" id="city" name="city" value="Tanjung Bungah">
                </div>

                <!-- State -->
                <div class="form-group">
                    <label for="state">State:</label>
                    <input type="text" id="state" name="state" value="Penang">
                </div>

                <!-- Country -->
                <div class="form-group">
                    <label for="country">Country:</label>
                    <input type="text" id="country" name="country" value="Malaysia">
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <button type="submit">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</body>


</asp:Content>
