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


     <div class="dropdown-wrapper">
<div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
  <div class="dropdown-display" id="dropdownDisplay">Status</div>
  <div class="dropdown-list" id="dropdownList">
    <div onclick="selectOption('In Stock', 'dropdownDisplay')">In Stock</div>
    <div onclick="selectOption('Low In Stock', 'dropdownDisplay')">Low In Stock</div>
    <div onclick="selectOption('No Stock', 'dropdownDisplay')">No Stock</div>
  </div>
</div>


<div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
  <div class="dropdown-display" id="dropdownDisplay2">Category</div>
  <div class="dropdown-list" id="dropdownList2">
    <div onclick="selectOption('Men', 'dropdownDisplay2')">Men</div>
    <div onclick="selectOption('Women', 'dropdownDisplay2')">Women</div>
    <div onclick="selectOption('Kids', 'dropdownDisplay2')">Kids</div>
  </div>
</div>

       </div>













     <div class="btnExcel-Add">
      
          <asp:Button ID="btnExcelExport" runat="server" Text="Export" CssClass="excel-export" ToolTip="Export To Excel" />  
         <asp:Button ID="btnAddProduct" runat="server" Text="➕ Add Product" CssClass="product-add" ToolTip="Add Product" />

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
       <img src="../Images/uniqloKidsDresses.png" width="40" height="40" alt ="Product Image" Visible:"True" />
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
           
       


         <div class="col eclipse-container">
             <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />

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



    <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">

        <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
         <div class="eclipse-list" id="dropdownList3">
          <div onclick="showModal('viewMoreModalContainer')">View More</div>
        <div onclick="showModal('updateModalContainer')">Update</div>
        <div onclick="showModal('deleteModalContainer')">Delete</div>
       </div>
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

    <div class="col eclipse-container">

    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
   
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

             <div class="col eclipse-container">

   <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
  
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

               <div class="col eclipse-container">

   <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
  
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

         




        <div class="pagination">
    <button class="page-btn" onclick="goToNextPage()">Next Page</button>
</div>








<div id="updateModalContainer" class="modal">


    <div class="modal-content">
        <span class="close" onclick="closeModal('updateMoreModalContainer')">&times;</span>
           <div class = "card-wrapper">
      <div class = "productItemCard">
        <!-- card left -->
        <div class = "product-imgs">
          <div class = "img-display">
            <div class = "img-showcase">
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
            </div>
          </div>


          <div class = "img-select">
            <div class = "img-item">
              <a href = "#" data-id = "1">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "2">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "3">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "4">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
              </a>
            </div>
          </div>
        </div>







        <!-- card right -->
        <div class = "product-content">
          <h2 class = "product-title product-name">Red Top</h2>
          

         

          <div class = "product-detail">

            <div class="product-details-info"> 
      <div class="product-details-head">
      Item Description:
      </div> 
      <div class="product-details-items">
    Item Description Here!
      </div>
   </div>
            

              <div class="product-details-info">




                  <div class="product-details-head">
                 
                     Product ID: 
                   </div>
                 <div class="product-details-items">
                     1001
                  </div>
                    </div>



                
               <div class="product-details-info">
                   <div class="product-details-head"> Current Price:</div>
                   <div class="product-details-items">  RM 59.90</div>  
                  </div>
             
             
               <div class="product-details-info">
                    <div class="product-details-head">
                     Available:
                    </div>
                    <div class="product-details-items"> In Stock</div> 
              </div>

           
               <div class="product-details-info">
                   <div class="product-details-head">
                       Category: 
                   </div>
                    <div class="product-details-items">Tops</div>
                 
              </div>
           

             
              <div class="product-details-info">
                   <div class="product-details-head">
                    Gender:
                    </div>
                    <div class="product-details-items"> Female</div>
                 </div>
            
            
          
          </div>




          

          <div class="productQtySizeSection">

              <div class="quantityHeader">QUANTITY</div> 
  


             
                  <div class="purchase-size-item">



                    <div class="purchase-size">

                   <div class="purchase-size-size">
                     S:
                    </div>

                    <div class="purchase-size-qty">
                     100
                    </div>

                    </div>




                      <div class="purchase-size">
                          <div class="purchase-size-size">
                            M:
                        </div>

                          <div class="purchase-size-qty"> 100</div>
                      </div>
                    


                      <div class="purchase-size">
                          <div class="purchase-size-size">
                            L:
                            </div>
                          <div class="purchase-size-qty">
                              100
                          </div>
                      </div>


                      <div class="purchase-size">
                           
                          <div class="purchase-size-size">
                             XL: 
                          </div>
                          <div class="purchase-size-qty"> 100 </div>

                      </div>
                   

                   
                 </div>
                  </div>
              </div>

          </div>
          
       
        </div>
      </div>
    </div>
  

        </div>
     </div>

    

