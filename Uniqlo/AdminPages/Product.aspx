<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/productAdmin.css" rel="stylesheet" />
    <div class="productBody">
       
 <h2>Product</h2>
 <div class="wrap-items-search-buttons">
     <div class="search">
        <span class="material-symbols-outlined">search</span>
         <input class="search-input" type="search" placeholder="Search" />
     </div>


      


     <div class="size-group">
         <asp:DropDownList ID="ddlSize" runat="server">
         <asp:ListItem>L</asp:ListItem>
         <asp:ListItem>M</asp:ListItem>
         <asp:ListItem>S</asp:ListItem>
         </asp:DropDownList>
    </div>



       
     <div class="export-product-add">
            <div class="export-excel">
         <asp:Button ID="btnExport" runat="server" Text="Button" />
            </div>

            <div class="product-add">
         <asp:Button ID="btnAddProduct" runat="server" Text="Button" />
             </div>

</div>


</div>


<div class="table">
   <!--Header-->
    <div class="row">

    <div class="col productid">
        Product ID
    </div>
         <hr />
       <div class="col prodImage">
      <img src="" alt="" />
    </div>
        
    <div class="col Name">
        Product Name
    </div>
        
    <div class="col price">
        Price(RM)
    </div>
      <hr />
    <div class="col category">
        Category
    </div>
        </div>
        <hr />


       <!--Product 1-->
  <div class="row">

  <div class="col productid">
      1001
  </div>
     <div class="col prodImage">
  <img src="../Images/uniqloKidsDresses.png" alt="Product Image" />
</div>
  <div class="col Name">
      Product Name
  </div>
   
  <div class="col price">
      100.00
  </div>
  
  <div class="col category">
      Category
  </div>
      </div>
      <hr />

    <!--Product 2-->
     <div class="row">

 <div class="col productid">
      1002
 </div>
   <div class="col prodImage">
    
</div>
 <div class="col Name">
     Product Name
 </div>
  
 <div class="col price">
     Price
 </div>
 
 <div class="col category">
     Category
 </div>
     </div>
     <hr />

    <!--Product 3-->
     <div class="row">

 <div class="col productid">
      1003
 </div>
   <div class="col prodImage">
    
</div>
 <div class="col Name">
     Product Name
 </div>
  
 <div class="col price">
     Price
 </div>
 
 <div class="col category">
     Category
 </div>
     </div>
     <hr />

    <!--Product 4-->
     <div class="row">

 <div class="col productid">
      1004
 </div>
   <div class="col prodImage">
    
</div>
 <div class="col Name">
     Product Name
 </div>
  
 <div class="col price">
     Price
 </div>
 
 <div class="col category">
     Category
 </div>
     </div>
     <hr />

       <!--Product 5-->
    <div class="row">

<div class="col productid">
    1005
</div>
   <div class="col prodImage">
    
</div>
<div class="col Name">
    Product Name
</div>
 
<div class="col price">
    Price
</div>

<div class="col category">
    Category
</div>
    </div>
    <hr />

</div>









</div>
    <div style="margin-bottom:500px;"></div>
    <footer>

        


        <script src="../Javascript/genderDDL.js"></script>

    </footer>
</asp:Content>
