﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="Uniqlo.AdminPages.Delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <style>
        .dropdown-wrapper{
            margin-right:310px
        }
        .wrap-items-search-buttons{
        justify-content:normal;
        }

       .name {
   flex-grow:1; 
    
}
       .status {
    flex-basis: 15%;
}


.gender {
   
    flex-basis: 10%;

}


.category {
    
    flex-basis: 20%;
   
}


    </style>

    <link href="../css/Admin/adminDelivery.css" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   <div class="productBody">
      <h2>UNIQLO DELIVERY</h2>
      <div class="crudProduct">
         <div class="wrap-items-search-buttons">
            <div class="search">
               <span class="material-symbols-outlined">search</span>
               <input class="search-input" type="search" placeholder="Search" />
            </div>
            <div class="dropdown-wrapper">
               <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                  <div class="dropdown-display" id="dropdownDisplay">Status</div>
                  <div class="dropdown-list" id="dropdownList">
                     <div onclick="selectOption('Pending', 'dropdownDisplay')">In Stock</div>
                     <div onclick="selectOption('In Transit', 'dropdownDisplay')">Low In Stock</div>
                     <div onclick="selectOption('Delivered', 'dropdownDisplay')">No Stock</div>
                  </div>
               </div>
            </div>
              <div class="btnExcel-Add">
     <button class="excel-export" style="color: #6F6F6F; font-size: 1rem; font-weight:bold;">Export</button>
     
    
 </div>
         </div>
      </div>
      <div class="table">
         <!--Header-->
         <div class="row">
            <div class="col productid">
               Delivery ID
            </div>
            
            <div class="col name">
               Delivery Note 
            </div>
          
            <div class="col price">
               Status
            </div>
            <div class="col gender">
               Order ID
            </div>
            <div class="col category">
               Address
            </div>
            <div class="col eclipse-container">
               <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
            </div>
         </div>
         <!--Product 1-->
         <div class="row">
            <div class="col productid">
    1
 </div>
 
 <div class="col name">
    Leave at front door if no one is home. 
 </div>
          
 <div class="col price">
    Pending
 </div>
 <div class="col gender">
    2
 </div>
 <div class="col category">
    456 Elm St, Kuala Lumpur
 </div>
            <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">
               <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
               <div class="eclipse-list" id="dropdownList3">
                  <div>Shipping</div>
                  <div>Shipped</div>
                  <div>Received</div>
               </div>
            </div>
         </div>
         <!--Product 2-->
         <div class="row">
            <div class="col productid">
    2
 </div>
 
 <div class="col name">
    Call upon arrival for delivery. 
 </div>
          
 <div class="col price">
    In Transit
 </div>
 <div class="col gender">
    1
 </div>
 <div class="col category">
    123 Main St, Selangor
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
         <!--Product 3-->
         <div class="row">
           <div class="col productid">
    3
 </div>
 
 <div class="col name">
    Deliver to back entrance. 
 </div>
          
 <div class="col price">
    Delivered
 </div>
 <div class="col gender">
    6
 </div>
 <div class="col category">
    789 Oak St, Penang
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
         <!--Product 4-->
         <div class="row">
           <div class="col productid">
   4
 </div>
 
 <div class="col name">
    Handle with care. 
 </div>
          
 <div class="col price">
    Pending
 </div>
 <div class="col gender">
   8
 </div>
 <div class="col category">
    321 Pine St, Johor
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
         <!--Product 5-->
         <div class="row">
             <div class="col productid">
    5
 </div>
 
 <div class="col name">
    Fragile, please do not drop. 
 </div>
          
 <div class="col price">
    In Transit
 </div>
 <div class="col gender">
    5
 </div>
 <div class="col category">
    654 Maple St, Perak
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
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
      <script src="../Javascript/productAdminDDL.js"></script>
   </footer>
</asp:Content>
