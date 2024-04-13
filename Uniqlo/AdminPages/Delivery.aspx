<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="Uniqlo.AdminPages.Delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <style>
        .dropdown-wrapper{
            margin-right:520px
        }
        .wrap-items-search-buttons{
        justify-content:normal;
        }

        
/* Name Column */
.name {
   flex-grow:1; /* Allow this column to grow and take up remaining space */
    

}
.status {
    flex-basis: 10%;
}

.gender {
    flex-basis: 10%;
}
/* Category Column */
.category {
    min-width: 0;
    flex-basis: 10%;
    word-wrap: break-word;
}


    </style>

       <link href="../css/productAdmin.css" rel="stylesheet" />
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
                     <div onclick="selectOption('In Stock', 'dropdownDisplay')">In Stock</div>
                     <div onclick="selectOption('Low In Stock', 'dropdownDisplay')">Low In Stock</div>
                     <div onclick="selectOption('No Stock', 'dropdownDisplay')">No Stock</div>
                  </div>
               </div>
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
               Payment ID
            </div>
            <div class="col eclipse-container">
               <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
            </div>
         </div>
         <!--Product 1-->
         <div class="row">
            <div class="col productid">
    1001
 </div>
 
 <div class="col name">
    Delivery Note 
 </div>
          
 <div class="col price">
    Status
 </div>
 <div class="col gender">
    1001
 </div>
 <div class="col category">
    1001
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
    1002
 </div>
 
 <div class="col name">
    Delivery Note 
 </div>
          
 <div class="col price">
    Status
 </div>
 <div class="col gender">
    1002
 </div>
 <div class="col category">
    1002
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
         <!--Product 3-->
         <div class="row">
           <div class="col productid">
    1003
 </div>
 
 <div class="col name">
    Delivery Note 
 </div>
          
 <div class="col price">
    Status
 </div>
 <div class="col gender">
    1003
 </div>
 <div class="col category">
    1003
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
         <!--Product 4-->
         <div class="row">
           <div class="col productid">
    1004
 </div>
 
 <div class="col name">
    Delivery Note 
 </div>
          
 <div class="col price">
    Status
 </div>
 <div class="col gender">
    1004
 </div>
 <div class="col category">
    1004
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
         <!--Product 5-->
         <div class="row">
             <div class="col productid">
    1005
 </div>
 
 <div class="col name">
    Delivery Note 
 </div>
          
 <div class="col price">
    Status
 </div>
 <div class="col gender">
    1005
 </div>
 <div class="col category">
    1005
 </div>
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
      </div>
                             <div class="viewMoreSection">
            <   1..10  >
        </div>
    
      </div>
   </div>
   <footer>
      <script src="../Javascript/productBtnEclipse.js"></script>
      <script src="../Javascript/productAdminDDL.js"></script>
   </footer>
</asp:Content>
