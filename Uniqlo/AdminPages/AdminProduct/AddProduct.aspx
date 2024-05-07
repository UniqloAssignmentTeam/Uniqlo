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
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-display" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Text="Tops" Value="Tops"></asp:ListItem>
                            <asp:ListItem Text="Bottoms" Value="Bottoms"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>

                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>

                    <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Text="Men" Value="Men"></asp:ListItem>
                            <asp:ListItem Text="Women" Value="Women"></asp:ListItem>
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
                    <asp:Button ID="addButton" runat="server" Text="Add" CssClass="continue-button" PostBackUrl="~/AdminPages/AdminProduct/Product.aspx" OnClick="addButton_Click"/>
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
                                <th><button type="button" class="addColor-button" onclick="deleteColorTable(this)">Delete</button></th>
                                <th><button type="button" class="addColor-button" onclick="updateHiddenField(this)">Save</button></th>
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
                document.querySelectorAll('.color-table-wrapper').forEach(function (table, index) {
                    var colorName = table.querySelector('input[type="hidden"]').value;
                    var sizeS = table.querySelector('input[type="number"]').value;  // Assuming only one size for simplicity
                    var fileInput = table.querySelector('input[type="file"]');
                    var fileName = '';  // Default to empty string if no file is selected

                    // Check if a file is selected and extract the filename
                    if (fileInput.files.length > 0) {
                        fileName = fileInput.files[0].name;  // This gets just the name of the file, not the path
                    }

                    //console.log("Color Name:", colorName, "Size S:", sizeS, "Image:", fileName);  // Check what's being retrieved
                    data.push({ color: colorName, size: sizeS, image: fileName });
                });

                var jsonStr = JSON.stringify(data);
                document.getElementById('<%= HiddenFieldData.ClientID %>').value = jsonStr;
                console.log("Updated Hidden Field Data:", jsonStr);
            }




        </script>

        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>
</asp:Content>