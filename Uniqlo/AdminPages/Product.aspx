<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/productAdmin.css" rel="stylesheet" />
    <div class="productBody">
            <header>
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>
 <h2>Product</h2>

       

    

<div class="crudProduct">




 <div class="wrap-items-search-buttons">
     <div class="search">
        <span class="material-symbols-outlined">search</span>
         <input class="search-input" type="search" placeholder="Search" />
     </div>








     <div>

     <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="ddlFilter">
         <asp:ListItem>In Stock</asp:ListItem>
         <asp:ListItem>Low In Stock</asp:ListItem>
         <asp:ListItem>No Stock</asp:ListItem>
         </asp:DropDownList>
</div>

    <div>

     <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="ddlFilter" OnSelectedIndexChanged="ddlCategoryFilter_SelectedIndexChanged">
         <asp:ListItem>Kids</asp:ListItem>
         <asp:ListItem>Men</asp:ListItem>
         <asp:ListItem>Women</asp:ListItem>
         </asp:DropDownList>
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

    <div class="col productidHeader">
        Product ID
    </div>
  
       <div class="col prodImageHeader">
      
    </div>
        
    <div class="col nameHeader">
        Product Name
    </div>

     <div class="col statusHeader">
     Status
 </div>

    <div class="col priceHeader">
        Price (RM)
    </div>

<div class="col genderHeader">
    Gender
</div>

    <div class="col categoryHeader">
        Category
    </div>
              <div class="col actionBtnHeader">
                  <asp:Button ID="actionBtnNone" class="" runat="server" Text="Button" Visible="False" />
</div>
        </div>
        <hr />


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

   <div class="col stat inStock">
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
      <hr />

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

     <div class="col stat lowInStock">
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
     <hr />

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
     <hr />

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
     <hr />

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
    <hr />

</div>









</div>
    
    <footer>

        
        <script src="../Javascript/test.js"></script>

      

    </footer>
</asp:Content>
