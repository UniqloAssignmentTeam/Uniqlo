﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
                        <header>
                            <link href="../../css/Admin/addDiscount.css" rel="stylesheet" />
      </header>
     
 
 
 
         <div class="container">
      <div class="productItemCard">
          <h2 class="product-title">UNIQLO UPDATE DISCOUNT</h2>
      </div>
      <div class="modal-content">
          

          <div class="product-content">

              <div class="form-group">
     <label for="discountID">Discount ID</label>
        <asp:TextBox ID="discountIDText" runat="server" Enabled="False"></asp:TextBox>
 </div>
          


                           <div class="form-group">
    <label for="productID">Product ID</label>
    <asp:TextBox ID="productID" runat="server" Enabled="False"></asp:TextBox>
</div>



              <div class="form-group">
                  <label for="productName">Product Name</label>
                  <asp:TextBox ID="productName" runat="server" Enabled="False"></asp:TextBox>
                
              </div>
          

    <div class="form-group">
    <label for="discountAmount">Amount - Discount</label>
      <asp:TextBox ID="discountAmount" runat="server"></asp:TextBox>
</div>


                            <div class="form-group">
  <label for="productName">Status</label>
  <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
      <asp:DropDownList ID="status" runat="server" CssClass="dropdown-display">
          <asp:ListItem>Active</asp:ListItem>
          <asp:ListItem>Inactive</asp:ListItem>
      </asp:DropDownList>
  </div>
             </div>
            


              <div class="form-group">
                  <label for="productName">Start Date</label>
                    <asp:TextBox ID="startDate" runat="server" type="date"></asp:TextBox>
             
              </div>
                <div class="form-group">
    <label for="productName">End Date</label>
    <asp:TextBox ID="endDate" runat="server" type="date"></asp:TextBox>
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
