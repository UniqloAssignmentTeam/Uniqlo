    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Uniqlo.AdminPages.AddProduct" %>
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
           }
           .sizeQtyTable{
               border:1px solid black;
               width:100%;

           }
           th,td{
               border:1px solid black;
           }
           
           
        </style>


        <div class="Body">
            <div class="container">
                 <div class = "productItemCard">
    <h2 class = "product-title product-name">Uniqlo Add Product</h2>
 </div>
          <div class="modal-content">



                <div class = "product-content">


                   <div class="form-group">
                      <span>Product Name</span>
                      <input class="form-field" type="text" >
                   </div>

                   <div class = "product-detail">
                      <div class="form-group">
                         <span>Description    </span>   
                         <textarea class="form-field" rows="4" cols="50"></textarea> 
                      </div>

                      <div class="product-details-info">
                         <div class="form-group">
                            <span>Price</span>
                            <input class="form-field" type="text" >
                         </div>
                      </div>
                        <div class="product-details-info">
    <div class="form-group">
       <span>Category</span>
        <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
   <div class="dropdown-display" id="dropdownDisplay2">Category</div>
   <div class="dropdown-list" id="dropdownList2">
      <div onclick="selectOption('Men', 'dropdownDisplay2')">Men</div>
      <div onclick="selectOption('Women', 'dropdownDisplay2')">Women</div>
      <div onclick="selectOption('Kids', 'dropdownDisplay2')">Kids</div>
   </div>
</div>
    </div>
    </div>
 </div>

<div class="upload-image-section">
    <div class="form-group">
     <span>Upload Image</span>
        <div class="imgimput">
    <input type="file" id="uploadImage1" name="uploadImage1">
         <input type="file" id="uploadImage2" name="uploadImage2">
         <input type="file" id="uploadImage3" name="uploadImage3">
         <input type="file" id="uploadImage4" name="uploadImage4">
            </div>
  </div>
     </div>                
               
                    


                                           <div class="add-color-section">
                                                 <div class="form-group">
     <span>Color</span>
    <input type="text" id="newColorInput" placeholder="New color">
                                                      <button id="addColorButton">Add color</button>
  </div>
   
  
</div>

<!-- Table for color, size, and quantity -->
<div id="colorTablesContainer"></div>







                      </div>
                    
                            
                               
                            

                      
                      

                   </div>
               
                </div>





           



             </div>
    


        <footer>

<script>
    // Function to create a new table for a color
    function createColorTable(color) {
        var tableHtml = `
            <h2>${color}</h2>
            <table class="sizeQtyTable">
                <thead>
                    <tr>
                       <th>Size</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>  <div class="form-group">
                             <span style="padding-right:25px;">S</span>
                                 </div></td>
                        <td><input type="number" class="form-field" placeholder="Quantity"></td>
                    </tr>
                    <tr>
                        <td><div class="form-group">
                             <span>M</span>
                                 </div></td>
                        <td><input type="number" class="form-field" placeholder="Quantity"></td>
                    </tr>
                    <tr>
                        <td><div class="form-group">
                             <span>L</span>
                                 </div></td>
                        <td><input type="number" class="form-field" placeholder="Quantity"></td>
                    </tr>
                    <tr>
                        <td><div class="form-group">
                             <span>XL</span>
                                 </div></td>
                        <td><input type="number" class="form-field" placeholder="Quantity"></td>
                    </tr>
                   
                </tbody>
            </table>
        `;
        return tableHtml;
    }

    // Event listener for the "Add color" button
    document.getElementById('addColorButton').addEventListener('click', function (event) {
        event.preventDefault(); // Prevent default form submission behavior
        var newColorInput = document.getElementById('newColorInput');
        var color = newColorInput.value.trim(); // Get the entered color value
        if (color !== '') {
            var colorTablesContainer = document.getElementById('colorTablesContainer');
            // Create a new table for the entered color
            var newColorTable = document.createElement('div');
            newColorTable.innerHTML = createColorTable(color);
            // Append the new table to the container
            colorTablesContainer.appendChild(newColorTable);
            // Clear the input field
            newColorInput.value = '';
        } else {
            alert('Please enter a color.');
        }
    });


    

</script>
        <script src="../Javascript/productAdminDDL.js"></script>
            </footer>
    </asp:Content>
