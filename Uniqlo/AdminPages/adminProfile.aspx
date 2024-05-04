<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminProfile.aspx.cs" Inherits="Uniqlo.AdminPages.adminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

        <header>
        <link href="../css/Profile.css" rel="stylesheet" />
      
    </header>
    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
        <div class="main-body">
            <div class="profile-header">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="User Avatar" class="avatar">
                <h4 class="username">Tan Choo Jun</h4>
            </div>
            <div class="profile-info">
                <!---->
                <div class="info-item">
                    <span class="info-label">Full Name:</span>
                    <span class="info-value">Kenneth Valdez</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <span class="info-value">cjtan@gmail.com</span>
                </div>
                 <div class="info-item">
                    <span class="info-label">Gender:</span>
                    <span class="info-value">Male</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Phone No:</span>
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
                    <asp:Button ID="btnChgPass" runat="server" Text="Change Password" CssClass="edit-button" OnClick="btnChgPass_Click" />
                </div>
            </div>
        </div>
    </div>

   
    <footer> 
        
        <script src="../Javascript/productBtnEclipse.js"></script>

    </footer>
</asp:Content>
