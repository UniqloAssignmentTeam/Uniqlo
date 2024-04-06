<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

 
    
        <link href="../css/productAdmin.css" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
           <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   

    <div class="productBody">

 <h2>Product</h2>

       

    

<div class="crudProduct">




 <div class="wrap-items-search-buttons">
     <div class="search">
        <span class="material-symbols-outlined">search</span>
         <input class="search-input" type="search" placeholder="Search" />
     </div>









   <div class="dropdown-container" onclick="toggleDropdown()">
  <div class="dropdown-display" id="dropdownDisplay">Status</div>
  <div class="dropdown-list" id="dropdownList">
    <div onclick="selectOption('In Stock')">In Stock</div>
    <div onclick="selectOption('Low In Stock')">Low In Stock</div>
    <div onclick="selectOption('No Stock')">No Stock</div>
  </div>
</div>


     <div>
     <select name="exampleDropdown" id="ddlCategoryFilter">
  <option value="option1">Men</option>
  <option value="option2">Women</option>
  <option value="option3">Kids</option>
</select>
         </div>
 





     <div class="move">
      
          <asp:Button ID="btnExcelExport" runat="server" Text="Export" CssClass="excel-export" Font-Bold="True" ToolTip="Export To Excel" />  
         <asp:Button ID="btnAddProduct" runat="server" Text="➕ Add Product" CssClass="product-add" ToolTip="Add Product" Font-Bold="True" />

            </div>

     

</div>




</div>











<div class="table">

   <!--Header-->
    <div class="row">

    <div class="col productid">
        Product ID
    </div>
  
       <div class="col prodImageHeader">
       <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" Visible:"False" />
    </div>
        
    <div class="col name">
        Product Name
    </div>

     <div class="col status">
     Status
 </div>

    <div class="col price">
        Price (RM)
    </div>

<div class="col gender">
    Gender
</div>

    <div class="col category">
        Category
    </div>
              <div class="col actionBtn">
                  <asp:Button ID="actionBtnNone" class="" runat="server" Text="Button" Visible="True" />
</div>
        </div>
     


       <!--Product 1-->
  <div class="row">

  <div class="col productid">
      1001
  </div>
     <div class="prodImage">
  <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" />
</div>

  <div class="col name">
      Product Name   Product
      </div>

   <div class="col inStock">
     In Stock
 </div>

  <div class="col price">
      100.00
  </div>
  <div class="col gender">
    Gender
</div>
  <div class="col category">
      Category
  </div>
      <div class="col actionBtn">
          <asp:Button ID="btnAction1" runat="server" Text="Button" />
</div>
      </div>
  

    <!--Product 2-->
     <div class="row">

 <div class="col productid">
      1002
 </div>

   <div class="prodImage">
    <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" />
</div>

 <div class="col name">
     Product Name
 </div>

     <div class="col lowInStock">
     Low In Stock
 </div>

 <div class="col price">
    99.00
 </div>
   <div class="col gender">
    Gender
</div>
 <div class="col category">
     Category
 </div>

    <div class="col actionBtn">
          <asp:Button ID="btnAction2" runat="server" Text="Button" />
</div>

     </div>
   

    <!--Product 3-->
     <div class="row">

 <div class="col productid">
      1003
 </div>

   <div class="prodImage">
    <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" />
</div>

 <div class="col name">
     Product Name
 </div>

   <div class="col stat inStock">
    In Stock
</div>

 <div class="col price">
    130.00
 </div>
   <div class="col gender">
    Gender
</div>
 <div class="col category">
     Category
 </div>

               <div class="col actionBtn">
          <asp:Button ID="btnAction3" runat="server" Text="Button" />
</div>

     </div>
    

    <!--Product 4-->
     <div class="row">

 <div class="col productid">
      1004
 </div>

   <div class="prodImage">
    <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" />
</div>

 <div class="col name">
     Product Name
      </div>

  <div class="col stat inStock">
     In Stock
 </div>

 <div class="col price">
     12.00
 </div>
   <div class="col gender">
    Gender
</div>
 <div class="col category">
     Category
 </div>

               <div class="col actionBtn">
          <asp:Button ID="btnAction4" runat="server" Text="Button" />
</div>
     </div>
    

       <!--Product 5-->
    <div class="row">

<div class="col productid">
    1005
</div>

   <div class="prodImage">
    <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" />
</div>

<div class="col name">
    Product Name
</div>

      <div class="col lowInStock">
     Low In Stock
 </div>

<div class="col price">
    112.00
</div>
          <div class="col gender">
    Gender
</div>
<div class="col category">
    Category
</div>

              <div class="col actionBtn">
          <asp:Button ID="btnAction5" runat="server" Text="Button" />
</div>
    </div>
    

</div>









</div>
    
    <footer>

        
        <script src="../Javascript/productAdminDDL.js"></script>

      

    </footer>
</asp:Content>
