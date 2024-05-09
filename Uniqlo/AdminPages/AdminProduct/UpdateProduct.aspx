<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <header>
        <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
        <style>
            .cancel-button {
                padding: 20px 100px 20px 60px;
            }

            .continue-button {
                padding: 20px 100px 20px 60px;
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
                                <asp:TextBox ID="txtProdName" runat="server" Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtDescription" CssClass="form-field" TextMode="MultiLine" runat="server" Rows="4" Columns="50" Text='<%# Eval("Description") %>'></asp:TextBox>
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
                                        <asp:ListItem Text="Tops" Value="Top"></asp:ListItem>
                                        <asp:ListItem Text="Bottoms" Value="Bottom"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
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
                                        <asp:ListItem Text="Men" Value="M"></asp:ListItem>
                                        <asp:ListItem Text="Women" Value="W"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblColor" runat="server" Text="Color"></asp:Label>
                                <asp:TextBox ID="newColorInput" runat="server" ClientIDMode="Static"></asp:TextBox>
                                <asp:Button ID="addColorButton" runat="server" Text="Add Color" CssClass="addColor-button" ClientIDMode="Static" />
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
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" PostBackUrl="~/AdminPages/AdminProduct/ProductHome.aspx" />
                </div>
                <div class="continue-div">
                    <asp:Button ID="addButton" runat="server" Text="Update" CssClass="continue-button" OnClick="updateButton_Click" />
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
                    var colorTableWrapper = button.closest('.color-table-wrapper');
                    if (colorTableWrapper) {
                        colorTableWrapper.remove();
                        updateHiddenField();
                    }
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
                            alert('Please enter a color.');
                        }
                    });
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
