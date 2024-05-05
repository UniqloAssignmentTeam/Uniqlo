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
    <asp:TextBox ID="staffID" runat="server" Enabled="False"></asp:TextBox>
 </div>
                
                <div class="form-group">
                    <label for="staffName">Staff Name</label>
                     <asp:TextBox ID="staffName" runat="server"></asp:TextBox>
                </div>
                




                                <div class="form-group">
    <label for="email">E-mail</label>
  <asp:TextBox ID="email" runat="server"></asp:TextBox>
</div>


                              <div class="form-group">
    <label for="productName">Gender</label>


         

    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
        
  <asp:DropDownList ID="staffGender" runat="server" CssClass="dropdown-display">
               <asp:ListItem>Male</asp:ListItem>
               <asp:ListItem>Female</asp:ListItem>
                                  </asp:DropDownList>

    </div>


               </div>
              
                <div class="form-group">

    <label for="productName">Role</label>
    <div class="dropdown-container">
        
      <asp:DropDownList ID="staffRole" runat="server" CssClass="dropdown-display">
      <asp:ListItem>Staff</asp:ListItem>
      <asp:ListItem>Manager</asp:ListItem>
      <asp:ListItem>Admin</asp:ListItem>
  </asp:DropDownList>

    </div>
</div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <asp:TextBox ID="contactNumber" runat="server"></asp:TextBox>
                </div>
                  

                
              
            </div>

                            <div class="button-container">
  
         <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button"/>
        <asp:Button ID="updateBtn" runat="server" Text="UPDATE" CssClass="continue-button" OnClick="updateBtn_Click"/>

</div>
        </div>
    </div>
    


        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>

</asp:Content>
