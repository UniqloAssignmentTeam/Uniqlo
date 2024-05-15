<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminProduct.ProductHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../css/Admin/adminProduct.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            .confirmationClearFix {
                width: 100%;
                margin-top: 90px;
            }

            .no-discount-label {
                color: red;
                font-size: 16px;
                margin-top: 20px;
                display: block;
                text-align: center;
            }

            .confirmationCancelbtn, .confirmationDeletebtn {
                border: 2px solid black;
                padding: 20px 150px 20px 150px;
                background: none;
                outline: none;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease;
                width: 100%;
                text-decoration: none;
                color: black;
                width: calc((100% / 2) - 20px);
            }

            .confirmationDeletebtn:hover,
            .confirmationCancelbtn:hover {
                background-color: black;
                color: white;
            }

            .confirmationContainer {
                padding: 16px;
                text-align: center;
            }

            .confirmationModal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 2; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 50px;
                margin-top: 100px;
            }

            .confirmation-modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
                height: 400px;
            }

            .confirmation-modal-content h1 {
                margin-top: 60px;
            }

            .confirmation-modal-content p {
                margin-top: 30px;
            }

            .confirmationClose {
                float: right;
                font-size: 40px;
                font-weight: bold;
                color: #f1f1f1;
            }

            .confirmationClose:hover,
            .confirmationClose:focus {
                color: black;
                cursor: pointer;
            }

            .confirmationClearFix::after {
                content: "";
                clear: both;
                display: table;
            }

            @media screen and (max-width: 300px) {
                .confirmationCancelbtn, .confirmationDeletebtn {
                    width: 100%;
                }
            }
        </style>
    </header>

    <div class="productBody">
        <asp:ScriptManager ID="ScriptManagerProduct" runat="server"/>
        <asp:UpdatePanel ID="UpdatePanelProduct" runat="server">
            <ContentTemplate>
                <h2>UNIQLO PRODUCT MANAGEMENT</h2>
                <div class="crudProduct">
                    <div class="wrap-items-search-buttons">
                        <div class="search">
                            <span class="material-symbols-outlined">search</span>
                             <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged"  placeholder="Search Product Name"></asp:TextBox>
                        </div>
                        <div class="dropdown-wrapper">
                            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">Category</asp:ListItem>
                                <asp:ListItem Value="Top">Tops</asp:ListItem>
                                <asp:ListItem Value="Bottom">Bottoms</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="dropdown-wrapper">
                            <asp:DropDownList ID="ddlGender" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">Gender</asp:ListItem>
                                <asp:ListItem Value="M">Men</asp:ListItem>
                                <asp:ListItem Value="W">Women</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="btnExcel-Add">
                            <asp:Button ID="excelExport" runat="server" Text="Export" CssClass="excel-export" OnClick="btnExport_Click" />
                            <asp:Button ID="addProdBtn" runat="server" Text="➕ Add Product" CssClass="product-add" Style="color: #6F6F6F; text-decoration: none; font-size: 1rem; font-weight: bold;" OnClick="addProdBtn_Click" />
                        </div>
                    </div>
                </div>


                <div class="table">
                    <asp:Repeater ID="prodRepeater" runat="server" ViewStateMode="Disabled">

                        <HeaderTemplate>
                            <table style="width: 100%" class="table">
                                <tr class="row">
                                    <td class="col productid">Product ID</td>
                                    <td class="col name">Product Name</td>
                                    <td class="col wear">Category</td>
                                    <td class="col price">Price</td>
                                    <td class="col gender">Gender</td>
                                    <td class="col eclipse-display">
                                        <asp:Button ID="Button2" runat="server" Text="Button" Visible="False" />
                                    </td>
                                </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="row">
                                <td class="col productid">
                                    <asp:Label ID="prodID" runat="server" Text='<%# Eval("Product_ID") %>'></asp:Label>
                                </td>
                                <td class="col name">
                                    <asp:Label ID="prodName" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                                </td>
                                <td class="col wear">
                                    <asp:Label ID="categoryName" runat="server" Text='<%# Eval("Category.Name") %>'></asp:Label>
                                </td>
                                <td class="col price">
                                    <asp:Label ID="price" runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label>
                                </td>
                                <td class="col gender">
                                    <asp:Label ID="gender" runat="server" Text='<%# Eval("Category.Gender").ToString() == "M" ? "Men " : (Eval("Category.Gender").ToString() == "W" ? "Woman" : "Not Specified") %>'></asp:Label>
                                </td>
                                <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Product_ID") %>', 'dropdownDisplay<%# Eval("Product_ID") %>')">
                                    <div class="eclipse-display" id="dropdownDisplay<%# Eval("Product_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                                    <div class="eclipse-list" id="dropdownList<%# Eval("Product_ID") %>">
                                        <div>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "viewMoreProduct.aspx?ProdID=" + Eval("Product_ID") %>' Text="View More" Style="text-decoration: none; color: #6F6F6F"></asp:HyperLink>
                                        </div>
                                        <div>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "UpdateProduct.aspx?ProdID=" + Eval("Product_ID") %>' Text="Update" Style="text-decoration: none; color: #6F6F6F"></asp:HyperLink>
                                        </div>
                                        <div onclick="showDeleteModal(<%# Eval("Product_ID") %>);">Delete</div>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:Label ID="noDiscount" runat="server" Text="No Products Available" CssClass="no-discount-label" Visible="false"></asp:Label>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlGender" EventName="SelectedIndexChanged" />
                <asp:PostBackTrigger ControlID="excelExport" />
            </Triggers>
        </asp:UpdatePanel>

        <div style="margin-bottom: 80px;"></div>

        <asp:HiddenField ID="hiddenProductId" runat="server" />
        <asp:Button ID="hiddenDeleteButton" runat="server" Text="Delete" OnClick="btnRemoveProduct_Click" Style="display:none;" />
    </div>

    <footer>
        <script type="text/javascript">
            function showDeleteModal(prodID) {
                Swal.fire({
                    title: 'Are you sure?',
                    html: "<strong>You are about to delete the product with ID:</strong> <span style='color: red;'>" + prodID + "</span>.<br>This action cannot be undone!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('<%= hiddenProductId.ClientID %>').value = prodID;
                        __doPostBack('<%= hiddenDeleteButton.UniqueID %>', '');
                    }
                });
            }

            function showDeleteSuccess() {
                Swal.fire({
                    title: 'Deleted!',
                    text: 'The product has been successfully deleted.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = window.location.href; // This will reload the page
                    }
                });
            }

            function showAlert(type, title, message) {
                Swal.fire({
                    icon: type,
                    title: title,
                    text: message,
                    timer: 5000,
                    timerProgressBar: true,
                    showConfirmButton: false
                });
            }

            document.getElementById('<%= searchBox.ClientID %>').onkeyup = function () {
                __doPostBack('<%= searchBox.UniqueID %>', '');
            };
        </script>
        <script src="../../Javascript/Pagination.js"></script>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
    </footer>
</asp:Content>
