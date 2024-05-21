<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <header>
        <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="sweetalert2.all.min.js"></script>
        <script src="sweetalert2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <style>
            .cancel-button {
                padding: 20px 100px 20px 60px;
            }

            .continue-button {
                padding: 20px 100px 20px 60px;
            }

            .validation-error {
                color: red; /* Set the color to red */
            }
        </style>
    </header>




    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO UPDATE PRODUCT</h2>
        </div>

        <div class="modal-content">

            <asp:FormView ID="formView" runat="server" OnDataBound="formView_DataBound">
                <ItemTemplate>
                    <table  class="product-content">
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblProdID" runat="server" Text="Product ID"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtProdID" runat="server" Enabled="false" Text='<%# Eval("Product_ID") %>'></asp:TextBox>
                                <input type="hidden" id="hiddenProdID" value='<%# Eval("Product_ID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtProdName" runat="server" MaxLength="100" Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProductName" ControlToValidate="txtProdName" runat="server" ErrorMessage="Product name is required." CssClass="validation-error" ValidationGroup="ProductInfo" Display="Dynamic"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtDescription" CssClass="form-field" TextMode="MultiLine" MaxLength="500" runat="server" Rows="4" Columns="50" Text='<%# Eval("Description") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvProductDescription" ControlToValidate="txtDescription" runat="server" ErrorMessage="Product description is required." CssClass="validation-error" ValidationGroup="ProductInfo" Display="Dynamic"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtPrice" CssClass="form-field" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPrice" ControlToValidate="txtPrice" runat="server" ErrorMessage="Price is required." CssClass="validation-error" ValidationGroup="ProductInfo" Display="Dynamic"/>
                                <asp:RegularExpressionValidator ID="revPrice" ControlToValidate="txtPrice" runat="server" ErrorMessage="Invalid price format." ValidationExpression="^\d+(\.\d{1,2})?$" CssClass="validation-error" ValidationGroup="ProductInfo" Display="Dynamic"/>
                                <asp:RangeValidator ID="rvPrice" ControlToValidate="txtPrice" runat="server" ErrorMessage="Price must be between RM0.01 and RM999.99." MinimumValue="0.01" CssClass="validation-error" MaximumValue="999.99" Type="Double" ValidationGroup="ProductInfo" Display="Dynamic"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Panel ID="Panel1" runat="server" CssClass="dropdown-container">
                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-display" SelectedValue='<%# Eval("Category.Name") %>'>
                                        <asp:ListItem Text="All Category" Value="" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Tops" Value="Top"></asp:ListItem>
                                        <asp:ListItem Text="Bottoms" Value="Bottom"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                                <asp:RequiredFieldValidator ID="rfvCategory" ControlToValidate="ddlCategory" runat="server" InitialValue="" ErrorMessage="Please select a Category." CssClass="validation-error" ValidationGroup="ProductInfo" Display="Dynamic"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display" SelectedValue='<%# Eval("Category.Gender") %>'>
                                        <asp:ListItem Text="All Gender" Value="" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Men" Value="M"></asp:ListItem>
                                        <asp:ListItem Text="Women" Value="W"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                                <asp:RequiredFieldValidator ID="rfvGender" ControlToValidate="ddlGender" runat="server" InitialValue="" ErrorMessage="Please select a Gender." CssClass="validation-error" ValidationGroup="ProductInfo" Display="Dynamic"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblColor" runat="server" Text="Color"></asp:Label>
                                <asp:TextBox ID="newColorInput" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegexValidatorNewColorInput" runat="server" ControlToValidate="newColorInput" ErrorMessage="Please enter only letters." ValidationExpression="^[a-zA-Z\s]*$" CssClass="validation-error" Display="Dynamic" ValidationGroup="ProductColor"/>
                                <div style="display: flex;">
                                    <asp:Button ID="addColorButton" runat="server" Text="Add Color" CssClass="addColor-button" ClientIDMode="Static" CausesValidation="true" ValidationGroup="ProductColor"/>
                                </div>
                            </td>
                        </tr>





                            <asp:DataList ID="dataList" runat="server" OnItemDataBound="dataList_ItemDataBound">
                                <ItemTemplate>
                                    <table class="sizeQtyTable color-table-wrapper2" data-image-id='<%# Eval("FirstImageId") %>'>
                                        <tr>
                                            <td style="width: 40%;">
                                                
                                                <h2><%# Eval("Color") %></h2>
                                            </td>
                                            <td style="width: 60%;">
                                                <div style="display:flex; justify-content:right;">
                                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" class="addColor-button" CommandArgument='<%# Eval("FirstImageId") %>' OnCommand="btnDelete_Click" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div style="display:flex; justify-content: center;">
                                                    <img src='/ImageHandler.ashx?id=<%# Eval("FirstImageId") %>' alt="Product Name" style="width: 90%; padding-left: 10px;"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <asp:Repeater ID="RepeaterSizes" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="width:20%; text-align:center;">
                                                        <div class="size-label"><b><%# Eval("Size") %></b></div>
                                                    </td>
                                                    <td style="width: 80%; padding-top:10px;" colspan="2">
                                                        <asp:TextBox ID="txtQty" CssClass="qty-input" runat="server" Text='<%# Eval("Qty") %>' data-item-index='<%# Eval("Qty") %>' style="width: 200px;" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </table>
                </ItemTemplate>
            </asp:FormView>

            <asp:Panel ID="colorTablesContainer" runat="server" ClientIDMode="Static" CssClass="colorTablesContainer"></asp:Panel>
            <asp:HiddenField ID="HiddenFieldData" runat="server" ClientIDMode="Static"/>

            <div class="button-container">
                <div class="cancel-div">
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" CausesValidation="false" PostBackUrl="~/AdminPages/AdminProduct/ProductHome.aspx" />
                </div>
                <div class="continue-div">
                    <asp:Button ID="addButton" runat="server" Text="Update" CssClass="continue-button" CausesValidation="true" OnClick="updateButton_Click" ValidationGroup="ProductInfo"/>
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

                                swalWithBootstrapButtons.fire({
                                    title: "Deleted!",
                                    text: "The color has been deleted.",
                                    icon: "success"
                                });
                            } else if (result.dismiss === Swal.DismissReason.cancel) {
                                swalWithBootstrapButtons.fire({
                                    title: "Cancelled",
                                    text: "The color was not deleted",
                                    icon: "error"
                                });
                            }
                        }
                    });
                }



                //function to add new row for the table
                document.addEventListener('DOMContentLoaded', function () {
                    document.getElementById('addColorButton').addEventListener('click', function (event) {
                        event.preventDefault();
                        var newColorInput = document.getElementById('newColorInput');
                        var color = newColorInput.value.trim();
                        if (color !== '') {
                            var colorTablesContainer = document.getElementById('colorTablesContainer');
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
                    });
                });




                function updateHiddenField() {
                    var data = []; // Reset data array
                    var colorTables = document.querySelectorAll('.color-table-wrapper');
                    var totalFilesToRead = colorTables.length;
                    var readFilesCount = 0; // Counter to keep track of the number of processed files
                    var imageFound = false;

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
                            var file = fileInput.files[0];
                            if (file.type !== 'image/jpeg') {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Invalid Image Type',
                                    text: 'Only JPEG images are allowed.'
                                });
                                return;
                            }

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
                                readFilesCount++; // Increment the counter

                                // Check if all files have been processed
                                if (readFilesCount === totalFilesToRead && imageFound) {
                                    var jsonStr = JSON.stringify(data);
                                    document.getElementById('<%= HiddenFieldData.ClientID %>').value = jsonStr;
                                    console.log("Updated Hidden Field Data:", jsonStr);
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Update Successful',
                                        text: 'The Colors and Sizes are updated successfully!'
                                    });
                                }
                            };
                            reader.readAsDataURL(fileInput.files[0]);
                        } else {
                            readFilesCount++; // Increment the counter since processing a table even without an image
                        }
                    });
                }

                function confirmDelete(deleteFunctionName, deleteValue) {
                    const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: 'btn btn-success',
                            cancelButton: 'btn btn-danger'
                        },
                        buttonsStyling: true
                    });

                    swalWithBootstrapButtons.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Yes, delete it!',
                        cancelButtonText: 'No, cancel!',
                        reverseButtons: true
                    }).then((result) => {
                        if (result.isConfirmed) {
                            __doPostBack(deleteFunctionName, deleteValue);
                        }
                    });
                }





            </script>
            <script src="../../Javascript/productAdminDDL.js"></script>

        </footer>
</asp:Content>
