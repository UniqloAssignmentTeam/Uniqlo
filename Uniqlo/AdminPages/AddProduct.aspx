<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Uniqlo.AdminPages.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
    <style>
        .Body {
        max-width: 1100px;
        position: relative;
        margin: auto;
    }
    </style>
    <div class="Body">
           <div id="addProductModalContainer" class="modal">
      <div class="modal-content">
         <div class = "card-wrapper">
            <div class = "productItemCard">
               <!-- card left -->
               <h2 class = "product-title product-name">Uniqlo Add Product</h2>
            </div>
            <!-- card right -->
            <div class = "product-content">
               <div class="form-group">
                  <span>Product Name</span>
                  <input class="form-field" type="text" >
               </div>
               <div class = "product-detail">
                  <div class="form-group">
                     <span>Description    </span>   
                     <textarea class="form-field" rows="4" cols="50"></textarea> 
                  </div>
                  <div class="product-details-info">
                     <div class="form-group">
                        <span>Price</span>
                        <input class="form-field" type="text" >
                     </div>
                  </div>
                  <div class="product-details-info">
                     <div class="form-group">
                        <span>Availability:</span>
                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList6', 'dropdownDisplay6')">
                           <div class="dropdown-display" id="dropdownDisplay6">Status</div>
                           <div class="dropdown-list" id="dropdownList6">
                              <div onclick="selectOption('In Stock', 'dropdownDisplay')">In Stock</div>
                              <div onclick="selectOption('Low In Stock', 'dropdownDisplay')">Low In Stock</div>
                              <div onclick="selectOption('No Stock', 'dropdownDisplay')">No Stock</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="product-details-info">
                     <div class="form-group">
                        <span>Category:</span>
                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList5', 'dropdownDisplay5')">
                           <div class="dropdown-display" id="dropdownDisplay5">Status</div>
                           <div class="dropdown-list" id="dropdownList5">
                              <div onclick="selectOption('In Stock', 'dropdownDisplay')">In Stock</div>
                              <div onclick="selectOption('Low In Stock', 'dropdownDisplay')">Low In Stock</div>
                              <div onclick="selectOption('No Stock', 'dropdownDisplay')">No Stock</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="product-details-info">
                     <div class="form-group">
                        <span>Gender</span>
                        <div class="dropdown-container" onclick="toggleDropdown('dropdownList4', 'dropdownDisplay4')">
                           <div class="dropdown-display" id="dropdownDisplay4">Category</div>
                           <div class="dropdown-list" id="dropdownList4">
                              <div onclick="selectOption('Men', 'dropdownDisplay2')">Men</div>
                              <div onclick="selectOption('Women', 'dropdownDisplay2')">Women</div>
                              <div onclick="selectOption('Kids', 'dropdownDisplay2')">Kids</div>
                           </div>
                        </div>
                     </div>
                  </div>

                   <div class="add-color-section">
    <input type="text" id="newColorInput" placeholder="New color">
    <button id="addColorButton">Add color</button>
</div>

<div class="addProductQtySizeSection">
   <div class="quantityHeader">QUANTITY</div>
   <div class="purchase-size-item">
      <div class="form-group">
         <span>S:</span>
         <input class="form-field" type="text" >
      </div>
   </div>
   <div class="purchase-size">
      <div class="form-group">
         <span>M:</span>
         <input class="form-field" type="text" >
      </div>
   </div>
   <div class="purchase-size">
      <div class="form-group">
         <span>L:</span>
         <input class="form-field" type="text" >
      </div>
   </div>
   <div class="purchase-size">
      <div class="form-group">
         <span>XL:</span>
         <input class="form-field" type="text" >
      </div>
   </div>
</div>
               </div>
               <div class="addProduct-restProduct">
                  <div  class="addProductBtn">Add Product</div>
                  <div  class="addProductBtn">Reset</div>
               </div>
            </div>
         </div>
      </div>
   </div>

    </div>

</asp:Content>
