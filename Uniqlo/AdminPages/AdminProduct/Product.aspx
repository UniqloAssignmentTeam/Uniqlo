<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
       <link href="../../css/productAdmin.css" rel="stylesheet" />
       <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
       <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <style>
            .confirmationClearFix{
                width: 100%;
                margin-top: 90px;
            }

            /* Add a color to the cancel button */
            .confirmationCancelbtn, .confirmationDeletebtn {
                border: 2px solid black;
                padding: 20px 150px 20px 150px;
                background: none;
                outline: none;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease;
                width: 100%;
                text-decoration: none;
                color: black;
                width: calc((100% / 2) - 20px);
    
            }

            .confirmationDeletebtn:hover, 
            .confirmationCancelbtn:hover {
                background-color: black;
                color: white;
            }             
   

            /* Add padding and center-align text to the container */
            .confirmationContainer {
              padding: 16px;
              text-align: center;
            }

            /* The Modal (background) */
            .confirmationModal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 2; /* Sit on top */
              left: 0;
              top: 0;
              width: 100%; /* Full width */
              height: 100%; /* Full height */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
              padding-top: 50px;
              margin-top: 100px;
            }

            /* Modal Content/Box */
            .confirmation-modal-content {
              background-color: #fefefe;
              margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
              border: 1px solid #888;
              width: 80%; /* Could be more or less, depending on screen size */
              height: 400px;
            }


            .confirmation-modal-content h1{
                margin-top: 60px;
            }

            .confirmation-modal-content p{
                margin-top: 30px;
            }
 
            /* The Modal Close Button (x) */
            .confirmationClose {
              float: right;
              font-size: 40px;
              font-weight: bold;
              color: #f1f1f1;
            }

            .confirmationClose:hover,
            .confirmationClose:focus {
              color: black;
              cursor: pointer;
            }

            /* Clear floats */
            .confirmationClearFix::after {
              content: "";
              clear: both;
              display: table;
            }

            /* Change styles for cancel button and delete button on extra small screens */
            @media screen and (max-width: 300px) {
              .confirmationCancelbtn, .confirmationDeletebtn {
                 width: 100%;
              }
            }
        </style>
    </header>

   <div class="productBody">
      <h2>UNIQLO PRODUCT</h2>
      <div class="crudProduct">
         <div class="wrap-items-search-buttons">
            <div class="search">
               <span class="material-symbols-outlined">search</span>
               <input class="search-input" type="search" placeholder="Search" />
            </div>
            <div class="dropdown-wrapper">
             
     <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
         <div class="dropdown-display" id="dropdownDisplay">Wear</div>
         <div class="dropdown-list" id="dropdownList">
             <div onclick="selectOption('Tops', 'dropdownDisplay')">Tops</div>
             <div onclick="selectOption('Bottom', 'dropdownDisplay')">Bottom</div>
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
               <button class="excel-export" style="color: #6F6F6F; font-size: 1rem; font-weight: 400;">Export</button>
               <div  class="product-add"><a href="AddProduct.aspx" style="color: #6F6F6F; text-decoration: none; font-size: 1rem; font-weight: 400;">➕ Add Product</a></div>
            </div>
         </div>
      </div>
      <div class="table">
         <!--Header-->
         <div class="row">
            <div class="col productid">
               Product ID
            </div>
           
            <div class="col name">
               Product Name
            </div>
            <div class="col wear">
               Wear
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
            
            <div class="col name">
               Product Name   Product
            </div>
            <div class="col wear">
              Tops
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
                  <div><a href="viewMoreProduct.aspx" style="color: #6F6F6F; text-decoration: none;">View More</a></div>
                  <div><a href="UpdateProduct.aspx" style="color: #6F6F6F; text-decoration: none;">Update</a></div>
                  <div onclick="document.getElementById('id01').style.display='block'">Delete</div>
               </div>
            </div>
         </div>
          

         <!--Product 2-->
         <div class="row">
            <div class="col productid">
               1002
            </div>
           
            <div class="col name">
               Product Name
            </div>
            <div class="col wear">
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
          
            <div class="col name">
               Product Name
            </div>
            <div class="col wear">
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
           
            <div class="col name">
               Product Name
            </div>
            <div class="col wear">
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
           
            <div class="col name">
               Product Name
            </div>
            <div class="col wear">
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
            <div class="col eclipse-container">
               <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
            </div>
         </div>
      </div>
      
        <div class="viewMoreSection">
            <   1..10  >
        </div>

        <!--DELETE CONFIRMATION-->
        <div id="id01" class="confirmationModal">
            <div class="confirmation-modal-content">
                <div class="confirmationContainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
                    <h1>Delete Account</h1>
                    <p>Are you sure you want to delete your account?</p>

                    <div class="confirmationClearFix">
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationDeletebtn">Delete</button>
                    </div>
                </div>
            </div>
        </div>
       <!--DELETE CONFIRMATION END-->
  
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
                  <div class="viewProductQtySizeSection">
                     <div class="quantityHeader">QUANTITY</div>
                      <div class="color-radio">
    <!-- Radio buttons -->
    <input type="radio" id="red" name="color" value="red">
    <label for="red"></label>

    <input type="radio" id="green" name="color" value="green">
    <label for="green"></label>

    <input type="radio" id="blue" name="color" value="blue">
    <label for="blue"></label>
</div>
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
   
   <footer>
      <script src="../../Javascript/productBtnEclipse.js"></script>
      <script src="../../Javascript/productAdminDDL.js"></script>
        <script>
            document.getElementById('addColorButton').addEventListener('click', function () {
                var productQtySizeSection = document.querySelector('.productQtySizeSection');
                // Show the section when the button is clicked
                productQtySizeSection.style.display = 'block';
            });
        </script>
   </footer>
</asp:Content>