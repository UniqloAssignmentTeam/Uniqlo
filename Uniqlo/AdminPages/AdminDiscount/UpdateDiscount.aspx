<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
                        <header>
                            <link href="../../css/Admin/adminDiscount.css" rel="stylesheet" />
      </header>
     
 
 
 
         <div class="container">
      <div class="productItemCard">
          <h2 class="product-title">UNIQLO UPDATE DISCOUNT</h2>
      </div>
      <div class="modal-content">
          

          <div class="product-content">

              <div class="form-group">
     <label for="productName">Discount ID</label>
     <input type="text" name="productName" value="1001" disabled>
 </div>
              <div class="form-group">
                  <label for="productName">Product ID</label>
                  <input type="text" name="productName" value="1001">
              </div>

                            <div class="form-group">
  <label for="productName">Status</label>
  <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
      <div class="dropdown-display" id="dropdownDisplay">Valid</div>
      <div class="dropdown-list" id="dropdownList">
          <div onclick="selectOption('Valid', 'dropdownDisplay')">Valid</div>
          <div onclick="selectOption('Invalid', 'dropdownDisplay')">Invalid</div>
      </div>
  </div>
             </div>
            

              <div class="form-group">
                  <label for="productName">Start Date</label>
                  <input class="form-field" type="date" value="2024-02-11">
              </div>
                <div class="form-group">
    <label for="productName">End Date</label>
    <input class="form-field" type="date" value="2024-02-14">
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
      <script src="../../Javascript/productAdminDDL.js"></script>
          </footer>

</asp:Content>
