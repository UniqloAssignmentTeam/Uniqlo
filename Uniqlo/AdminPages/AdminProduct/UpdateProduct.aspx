<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <header>
        <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
    </header>




    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO UPDATE PRODUCT</h2>
        </div>

        <div class="modal-content">

            <asp:FormView ID="formView" runat="server" ViewStateMode="Disabled">
                <ItemTemplate>
                    <table>
                        <tr class="product-content">
                            <td class="form-group">
                                <asp:Label ID="lblProdID" runat="server" Text="Product ID"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtProdID" runat="server" Enabled="false" Text='<%# Eval("Product_ID") %>'></asp:TextBox>
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
                                <asp:Panel ID="Panel1" runat="server" CssClass="dropdown-container" SelectedValue='<%# Eval("Category.Name") %>'>
                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-display">
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
                                <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container" SelectedValue='<%# Eval("Category.Gender") %>'>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display">
                                        <asp:ListItem Text="Men" Value="M"></asp:ListItem>
                                        <asp:ListItem Text="Women" Value="W"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblColor" runat="server" Text="Color"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="newColorInput" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Button ID="addColorButton" runat="server" Text="Add color" CssClass="addColor-button" />
                            </td>
                        </tr>


 
                        <asp:Panel ID="colorTablesContainer" runat="server"></asp:Panel>
                        <asp:HiddenField ID="HiddenFieldData" runat="server" />
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </div>

        <div class="button-container">
            <div class="cancel-div">
                <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" PostBackUrl="~/AdminPages/AdminProduct/Product.aspx" />
            </div>
            <div class="continue-div">
                <asp:Button ID="addButton" runat="server" Text="Update" CssClass="continue-button" OnClick="updateButton_Click" />
            </div>
        </div>
    </div>
    


        <footer>
            <script>
                // Function to create a new table for a color
                function createColorTable(color) {
                    var tableHtml = `
                        <table class="sizeQtyTable">
                            <thead>
                                <tr>
                                    <th><h2>${color}</h2></th>
                                    <th><button class="addColor-button" onclick="deleteColorTable(this)">Delete</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label for="productName">XL</label>
                                            <input type="number" class="form-field" placeholder="Quantity">
                                        </div>
                                    </td>
                                    <td>            <div class="image-gallery">
                            <div class="image-box">
                               <div class="add-image">+</div>
                            </div>
    
                        </div></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label for="productName">M</label>
                                            <input type="number" class="form-field" placeholder="Quantity">
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label for="productName">L</label>
                                            <input type="number" class="form-field" placeholder="Quantity">
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label for="productName">XL</label>
                                            <input type="number" class="form-field" placeholder="Quantity">
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                        `;
                    return tableHtml;
                }

                // Function to delete a color table
                function deleteColorTable(button) {
                    var colorTableWrapper = button.closest('.color-table-wrapper');
                    colorTableWrapper.remove();
                }

                // Event listener for the "Add color" button
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





            </script>
            <script src="../../Javascript/productAdminDDL.js"></script>
        </footer>
</asp:Content>
