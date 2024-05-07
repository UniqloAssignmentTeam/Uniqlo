<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Uniqlo.AdminPages.AddProduct" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
        <header>
            <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
        </header>
        <style>
          
        </style>
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO ADD PRODUCT</h2>
        </div>
        <div class="modal-content">
            
            

            <div class="product-content">
                <div class="form-group">
                    <asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                    <asp:TextBox ID="txtDescription" CssClass="form-field" TextMode="MultiLine" runat="server" Rows="4" Columns="50"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="txtPrice" CssClass="form-field" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>

                    <asp:Panel ID="Panel1" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-display" >
                            <asp:ListItem Text="Tops" Value="Top" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Bottoms" Value="Bottom"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>

                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>

                    <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display" >
                            <asp:ListItem Text="Men" Value="M" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Women" Value="W"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblColor" runat="server" Text="Color"></asp:Label>
                    <asp:TextBox ID="newColorInput" runat="server"></asp:TextBox>
                    <asp:Button ID="addColorButton" runat="server" Text="Add color" CssClass="addColor-button"/>
                </div>
            </div>

            <asp:Panel ID="colorTablesContainer" runat="server"></asp:Panel>
            <asp:HiddenField ID="HiddenFieldData" runat="server" />



            <div class="button-container">
                <div class="cancel-div">
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" PostBackUrl="~/AdminPages/AdminProduct/Product.aspx" />
                </div>
                <div class="continue-div">
                    <asp:Button ID="addButton" runat="server" Text="Add" CssClass="continue-button" OnClick="addButton_Click"/>
                </div>
            </div>
        </div>
    </div>
     
            

        <footer>
        <script>
            // Function to create a new table for a color
            var colorId = 0;

            function createColorTable(color) {
                colorId++;  // Increment to get a unique ID for each color table
                var tableHtml = `
                <div class="color-table-wrapper" id="colorTable${colorId}">
                    <table class="sizeQtyTable">
                        <thead>
                            <tr>
                                <th><h2>${color}</h2> <input type="hidden" id="colorName${colorId}" value="${color}" /></th>
                                <th><button type="button" class="addColor-button" onclick="updateHiddenField(this)">Save</button></th>
                                <th><button type="button" class="addColor-button" onclick="deleteColorTable(this)">Delete</button></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="sizeS${colorId}">S</label>
                                        <input type="number" id="sizeS${colorId}" class="form-field" placeholder=""/>
                                    </div>
                                </td>                                
                                <td>
                                    <div class="form-group">
                                        <label for="sizeM${colorId}">M</label>
                                        <input type="number" id="sizeM${colorId}" class="form-field" placeholder=""/>
                                    </div>
                                </td>                                
                                <td>
                                    <div class="form-group">
                                        <label for="sizeL${colorId}">L</label>
                                        <input type="number" id="sizeL${colorId}" class="form-field" placeholder=""/>
                                    </div>
                                </td>                                
                                <td>
                                    <div class="form-group">
                                        <label for="sizeXL${colorId}">XL</label>
                                        <input type="number" id="sizeXL${colorId}" class="form-field" placeholder=""/>
                                    </div>
                                </td>
                                <td>
                                    <div class="image-gallery">
                                        <div class="image-box">
                                            <div class="add-image">
                                                <label for="fileInput${colorId}">Upload Image</label>
                                                <input type="file" id="fileInput${colorId}" name="fileInput${colorId}" class="form-field"/>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>`;
                return tableHtml;
            }

            // Function to delete a color table
            function deleteColorTable(button) {
                var colorTableWrapper = button.closest('.color-table-wrapper');
                if (colorTableWrapper) {
                    colorTableWrapper.remove(); 
                    updateHiddenField();  
                }
            }


            //function to add new row for the table
            document.getElementById('<%= addColorButton.ClientID %>').addEventListener('click', function (event) {
                event.preventDefault();
                var newColorInput = document.getElementById('<%= newColorInput.ClientID %>');
                var color = newColorInput.value.trim();
                if (color !== '') {
                    var colorTablesContainer = document.getElementById('<%= colorTablesContainer.ClientID %>');
                    var newColorTable = document.createElement('div');
                    newColorTable.innerHTML = createColorTable(color);
                    colorTablesContainer.appendChild(newColorTable);
                    newColorInput.value = '';
                } else {
                    alert('Please enter a color.');
                }
            });




            //update the hidden field with a list of color, quantity and size
            function updateHiddenField(button) {
                var data = [];
                var colorTables = document.querySelectorAll('.color-table-wrapper');
                var totalFilesToRead = colorTables.length;
                var readFilesCount = 0;  // Counter to keep track of the number of processed files

                colorTables.forEach(function (table, index) {
                    var colorName = table.querySelector('input[type="hidden"]').value;
                    var sizeS = table.querySelector('input[id^="sizeS"]').value;
                    var sizeM = table.querySelector('input[id^="sizeM"]').value;
                    var sizeL = table.querySelector('input[id^="sizeL"]').value;
                    var sizeXL = table.querySelector('input[id^="sizeXL"]').value;
                    var fileInput = table.querySelector('input[type="file"]');

                    // Function to handle the file reading and data aggregation
                    function handleFileRead(base64String) {
                        data.push({
                            Color: colorName,
                            SizeS: sizeS,
                            SizeM: sizeM,
                            SizeL: sizeL,
                            SizeXL: sizeXL,
                            Image: base64String
                        });
                        readFilesCount++;  // Increment the counter after each file read

                        // Check if all files have been processed
                        if (readFilesCount === totalFilesToRead) {
                            var jsonStr = JSON.stringify(data);
                            document.getElementById('<%= HiddenFieldData.ClientID %>').value = jsonStr;
                            console.log("Updated Hidden Field Data:", jsonStr);
                        }
                    }

                    if (fileInput.files.length > 0) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            handleFileRead(e.target.result);
                        };
                        reader.readAsDataURL(fileInput.files[0]);
                    } else {
                        handleFileRead(''); // Handle case where no file is selected
                    }
                });
            }





        </script>

        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>
</asp:Content>