<div id="viewMoreModalContainer" class="modal">


    <div class="modal-content">
        <span class="close" onclick="closeModal('viewMoreModalContainer')">&times;</span>
           <div class = "card-wrapper">
      <div class = "productItemCard">
        <!-- card left -->
        <div class = "product-imgs">
          <div class = "img-display">
            <div class = "img-showcase">
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
            </div>
          </div>


          <div class = "img-select">
            <div class = "img-item">
              <a href = "#" data-id = "1">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "2">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "3">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
              </a>
            </div>
            <div class = "img-item">
              <a href = "#" data-id = "4">
                  <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
              </a>
            </div>
          </div>
        </div>







        <!-- card right -->
        <div class = "product-content">
          <h2 class = "product-title product-name" id="modalProductName">Red Top</h2>
          

         

          <div class = "product-detail">

            <div class="product-details-info"> 
      <div class="product-details-head">
      Item Description:
      </div> 
      <div class="product-details-items">
    Item Description Here!
      </div>
   </div>
            

              <div class="product-details-info">




                  <div class="product-details-head">
                 
                     Product ID: 
                   </div>
                 <div class="product-details-items">
                     1001
                  </div>
                    </div>



                
               <div class="product-details-info">
                   <div class="product-details-head"> Current Price:</div>
                   <div class="product-details-items">  RM 59.90</div>  
                  </div>
             
             
               <div class="product-details-info">
                    <div class="product-details-head">
                     Available:
                    </div>
                    <div class="product-details-items"> In Stock</div> 
              </div>

           
               <div class="product-details-info">
                   <div class="product-details-head">
                       Category: 
                   </div>
                    <div class="product-details-items">Tops</div>
                 
              </div>
           

             
              <div class="product-details-info">
                   <div class="product-details-head">
                    Gender:
                    </div>
                    <div class="product-details-items"> Female</div>
                 </div>
            
            
          
          </div>




          

          <div class="productQtySizeSection">

              <div class="quantityHeader">QUANTITY</div> 
  


             
                  <div class="purchase-size-item">



                    <div class="purchase-size">

                   <div class="purchase-size-size">
                     S:
                    </div>

                    <div class="purchase-size-qty">
                     100
                    </div>

                    </div>




                      <div class="purchase-size">
                          <div class="purchase-size-size">
                            M:
                        </div>

                          <div class="purchase-size-qty"> 100</div>
                      </div>
                    


                      <div class="purchase-size">
                          <div class="purchase-size-size">
                            L:
                            </div>
                          <div class="purchase-size-qty">
                              100
                          </div>
                      </div>


                      <div class="purchase-size">
                           
                          <div class="purchase-size-size">
                             XL: 
                          </div>
                          <div class="purchase-size-qty"> 100 </div>

                      </div>
                   

                   
                 </div>
                  </div>
              </div>

          </div>
          
       
        </div>
      </div>
    </div>
  

        </div>
     </div>






    </div>

    
    <footer>

        <script src="../Javascript/productBtnEclipse.js"></script>
        <script src="../Javascript/productAdminDDL.js"></script>
       
      

    </footer>
</asp:Content>
