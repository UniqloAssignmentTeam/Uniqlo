<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Uniqlo.AdminPages.Staff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">




        <link href="../css/productAdmin.css" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
           <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
    <style>
        .dropdown-wrapper{
            margin-left:-24px;
        }
        .inStock{
            color:black;
        }
        .lowInStock{
            color:black;
        }

        /* Float cancel and delete buttons and add an equal width */
        .confirmationCancelbtn, .confirmationDeletebtn {
          float: left;
          width: 50%;
        }

        /* Add a color to the cancel button */
        .confirmationCancelbtn {
          background-color: #ccc;
          color: black;
        }

        /* Add a color to the delete button */
        .confirmationDeletebtn {
          background-color: #f44336;
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
          z-index: 1; /* Sit on top */
          left: 0;
          top: 0;
          width: 100%; /* Full width */
          height: 100%; /* Full height */
          overflow: auto; /* Enable scroll if needed */
          background-color: #474e5d;
          padding-top: 50px;
        }

        /* Modal Content/Box */
        .confirmation-modal-content {
          background-color: #fefefe;
          margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
          border: 1px solid #888;
          width: 80%; /* Could be more or less, depending on screen size */
        }

        /* Style the horizontal ruler */
        hr {
          border: 1px solid #f1f1f1;
          margin-bottom: 25px;
        }
 
        /* The Modal Close Button (x) */
        .confirmationClose {
          position: absolute;
          right: 35px;
          top: 15px;
          font-size: 40px;
          font-weight: bold;
          color: #f1f1f1;
        }

        .confirmationClose:hover,
        .confirmationClose:focus {
          color: #f44336;
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
    <div class="productBody">

 <h2>Staff</h2>

       

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


<div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
  <div class="dropdown-display" id="dropdownDisplay2">Role</div>
  <div class="dropdown-list" id="dropdownList2">
    <div onclick="selectOption('Admin', 'dropdownDisplay2')">Admin</div>
    <div onclick="selectOption('Manager', 'dropdownDisplay2')">Admin Manager</div>
  </div>
</div>

       </div>




     <div class="btnExcel-Add">
      
       <button class="excel-export" style="color: #6F6F6F; font-size: 1rem; font-weight: 400;">Export</button>
        

         
       <a href="AddStaff.aspx" style="color: #6F6F6F; text-decoration: none;"><div  class="product-add">➕ Add Staff</div></a>
     
            </div>

     

</div>




</div>







<div class="table">

   <!--Header-->
    <div class="row">

    <div class="col productid">
        Staff ID
    </div>
  
      
        
    <div class="col name">
        Staff Name
    </div>

     <div class="col status">
     Gender
 </div>

    <div class="col price">
        Role
    </div>

<div class="col gender">
    Contact No
</div>

    <div class="col category">
        Email
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
     Janice Lee Jia Minn
      </div>

   <div class="col inStock">
   Female
 </div>

  <div class="col price">
      Manager
  </div>
  <div class="col gender">
    019111111
</div>
  <div class="col category">
      janiceljm-pm21@gmail.com
  </div>



    <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">

        <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
         <div class="eclipse-list" id="dropdownList3">
        <div onclick="showModal('updateModalContainer')">Update</div>
        <div><a href="#" onclick="document.getElementById('id01').style.display='block'">Delete</a></div>
       </div>
     </div>
  


      </div>


    <!--Product 2-->
     <div class="row">

 <div class="col productid">
      1002
 </div>

  

 <div class="col name">
     Jeffer Ooi Zhe Feng
 </div>

     <div class="col lowInStock">
    Male
 </div>

 <div class="col price">
   Admin
 </div>
   <div class="col gender">
    0191111111
</div>
 <div class="col category">
     jefferozf-pm21@gmail.com
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
     Oh Beng Yee
 </div>

   <div class="col stat inStock">
    Male
</div>

 <div class="col price">
    Admin
 </div>
   <div class="col gender">
    0191111111
</div>
 <div class="col category">
     ohby-pv21@gmail.com
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
     Tan Chee Han
      </div>

  <div class="col stat inStock">
     Male
 </div>

 <div class="col price">
     Admin
 </div>
   <div class="col gender">
    0191111111
</div>
 <div class="col category">
      tanch-pm21@gmail.com
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
    Yip Yong
</div>

      <div class="col lowInStock">
     Male
 </div>

<div class="col price">
    Admin
</div>
          <div class="col gender">
    019111111
</div>
<div class="col category">
  yipy-pm21@gmail.com
</div>

           
    <div class="col eclipse-container">

    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
   
 </div>
    </div>
    

</div>

         




        <div class="viewMoreSection">
            <   1..10  >
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
          <h2 class = "product-title product-name">Staff Update</h2>
          
          <div class = "product-detail">


              <div class="product-details-info">

     <div class="form-group">
    <span>Staff ID:</span>
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


        <!--DELETE CONFIRMATION-->
        <div id="id01" class="confirmationModal">
          <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
          <div class="confirmation-modal-content">
            <div class="confirmationContainer">
              <h1>Delete Account</h1>
              <p>Are you sure you want to delete your account?</p>
    
              <div class="confirmationClearFix">
                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationDeletebtn">Delete</button>
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
