<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateStaff.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


                <header>
                    <link href="../../css/Admin/addStaff.css" rel="stylesheet" />
        </header>
       
 
 
 
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO UPDATE STAFF</h2>
        </div>
        <div class="modal-content">
            

            <div class="product-content">
                <div class="form-group">
     <label for="productName">Staff ID</label>
     <input type="text" name="productName" value="1" disabled/>
 </div>
                <div class="form-group">
                    <label for="productName">Staff Name</label>
                    <input type="text" name="productName" value="Yip Yong" />
                </div>
                                <div class="form-group">
    <label for="productName">E-mail</label>
    <input class="form-field" type="text" value="YipY@example.com">
</div>
                              <div class="form-group">
    <label for="productName">Gender</label>
    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
        <div class="dropdown-display" id="dropdownDisplay">Male</div>
        <div class="dropdown-list" id="dropdownList">
            <div onclick="selectOption('Male', 'dropdownDisplay')">Male</div>
            <div onclick="selectOption('Female', 'dropdownDisplay')">Female</div>
        </div>
    </div>
               </div>

                <div class="form-group">

    <label for="productName">Role</label>
    <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
        <div class="dropdown-display" id="dropdownDisplay2">Manager</div>
        <div class="dropdown-list" id="dropdownList2">
            <div onclick="selectOption('Admin', 'dropdownDisplay2')">Admin</div>
            <div onclick="selectOption('Manager', 'dropdownDisplay2')">Manager</div>
        </div>
    </div>
</div>

                <div class="form-group">
                    <label for="productName">Contact Number</label>
                    <input class="form-field" type="text" value="01655123456">
                </div>
                  

                
              
            </div>

          
            <div class="button-container">
                <div class="cancel-div">
                    <a href="Staff.aspx" class="cancel-button">Cancel</a>
                </div>
                <div class="continue-div">
                    <a href="Staff.aspx" class="continue-button">Update</a>
                </div>
            </div>
        </div>
    </div>
    


        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>

</asp:Content>
