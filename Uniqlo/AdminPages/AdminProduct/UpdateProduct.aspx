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
            <div class="product-content">
                <div class="form-group">
                    <asp:Label ID="lblProdID" runat="server" Text="Product ID"></asp:Label>
                    <asp:TextBox ID="txtProdID" runat="server" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                    <asp:TextBox ID="txtProdName" runat="server"></asp:TextBox>
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
                            <asp:ListItem Text="Tops" Value="Top"></asp:ListItem>
                            <asp:ListItem Text="Bottoms" Value="Bottom"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>

                    <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display" >
                            <asp:ListItem Text="Men" Value="M"></asp:ListItem>
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

            <table class="sizeQtyTable">
                <thead>
                    <tr>
                        <th>
                            <h2><asp:Label ID="lblColorTable" runat="server" Text=""></asp:Label></h2>
                        </th>
                        <th>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" class="addColor-button" onclick="deleteColorTable(this)"/>
                        </th>
                        <th>
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="addColor-button" onclick="updateHiddenField(this)"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="form-group">
                                <asp:Label ID="lblSize" runat="server" Text=""></asp:Label>
                                <asp:TextBox ID="TxtSize" CssClass="form-field" TextMode="Number" runat="server"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            <div class="image-gallery">
                                <div class="image-box">

                                    <img src="../../../Images/womenTopBanner.png" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="productName">M</label>
                                <input type="number" class="form-field" placeholder="123">
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="productName">L</label>
                                <input type="number" class="form-field" placeholder="124">
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="productName">XL</label>
                                <input type="number" class="form-field" placeholder="122">
                            </div>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            

            <asp:Panel ID="colorTablesContainer" runat="server"></asp:Panel>
            <asp:HiddenField ID="HiddenFieldData" runat="server" />


            <div class="button-container">
                <div class="cancel-div">
                    <a href="Product.aspx" class="cancel-button">Cancel</a>
                </div>
                <div class="continue-div">
                    <a href="Product.aspx" class="continue-button">Update</a>
                </div>
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
