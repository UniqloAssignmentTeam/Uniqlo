    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Uniqlo.AdminPages.AddProduct" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
        <style>
            .Body {
                max-width: 1100px;
                position: relative;
                margin: auto;
            }
            .modal-content {
        background-color: #fefefe;
        margin: 5% auto; /* 5% from the top and centered */
        padding: 80px 20px 20px 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
        border-radius: 5px;
        margin-bottom: 120px;
    }
            


        
        </style>
        <div class="Body">
               <div id="addProductModalContainer" class="modal">
          <div class="modal-content">
             <div class = "card-wrapper">
                <div class = "productItemCard">
                   <!-- card left -->
                   <h2 class = "product-title product-name">Uniqlo Add Product</h2>
                </div>
                <!-- card right -->
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
                  <span>Category    :</span>
                      <div class="product-details-info">
                         <select id="categoryDropdown">
        <option value="">Select a category</option>
        <option value="Men_Tshirt">Men_Tshirt</option>
        <option value="Women_Tshirt">Women_Tshirt</option>
        <option value="Women_Dress">Women_Dress</option>
        <!-- Add more options as needed -->
    </select>
                      </div>
                       <!-- Upload Image buttons -->
                            <div class="upload-image-section">
                                <label for="uploadImage1">Upload Image 1:</label>
                                <input type="file" id="uploadImage1" name="uploadImage1">
                                <br>
                                <label for="uploadImage2">Upload Image 2:</label>
                                <input type="file" id="uploadImage2" name="uploadImage2">
                                <br>
                                <label for="uploadImage3">Upload Image 3:</label>
                                <input type="file" id="uploadImage3" name="uploadImage3">
                                <br>
                                <label for="uploadImage4">Upload Image 4:</label>
                                <input type="file" id="uploadImage4" name="uploadImage4">
                                <br>
                            </div>

                       <div class="add-color-section">
   <input type="text" id="newColorInput" placeholder="New color">
   <button id="addColorButton">Add color</button>
</div>

<!-- Table for color, size, and quantity -->
<div id="colorTablesContainer"></div>
                      

                   </div>
               
                </div>
             </div>
          </div>
       </div>

        </div>

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
                        <td>S</td>
                        <td><input type="number" class="qty-field" placeholder="Quantity"></td>
                    </tr>
                    <tr>
                        <td>M</td>
                        <td><input type="number" class="qty-field" placeholder="Quantity"></td>
                    </tr>
                    <tr>
                        <td>L</td>
                        <td><input type="number" class="qty-field" placeholder="Quantity"></td>
                    </tr>
                    <tr>
                        <td>XL</td>
                        <td><input type="number" class="qty-field" placeholder="Quantity"></td>
                    </tr>
                    <!-- You can add more rows for additional sizes if needed -->
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
    </asp:Content>
