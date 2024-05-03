<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Uniqlo.AdminPages.AddStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

            <header>
                <link href="../../css/Admin/addStaff.css" rel="stylesheet" />
        </header>
       
 
 
 
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO ADD STAFF</h2>
        </div>
        <div class="modal-content">
            

            <div class="product-content">
               
                <div class="form-group">
                    <label for="staffName">Staff Name</label>
                     <asp:TextBox ID="staffName" runat="server"></asp:TextBox>
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
        <div class="dropdown-display" id="dropdownDisplay2">Admin</div>
        <div class="dropdown-list" id="dropdownList2">
            <div onclick="selectOption('Admin', 'dropdownDisplay2')">Admin</div>
            <div onclick="selectOption('Manager', 'dropdownDisplay2')">Manager</div>
            <div onclick="selectOption('Staff', 'dropdownDisplay2')">Staff</div>
        </div>
    </div>
</div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                   <asp:TextBox ID="contactNumber" runat="server"></asp:TextBox>
                </div>
               


                  <div class="form-group">
      <label for="email">E-mail</label>
     <asp:TextBox ID="email" runat="server"></asp:TextBox>
  </div>
                 
                
              
            </div>

          
                  <div class="button-container">
  
         <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button"/>
         <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button"/>
</div>
        </div>
    </div>
    


        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>


</asp:Content>
