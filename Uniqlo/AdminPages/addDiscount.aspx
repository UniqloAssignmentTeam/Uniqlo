<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.addDiscount" %>
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
    <h2 class = "product-title product-name">Uniqlo Add Discount</h2>
 </div>
          <div class="modal-content">



                <div class = "product-content">
                       <div class="form-group">
      <span>Product ID</span>
      <input class="form-field" type="text" >
   </div>

                   <div class="form-group">
                      <span>Discount Price</span>
                      <input class="form-field" type="text" >
                   </div>

                     <div class="form-group">
    <span>Status</span>
      <div class="dropdown-display" id="dropdownDisplay">Status</div>
  <div class="dropdown-list" id="dropdownList">
    <div onclick="selectOption('Valid', 'dropdownDisplay')">Valid</div>
    <div onclick="selectOption('Invalid', 'dropdownDisplay')">Invalid</div>
  </div>
</div>

 
                

                      <div class="product-details-info">
                         <div class="form-group">
                            <span>Start Date</span>
                            <input class="form-field" type="date" >
                         </div>
                          <div class="form-group">
                        <span>End Date</span>
                        <input class="form-field" type="date" >
                        </div>
                      </div>
                       
                    
                                    
</div>
              
                <div  class="product-add">Add Product</div>
   
    </div>


       

                   </div>

                 </div>





        <footer>



  
        <script src="../Javascript/productAdminDDL.js"></script>
            </footer>





</asp:Content>
