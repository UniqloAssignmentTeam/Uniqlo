<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Uniqlo.AdminPages.AddProduct" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
        <header>
            <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
            <script src="sweetalert2.all.min.js"></script>
            <script src="sweetalert2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
            <link rel="stylesheet" href="sweetalert2.min.css">
            <style>
                .cancel-button{
                    padding:20px 100px 20px 60px;
                }
                .continue-button{
                    padding:20px 90px 20px 70px;
                }

                .validation-error {
                    color: red; /* Set the color to red */
                }
            </style>
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
                    <asp:TextBox ID="txtProductName" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProductName" ControlToValidate="txtProductName" runat="server" ErrorMessage="Product name is required." CssClass="validation-error"/>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>

                    <asp:TextBox ID="txtDescription" CssClass="form-field" TextMode="MultiLine" runat="server" Rows="4" Columns="50" MaxLength="500"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProductDescription" ControlToValidate="txtDescription" runat="server" ErrorMessage="Product description is required." CssClass="validation-error"/>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="txtPrice" CssClass="form-field" runat="server"></asp:TextBox>  
                    
                    <div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPrice" ControlToValidate="txtPrice" runat="server" ErrorMessage="Price is required." CssClass="validation-error"/>
                        </div>
                        <div>
                            <asp:RegularExpressionValidator ID="revPrice" ControlToValidate="txtPrice" runat="server" ErrorMessage="Invalid price format." ValidationExpression="^\d+(\.\d{1,2})?$" CssClass="validation-error"/>
                        </div>
                        <div>
                            <asp:RangeValidator ID="rvPrice" ControlToValidate="txtPrice" runat="server" ErrorMessage="Price must be between RM0.01 and RM999.99." MinimumValue="0.01" CssClass="validation-error" MaximumValue="999.99" Type="Double" />
                        </div>
                    </div>

                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>

                    <asp:Panel ID="Panel1" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-display" >
                            <asp:ListItem Text="All Category" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Tops" Value="Top"></asp:ListItem>
                            <asp:ListItem Text="Bottoms" Value="Bottom"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:RequiredFieldValidator ID="rfvCategory" ControlToValidate="ddlCategory" runat="server" InitialValue="" ErrorMessage="Please select a Category." CssClass="validation-error"/>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>

                    <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display" >
                            <asp:ListItem Text="All Gender" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Men" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Women" Value="W"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:RequiredFieldValidator ID="rfvGender" ControlToValidate="ddlGender" runat="server" InitialValue="" ErrorMessage="Please select a Gender." CssClass="validation-error"/>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblColor" runat="server" Text="Color"></asp:Label>
                    <asp:TextBox ID="newColorInput" runat="server"></asp:TextBox>
                    <div style="display: flex;">
                        <div>
                            <asp:Button ID="addColorButton" runat="server" Text="Add Color" CssClass="addColor-button" OnClientClick="return false;" ClientIDMode="Static" CausesValidation="false" />
                        </div>
                    
                        <div style="margin-left: 80px;">
                        <asp:CustomValidator 
                            ID="cvHiddenFieldData" 
                            runat="server" 
                            ErrorMessage="Please add a color." 
                            ClientValidationFunction="validateHiddenFieldData"
                            CssClass="validation-error"
                            ValidateEmptyText="True">
                        </asp:CustomValidator>

                        </div>
                    </div>
                </div>
            </div>

            <asp:Panel ID="colorTablesContainer" runat="server"></asp:Panel>
            <asp:HiddenField ID="HiddenFieldData" runat="server" />
            


            <div class="button-container">
                <div class="cancel-div">
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" CausesValidation="false" PostBackUrl="~/AdminPages/AdminProduct/ProductHome.aspx"/>
                </div>
                <div class="continue-div">
                    <asp:Button ID="addButton" runat="server" Text="Add" CssClass="continue-button" OnClick="addButton_Click" CausesValidation="true"/>
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
                    <div class="color-table-wrapper" id="colorTable${colorId}" >
                        <table class="sizeQtyTable" style="margin-left:230px;">
                            <thead>
                                <tr>
                                    <td style="width: 40%;"><h2>${color}</h2> <input type="hidden" id="colorName${colorId}" value="${color}" /></td>
                                    <td style="width: 30%">
                                        <button type="button" class="addColor-button" onclick="updateHiddenField(this)">Save</button>
                                    </td>
                                    <td style="width: 30%">
                                        <button type="button" class="addColor-button" onclick="deleteColorTable(this)">Delete</button>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td colspan="3">
                                        <div style="display:flex; justify-content: center;">
                                            <div class="image-gallery">
                                                <div class="image-box">
                                                    <div class="add-image">
                                                        <label for="fileInput${colorId}">Upload Image</label>
                                                        <input type="file" id="fileInput${colorId}" name="fileInput${colorId}" class="form-field"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:20%; text-align:center;">
                                       <label for="sizeS${colorId}">S</label>
                                    </td>
                                    <td style="width: 80%; padding-top:10px;" colspan="2">
                                        <input type="number" id="sizeS${colorId}" style="width: 200px;" class="form-field" placeholder=""/>
                                    </td>  
                                </tr>
                                <tr>
                                    <td style="width:20%; text-align:center;">
                                       <label for="sizeM${colorId}">M</label>
                                    </td>
                                    <td style="width: 80%; padding-top:10px;" colspan="2">
                                        <input type="number" id="sizeM${colorId}" style="width: 200px;" class="form-field" placeholder=""/>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td style="width:20%; text-align:center;">
                                       <label for="sizeL${colorId}">L</label>
                                    </td>
                                    <td style="width: 80%; padding-top:10px;" colspan="2">
                                        <input type="number" id="sizeL${colorId}" style="width: 200px;" class="form-field" placeholder=""/>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td style="width:20%; text-align:center;">
                                       <label for="sizeXL${colorId}">XL</label>
                                    </td>
                                    <td style="width: 80%; padding-top:10px;" colspan="2">
                                        <input type="number" id="sizeXL${colorId}" style="width: 200px;" class="form-field" placeholder=""/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>`;
                return tableHtml;
            }

            // Function to delete a color table
            function deleteColorTable(button) {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: "btn btn-success",
                        cancelButton: "btn btn-danger"
                    },
                    buttonsStyling: true
                });

                swalWithBootstrapButtons.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, delete it!",
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: "No, cancel!",
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        var colorTableWrapper = button.closest('.color-table-wrapper');

                        if (colorTableWrapper) {
                            colorTableWrapper.remove();
                            updateHiddenField();

                            var jsonStr = document.getElementById('<%= HiddenFieldData.ClientID %>').value;
                            if (jsonStr === '[]' || jsonStr === '') {
                                document.getElementById('<%= cvHiddenFieldData.ClientID %>').style.display = 'block';
                            }
                            swalWithBootstrapButtons.fire({
                                title: "Deleted!",
                                text: "The color has been deleted.",
                                icon: "success"
                            });
                        }
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        swalWithBootstrapButtons.fire({
                            title: "Cancelled",
                            text: "The color was not deleted",
                            icon: "error"
                        });
                    }
                });
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
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid Input',
                        text: 'Please enter a color.'
                    });
                    return;
                }
                // End the click event handler with a closing bracket
            });

         
      

            function updateHiddenField() {
                var data = []; // Reset data array
                var colorTables = document.querySelectorAll('.color-table-wrapper');
                var totalFilesToRead = colorTables.length;
                var readFilesCount = 0; // Counter to keep track of the number of processed files
                var imageFound = false; // Flag to check if any image is found

                // If no color tables exist, update the hidden field immediately with an empty array
                if (totalFilesToRead === 0) {
                    document.getElementById('<%= HiddenFieldData.ClientID %>').value = '[]';
                    console.log("Updated Hidden Field Data: []");
                    return;
                }


                colorTables.forEach(function (table, index) {
                    var colorName = table.querySelector('input[type="hidden"]').value;
                    var sizeS = table.querySelector('input[id^="sizeS"]').value;
                    var sizeM = table.querySelector('input[id^="sizeM"]').value;
                    var sizeL = table.querySelector('input[id^="sizeL"]').value;
                    var sizeXL = table.querySelector('input[id^="sizeXL"]').value;
                    var fileInput = table.querySelector('input[type="file"]');

                    var sizeSValid = sizeS && parseInt(sizeS) > 0;
                    var sizeMValid = sizeM && parseInt(sizeM) > 0;
                    var sizeLValid = sizeL && parseInt(sizeL) > 0;
                    var sizeXLValid = sizeXL && parseInt(sizeXL) > 0;

                    if ((sizeS <= 0 && sizeS !== '') || (sizeM <= 0 && sizeM !== '') || (sizeL <= 0 && sizeL !== '') || (sizeXL <= 0 && sizeXL !== '')) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Input',
                            text: 'Size values must be greater than 0.'
                        });
                        return; // Stop the function if any size is invalid
                    }

                    if (!(sizeSValid || sizeMValid || sizeLValid || sizeXLValid)) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Invalid Input',
                            text: 'Please enter a valid size greater than 0 for at least one size to continue.'
                        });
                        return;
                    }


                    if (fileInput.files.length > 0) {
                        imageFound = true; 
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            data.push({
                                Color: colorName,
                                SizeS: sizeS,
                                SizeM: sizeM,
                                SizeL: sizeL,
                                SizeXL: sizeXL,
                                Image: e.target.result
                            });
                            readFilesCount++; 

                            if (readFilesCount === totalFilesToRead && imageFound) {
                                var jsonStr = JSON.stringify(data);
                                document.getElementById('<%= HiddenFieldData.ClientID %>').value = jsonStr;
                                console.log("Updated Hidden Field Data:", jsonStr);
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Update Successful',
                                    text: 'The Colors and Sizes are updated successfully!'
                                });
                                document.getElementById('<%= cvHiddenFieldData.ClientID %>').style.display = 'none';
                            }
                        };
                        reader.readAsDataURL(fileInput.files[0]);
                    } else {
                        readFilesCount++; 
                    }
                });
            }


            function validateHiddenFieldData(source, args) {
                var hiddenField = document.getElementById('<%= HiddenFieldData.ClientID %>');
                    var hiddenFieldValue = hiddenField.value.trim();
                    args.IsValid = hiddenFieldValue !== '' && hiddenFieldValue !== '[]';
            }



        </script>

            
            
            <script src="../../Javascript/productAdminDDL.js"></script>
   </footer>
</asp:Content>