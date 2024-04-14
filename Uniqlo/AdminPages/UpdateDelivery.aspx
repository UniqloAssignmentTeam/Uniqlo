<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateDelivery.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
                            <header>
                            <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
      </header>
     
 
 
 
         <div class="container">
      <div class="productItemCard">
          <h2 class="product-title">UNIQLO UPDATE DEVIVERY</h2>
      </div>
      <div class="modal-content">
          

          <div class="product-content">

              <div class="form-group">
     <label for="productName">Delivery ID</label>
     <input type="text" name="productName" value="1" disabled>
 </div>
              <div class="form-group">
                  <label for="productName">Address</label>
                  <input type="text" name="productName" value="123 Main St">
              </div>
              <div class="form-group">
    <label for="productName">State</label>
    <input type="text" name="productName" value="Selangor">
</div>
              <div class="form-group">
    <label for="productName">City</label>
    <input type="text" name="productName" value="Petaling Jaya">
</div>
              <div class="form-group">
    <label for="productName">Postcode</label>
    <input type="text" name="productName" value="47301">
</div>
                         <div class="form-group">
    <label for="productName">Country</label>
    <input type="text" name="productName" value="Malaysia" disabled>
</div>                   

                            <div class="form-group">
  <label for="productName">Status</label>
  <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
      <div class="dropdown-display" id="dropdownDisplay">Pending</div>
      <div class="dropdown-list" id="dropdownList">
          <div onclick="selectOption('Pending', 'dropdownDisplay')">Pending</div>
          <div onclick="selectOption('Delivering', 'dropdownDisplay')">In Transit</div>
          <div onclick="selectOption('Delivered', 'dropdownDisplay')">Delivered</div>
      </div>
  </div>
             </div>
            

              

              
            
          </div>

        
          <div class="button-container">
              <div class="cancel-div">
                  <a href="Discount.aspx" class="cancel-button">CANCEL</a>
              </div>
              <div class="continue-div">
                  <a href="Discount.aspx" class="continue-button">UPDATE</a>
              </div>
          </div>
      </div>
  </div>
    <footer>
    <script src="../../Javascript/productBtnEclipse.js"></script>
    <script src="../../Javascript/productAdminDDL.js"></script>
    <script src="../../Javascript/Pagination.js"></script>
</footer>
</asp:Content>
