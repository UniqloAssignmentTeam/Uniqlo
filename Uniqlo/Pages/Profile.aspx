<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Uniqlo.Pages.Profile" %>
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

                <div class="info-item">
                    <span class="info-label">Email:</span>
                    <span class="info-value">cjtan@gmail.com</span>
                </div>
                 <div class="info-item">
                    <span class="info-label">Gender:</span>
                    <span class="info-value">Male</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Contact No:</span>
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
                <div class="edit-profile"  id="orderHistoryBigContainer">
                    <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" CssClass="edit-button" OnClick="btnEditProfile_Click" />
                    <asp:Button ID="btnChgPass" runat="server" Text="Change Password" CssClass="edit-button" OnClick="btnChgPass_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
    <div class="main-body">
        <!-- Existing profile information goes here -->
        
        <!-- Order History Section -->
    <div class="table">
    <!-- Header -->
    <div class="row">
        <div class="col productid">Order ID</div>
        <div class="col category">Total Item</div>
        <div class="col gender">Total Amount</div>
        <div class="col wear">Date</div>
        <div class="col price">Status</div>

        <div class="col eclipse-container">
        
        <div class=""></div>
            <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
        </div>
    </div>

    <!-- Product 1 -->
    <div class="row">
        <div class="col productid">1001</div>
        <div class="col category">1</div>
        <div class="col gender">RM 109.90</div>
        <div class="col wear">14/3/2024</div>
        <div class="col price">Delivered</div>
        <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">
            <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
            <div class="eclipse-list" id="dropdownList3">
                <a href="OrderHistoryItem.aspx" style="text-decoration: none; color: #6F6F6F;"><div>View More</div></a>
            </div>
        </div>
    </div>

    <!-- Product 2 -->
    <div class="row">
        <div class="col productid">1002</div>
        <div class="col category">4</div>
        <div class="col gender">RM 100.00</div>
        <div class="col wear">14/3/2024</div>
        <div class="col price">Out for delivery</div>
        <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
    </div>

    <!-- Product 3 -->
    <div class="row">
        <div class="col productid">1003</div>
        <div class="col category">8</div>
        <div class="col gender">RM 12.00</div>
        <div class="col wear">14/3/2024</div>
        <div class="col price">Delivered
    </div>
        <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
    </div>

    <!-- Product 4 -->
    <div class="row">
        <div class="col productid">1004</div>
        <div class="col category">12</div>
        <div class="col gender">RM 45.00</div>
        <div class="col wear">12/3/2024</div>
        <div class="col price">Delivered</div>
        <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
    </div>

    <!-- Product 5 -->
    <div class="row">
        <div class="col productid">1005</div>
        <div class="col category">1</div>
        <div class="col gender">RM 50.00</div>
        <div class="col wear">12/3/2024</div>
        <div class="col price">Delivered</div>
        <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
    </div>
</div>
        <div class="pagination">
            <a href="#" class="page-link" onclick="changePage('prev')">&laquo;</a>
            <a href="#" class="page-link active" onclick="changePage(1)">1</a>
            <a href="#" class="page-link" onclick="changePage(2)">2</a>
            <a href="#" class="page-link" onclick="changePage(3)">3</a>
            <a href="#" class="page-link" onclick="changePage(4)">4</a>
            <a href="#" class="page-link" onclick="changePage(5)">5</a>


            <a href="#" class="page-link" onclick="changePage('next')">&raquo;</a>
        </div>

    </div>
        
</div>
    <footer> 
        
        <script src="../Javascript/productBtnEclipse.js"></script>

    </footer>
   
</asp:Content>
