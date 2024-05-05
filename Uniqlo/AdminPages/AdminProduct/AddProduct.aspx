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
                    <asp:TextBox ID="productName" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                    <asp:TextBox ID="description" CssClass="form-field" TextMode="MultiLine" runat="server" Rows="4" Columns="50"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="price" CssClass="form-field" runat="server"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>

                    <asp:Panel ID="Panel1" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-display" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Text="Tops" Value="Tops"></asp:ListItem>
                            <asp:ListItem Text="Bottoms" Value="Bottoms"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:Panel>

                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>

                    <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropdown-display" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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



            <div class="button-container">
                <div class="cancel-div">
                    <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" PostBackUrl="~/AdminPages/AdminProduct/Product.aspx" />
                </div>
                <div class="continue-div">
                    <asp:Button ID="addButton" runat="server" Text="Add" CssClass="continue-button" PostBackUrl="~/AdminPages/AdminProduct/Product.aspx"/>
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
                            <th><asp:Button ID="btnDeleteTable" runat="server" CssClass="addColor-button" Text="Delete"></asp:Button></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="sizeS" runat="server" Text="S"></asp:Label>
                                    <asp:TextBox ID="txtS" runat="server" type="number" CssClass="form-field" placeholder=""/>
                                </div>
                            </td>
                            <td>                      
                                <div class="image-gallery">
                                    <div class="image-box">
                                       <div class="add-image">+</div>
                                    </div>
                                </div>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="sizeM" runat="server" Text="M"></asp:Label>
                                    <asp:TextBox ID="txtM" runat="server" type="number" CssClass="form-field" placeholder=""/>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="sizeL" runat="server" Text="L"></asp:Label>
                                    <asp:TextBox ID="txtL" runat="server" type="number" CssClass="form-field" placeholder=""/>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="sizeXL" runat="server" Text="XL"></asp:Label>
                                    <asp:TextBox ID="txtXL" runat="server" type="number" CssClass="form-field" placeholder=""/>
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





        </script>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>
</asp:Content>