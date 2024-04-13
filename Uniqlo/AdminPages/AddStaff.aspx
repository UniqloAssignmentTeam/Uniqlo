<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Uniqlo.AdminPages.AddStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


                <header>
            <link href="../css/addProduct.css" rel="stylesheet" />
        </header>


        <style>
            .Body {
                max-width: 1100px;
                position: relative;
                margin: auto;
            }
            .modal-content {
        background-color: #fefefe;
        margin: 5% auto; /* 5% from the top and centered */
        padding: 10px 20px 20px 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
        border-radius: 5px;
        margin-bottom: 120px;
    }


            .product-name{
               
                border:1px solid black;
               padding-left:400px;
            }
           .imgimput{
               display:flex;
               flex-direction:column;
               margin-left:0px;
           }
           .sizeQtyTable{
               border:1px solid black;
               width:100%;

           }
           th,td{
               border:1px solid black;
           }
          .product-content{
              display:flex;
              flex-direction:column;
              align-content:center;
              padding-left:230px;
          }

        </style>


        <div class="Body">
            <div class="container">
                 <div class = "productItemCard">
    <h2 class = "product-title product-name">Uniqlo Add Staff</h2>
 </div>
          <div class="modal-content">



                <div class = "product-content">
                       <div class="form-group">
      <span>Staff Name</span>
      <input class="form-field" type="text" >
   </div>

                   <div class="form-group">
                      <span>Gender</span>
<div class="dropdown-container" onclick="toggleDropdown('dropdownList1', 'dropdownDisplay1')">
 <div class="dropdown-display" id="dropdownDisplay1">Gender</div>
<div class="dropdown-list" id="dropdownList1">
  <div onclick="selectOption('Male', 'dropdownDisplay1')">Male</div>
  <div onclick="selectOption('Female', 'dropdownDisplay1')">Female</div>
</div>
                   </div>
                        </div>


                     <div class="form-group">
    <span>Role</span>
      <div class="dropdown-display" id="dropdownDisplay">Status</div>
  <div class="dropdown-list" id="dropdownList">
    <div onclick="selectOption('Admin', 'dropdownDisplay')">Admin</div>
    <div onclick="selectOption('Manager', 'dropdownDisplay')">Manager</div>
  </div>
</div>

 
                

                                         <div class="form-group">
   <span>Contact No</span>
   <input class="form-field" type="text" >
</div>
                                <div class="form-group">
   <span>E-mail</span>
   <input class="form-field" type="text" >
</div>           
                    
                                    
</div>
              
                <div  class="product-add">Add Staff</div>
   
    </div>


       

                   </div>

                 </div>





        <footer>



  
        <script src="../Javascript/productAdminDDL.js"></script>
            </footer>


</asp:Content>
