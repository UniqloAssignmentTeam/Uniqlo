<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Uniqlo.AdminPages.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../css/Admin/adminProduct.css" rel="stylesheet" />
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
      <h2>UNIQLO PRODUCT MANAGEMENT</h2>
      <div class="crudProduct">
         <div class="wrap-items-search-buttons">
            <div class="search">
               <span class="material-symbols-outlined">search</span>
               <input class="search-input" type="search" placeholder="Search" />
            </div>
            <div class="dropdown-wrapper">
             
     <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
         <div class="dropdown-display" id="dropdownDisplay">Category</div>
         <div class="dropdown-list" id="dropdownList">
             <div onclick="selectOption('Tops', 'dropdownDisplay')">Tops</div>
             <div onclick="selectOption('Bottom', 'dropdownDisplay')">Bottoms</div>
         </div>
     </div>
               <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                  <div class="dropdown-display" id="dropdownDisplay2">Gender</div>
                  <div class="dropdown-list" id="dropdownList2">
                     <div onclick="selectOption('Men', 'dropdownDisplay2')">Men</div>
                     <div onclick="selectOption('Women', 'dropdownDisplay2')">Women</div>
                     <div onclick="selectOption('Kids', 'dropdownDisplay2')">Kids</div>
                  </div>
               </div>
            </div>
            <div class="btnExcel-Add">
               <button class="excel-export" >Export</button>
               <div  class="product-add"><a href="AddProduct.aspx" style="color: #6F6F6F; text-decoration: none; font-size: 1rem; font-weight: bold;">➕ Add Product</a></div>
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
               Category
            </div>
            <div class="col price">
               Price 
            </div>
            <div class="col gender">
               Gender
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
              AIRism Cotton Jersey Short Sleeve Skipper Polo Shirt
            </div>
            <div class="col wear">
              Top
            </div>
            <div class="col price">
               99.90
            </div>
            <div class="col gender">
               Men
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
               2
            </div>
           
            <div class="col name">
               Miracle Air Pants (Cotton Like)
            </div>
             <div class="col wear">
   Bottom
</div>
              <div class="col price">
    99.00
 </div>
            
           
            <div class="col gender">
               Men
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
               Hello Kitty 50th Anniversary AIRism Easy Short
            </div>
             <div class="col wear">
   Bottom
</div>
             <div class="col price">
   59.90
</div>
            
            
            <div class="col gender">
               Women
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
               AIRism UV Protection High Neck Long Sleeve T-Shirt
            </div>
             <div class="col wear">
   Top
</div>
             <div class="col price">
   59.90
</div>
            
            
            <div class="col gender">
               Women
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
               Waffle Crew Neck Long Sleeve T-Shirt
            </div>
             <div class="col wear">
   Top
</div>
             <div class="col price">
   112.00
</div>
            
            
            <div class="col gender">
               Men
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


        <!--DELETE CONFIRMATION-->
        <div id="id01" class="confirmationModal">
            <div class="confirmation-modal-content">
                <div class="confirmationContainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
                    <h1>Remove Product</h1>
                    <p>Are you sure you want to remove this product?</p>

                    <div class="confirmationClearFix">
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationDeletebtn">Remove</button>
                    </div>
                </div>
            </div>
        </div>
       <!--DELETE CONFIRMATION END-->
  
   </div>
 
   
   <footer>
       <script src="../../Javascript/Pagination.js"></script>
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