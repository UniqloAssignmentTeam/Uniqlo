<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="Uniqlo.AdminPages.adminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <style>
        .bigDong {
            margin: 0 auto;
            max-width: 1100px;
            position: relative;
            align-content: center;
            align-items: center;
        }

        header {
            font-size: 28px;
            font-weight: 600;
            color: #232836;
            text-align: center;
        }

        /* Container */
        .container {
            width: 50%;
            /* Fixed width for the container */
            margin: 100px auto;
            /* Center the container horizontally */
            padding: 20px;
            background-color: white;
            /* White background */
            border-radius: 10px;
            /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            /* Subtle shadow */
            height: 90%;
            align-content: center;
            align-items: center;
        }

        /* Center */
        .center {
            text-align: center;
            /* Center text within the div */
            padding: 20px;
        }

        /* txt_field */
        .txt_field {
            position: relative;
            margin-bottom: 20px;
            /* Space between each field */
        }

        .txt_field input {
            width: 100%;
            /* Full width of the container */
            padding: 10px;
            border: none;
            /* Remove default border */
            border-bottom: 2px solid #ccc;
            /* Gray border */
            outline: none;
            font-size: 16px;
            color: #333;
            /* Darker text color */
            transition: border-color 0.3s;
            /* Smooth transition for border */
        }

        .txt_field input:focus {
            border-color: #4285f4;
            /* Change border color on focus */
        }

        /* Labels for txt_field */
        .txt_field label {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            font-size: 14px;
            pointer-events: none;
            /* Disable pointer events on label */
            transition: all 0.3s ease;
            /* Smooth transition */
        }

        .txt_field input:focus+label,
        .txt_field input:not(:placeholder-shown)+label {
            top: -10px;
            left: 0;
            color: #4285f4;
            /* Change label color on focus */
            font-size: 12px;
            /* Smaller font size */
        }

        /* Forget Password */
        .pass {
            text-align: right;
            color: #4285f4;
            /* Blue color */
            cursor: pointer;
            margin-bottom: 10px;
            /* Add space below the text */
        }

        .pass:hover {
            text-decoration: underline;
            /* Underline on hover */
        }

        /* Submit Button */
        input[type="submit"] {
            width: 100%;
            /* Full width */
            padding: 10px;
            border: none;
            background-color: #4285f4;
            /* Google blue */
            color: white;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            /* Smooth transition */
        }
.fa{
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    font-size: 18px;
    color: #8b8b8b;
    cursor: pointer;
    padding: 5px;
}

/* Submit Button */
input[type="submit"] {
    width: 100%; /* Full width */
    padding: 10px;
    border: none;
    background-color: #4285f4; /* Google blue */
    color: white;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease; /* Smooth transition */
}

        input[type="submit"]:hover {
            background-color: #357ae8;
            /* Darker blue on hover */
        }
    </style>
    <header>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width" />
    </header>
    <div class="bigDong">
        <div class="container">
            <div class="center">
                <header>Uniqlo Staff Login</header>

                <div class="txt_field">
                    <asp:TextBox ID="txtEmail" placeholder="Email" type="text" name="text" required="true" runat="server"></asp:TextBox>

                </div>
                <div class="txt_field">
                    <asp:TextBox ID="txtPassword" placeholder="Password" type="password" name="password" required="true" runat="server"></asp:TextBox>
                    <i id="togglePassword" class="fa fa-eye" onclick="togglePasswordVisibility()"></i>
                    <span></span>
                </div>
                <asp:Button ID="btnLogin" runat="server" name="submit" type="Submit" value="Login" Text="Login" OnClick="btnLogin_Click" />

                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
            </div>
        </div>
    </div>



    <footer>
        <script src="../Javascript/Login.js"></script>
        <script>
        document.addEventListener("DOMContentLoaded", function () {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
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
                var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
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
    </footer>
</asp:Content>
