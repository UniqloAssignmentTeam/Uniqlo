<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Uniqlo.Pages.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <head>
        <link href="../css/Profile.css" rel="stylesheet" />
    </head>
    <div class="container">
        <div class="main-body">
            <div class="profile-header">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="User Avatar" class="avatar">
                <h4 class="username">Tan Choo Jun</h4>
            </div>
            <div class="profile-info">
                <div class="info-item">
                    <span class="info-label">Full Name:</span>
                    <span class="info-value">Kenneth Valdez</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <span class="info-value">cjtan@gmail.com</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Phone No.:</span>
                    <span class="info-value">014 816-9029</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Address:</span>
                    <span class="info-value">1, Jalan Lembah Permai</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Postcode</span>
                    <span class="info-value">11900</span>
                </div>
                 <div class="info-item">
                    <span class="info-label">City</span>
                    <span class="info-value">Tanjung Bungah</span>
                </div>
                <div class="info-item">
                    <span class="info-label">State</span>
                    <span class="info-value">Penang</span>
                </div>
                <div class="info-item">
                     <span class="info-label">Country</span>
                    <span class="info-value">Malaysia</span>
                </div>
                <br />
                <div class="edit-profile">
                    <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" CssClass="edit-button" OnClick="btnEditProfile_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="container">
    <div class="main-body">
        <!-- Existing profile information goes here -->
        
        <!-- Order History Section -->
        <div class="order-history">
            <h4>Order History</h4>
            <table class="order-history-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Items</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#12345</td>
                        <td>April 12, 2024</td>
                        <td>T-shirt, Jeans</td>
                        <td>RM80.00</td>
                    </tr>
                    <tr>
                        <td>#12346</td>
                        <td>March 22, 2024</td>
                        <td>Jacket, Socks</td>
                        <td>RM150.00</td>
                    </tr>
                    <tr>
                        <td>#12347</td>
                        <td>February 10, 2024</td>
                        <td>Shoes</td>
                        <td>RM100.00</td>
                    </tr>
                    <!-- Add more orders as needed -->
                </tbody>
            </table>
        </div>
    </div>
</div>

</asp:Content>
