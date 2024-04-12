<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Discount.aspx.cs" Inherits="Uniqlo.AdminPages.Discount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


    

        <link href="../css/productAdmin.css" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
           <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
    <style>

        .dropdown-container{
            margin-left:-180px;
        }

    </style>
    <div class="productBody">

 <h2>Discount</h2>

       

<div class="crudProduct">




 <div class="wrap-items-search-buttons">
     <div class="search">
        <span class="material-symbols-outlined">search</span>
         <input class="search-input" type="search" placeholder="Search" />
     </div>


     <div class="dropdown-wrapper">
<div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
  <div class="dropdown-display" id="dropdownDisplay">Gender</div>
  <div class="dropdown-list" id="dropdownList">
    <div onclick="selectOption('Male', 'dropdownDisplay')">Male</div>
    <div onclick="selectOption('Female', 'dropdownDisplay')">Female</div>
  </div>
</div>



       </div>




     <div class="btnExcel-Add">
      
       <button class="excel-export">Export</button>
        


         <div  class="product-add" onclick="showModal('addProductModalContainer')">➕ Add Staff</div>
      

            </div>

     

</div>




</div>







<div class="table">

   <!--Header-->
    <div class="row">

    <div class="col productid">
        Discount ID
    </div>

    <div class="col name">
        Product ID
    </div>

     <div class="col status">
     Amount
 </div>

    <div class="col price">
        Status
    </div>

<div class="col gender">
    Start Date
</div>

    <div class="col category">
        End Date
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
        <div onclick="showModal('updateModalContainer')">Update</div>
        <div>Delete</div>
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
      jefferozf@gmail.com
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
  asdasd
</div>

           
    <div class="col eclipse-container">

    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
   
 </div>
    </div>
    

</div>

         




        <div class="pagination">
    <button class="page-btn" onclick="goToNextPage()">Next Page</button>
</div>








<div id="updateModalContainer" class="modal">


    <div class="modal-content">
        <span class="close" onclick="closeModal('updateModalContainer')">&times;</span>
           <div class = "card-wrapper">
      <div class = "productItemCard">
        <!-- card left -->
        <div class = "product-imgs">
          <div class = "img-display">
            <div class = "img-showcase">
                <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
            </div>
          </div>
        </div>







        <!-- card right -->
        <div class = "product-content">
          <h2 class = "product-title product-name">Discount Update</h2>
          
          <div class = "product-detail">


              <div class="product-details-info">

     <div class="form-group">
    <span>Discount ID:</span>
    <input class="form-field" type="text" disabled>
</div>

                    </div>





                
               <div class="product-details-info">
                       <div class="form-group">
    <span>Staff Name:</span>
    <input class="form-field" type="text">
</div>
                  </div>
             
             
               <div class="product-details-info">
                        <div class="form-group">
    <span>Gender:</span>
       <div class="dropdown-container" onclick="toggleDropdown('dropdownList6', 'dropdownDisplay6')">
  <div class="dropdown-display" id="dropdownDisplay8">Gender</div>
  <div class="dropdown-list" id="dropdownList8">
    <div onclick="selectOption('Male', 'dropdownDisplay')">Male</div>
    <div onclick="selectOption('Female', 'dropdownDisplay')">Female</div>
    
      </div>
</div>
</div>
              </div>

           
               <div class="product-details-info">
                      <div class="form-group">
    <span>Role:</span>
                           
    <div class="dropdown-container" onclick="toggleDropdown('dropdownList6', 'dropdownDisplay6')">
  <div class="dropdown-display" id="dropdownDisplay7">Status</div>
  <div class="dropdown-list" id="dropdownList7">
    <div onclick="selectOption('Admin', 'dropdownDisplay')">Admin</div>
    <div onclick="selectOption('Manager', 'dropdownDisplay')">Manager</div>
    
      </div>
</div>
                            </div>
</div>
                 
              </div>
           

             
              <div class="product-details-info">
                        <div class="form-group">
    <span>Contact No:</span>
    <input class="form-field" type="text" >
</div>
                 </div>
            
                          <div class="product-details-info">
                        <div class="form-group">
    <span>Email:</span>
    <input class="form-field" type="text" >
</div>
                 </div>
                                                   <div class="addProduct-restProduct">  
<div  class="addProductBtn"> Update</div>
         
            </div> 
          </div>


                               

          

              </div>
                             
          </div>
                    
       
        </div>
      </div>
    </div>
  
  
          

<div id="addProductModalContainer" class="modal">


    <div class="modal-content">
        <span class="close" onclick="closeModal('addProductModalContainer')">&times;</span>
           <div class = "card-wrapper">
      <div class = "productItemCard">
        <!-- card left -->
       <h2 class = "product-title product-name">Uniqlo Add Product</h2>

         </div>


        <!-- card right -->
        <div class = "product-content">
         

         

          <div class = "product-detail">


               <div class="product-details-info">
                       <div class="form-group">
    <span>Staff Name</span>
    <input class="form-field" type="text" >
</div>
                  </div>
             
             
               <div class="product-details-info">
                        <div class="form-group">
    <span>Gender:</span>
    <div class="dropdown-container" onclick="toggleDropdown('dropdownList6', 'dropdownDisplay6')">
  <div class="dropdown-display" id="dropdownDisplay6">Male</div>
  <div class="dropdown-list" id="dropdownList6">
    <div onclick="selectOption('Male', 'dropdownDisplay')">Male</div>
    <div onclick="selectOption('Female', 'dropdownDisplay')">Female</div>
      </div>
</div>
                            </div>
              </div>

           
               <div class="product-details-info">
                      <div class="form-group">
    <span>Category:</span>
         
<div class="dropdown-container" onclick="toggleDropdown('dropdownList5', 'dropdownDisplay5')">
  <div class="dropdown-display" id="dropdownDisplay5">Admin</div>
  <div class="dropdown-list" id="dropdownList5">
    <div onclick="selectOption('Admin', 'dropdownDisplay')">Admin</div>
    <div onclick="selectOption('Manager', 'dropdownDisplay')">Manager</div>
    
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
              
              <div class="product-details-info">
                        <div class="form-group">
    <span>Contact No:</span>
    <input class="form-field" type="text" >
</div>
                 </div>
            
                          <div class="product-details-info">
                        <div class="form-group">
    <span>Email:</span>
    <input class="form-field" type="text" >
</div>
                 </div>
        
               <div class="addProduct-restProduct">  
       <div  class="addProductBtn">Add Staff</div>
                <div  class="addProductBtn">Reset</div>
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
