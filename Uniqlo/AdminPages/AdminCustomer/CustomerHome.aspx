<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminCustomer.CustomerHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <style>
            .hyperlink {
                color: #6F6F6F;
                text-decoration: none;
            }
            .no-customer-label {
                color: red;
                font-size: 16px;
                margin-top: 20px;
                display: block;
                text-align: center;
            }
        </style>


         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="../../css/Admin/adminStaff.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />
    </header>

    <asp:ScriptManager ID="ScriptManagerCustomer" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelCustomer" runat="server">
        <ContentTemplate>
            <div class="productBody">
                <h2>UNIQLO CUSTOMER MANAGEMENT</h2>

                <div class="crudProduct">
                    <div class="wrap-items-search-buttons">
                        <div class="search">
                            <span class="material-symbols-outlined">search</span>
                            <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged" placeholder="Search Customer Name"></asp:TextBox>
                        </div>

                        <div class="dropdown-wrapper">
                            <asp:DropDownList ID="genderSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="genderSortDDL_SelectedIndexChanged" CssClass="dropdown-display" style="margin-left:-100px">
                                <asp:ListItem Value="">All Genders</asp:ListItem>
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="btnExcel-Add">
                            <asp:Button ID="excelBtn" runat="server" Text="Export" CssClass="excel-export" OnClick="excelBtn_Click" />
                            <asp:Button ID="addCustomerBtn" runat="server" Text="➕ Add Customer" CssClass="product-add" OnClick="addCustomerBtn_Click" />
                        </div>
                    </div>
                </div>

                <div class="table">
                    <asp:Repeater ID="customerRepeater" runat="server" ViewStateMode="Disabled">
                            <HeaderTemplate>
                                <table style="width: 100%" class="table">
                                    <tr class="row">
                                        <td class="col customerID">Customer ID</td>
                                        <th class="col name">Name</th>
                                        <th class="col gender">Gender</th>
                                        <th class="col contactNo">Contact No</th>
                                        <th class="col email">Email</th>
                                        <th class="col eclipse-display">
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="row">

                                    <td class="col staffid">
                                        <asp:Label ID="lblCustId" runat="server" Text='<%# Eval("Customer_ID") %>'></asp:Label>
                                    </td>
                                    <td class="col name">
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </td>
                                    <td class="col gender">
                                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                    </td>
                                    <td class="col contactNo">
                                        <asp:Label ID="lblContactNo" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label>
                                    </td>
                                    <td class="col email">
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </td>
                                    <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Customer_ID") %>', 'dropdownDisplay<%# Eval("Customer_ID") %>')">
                                        <div class="eclipse-display" id="dropdownDisplay<%# Eval("Customer_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                                        <div class="eclipse-list" id="dropdownList<%# Eval("Customer_ID") %>">

                                            <div>
                                                <asp:HyperLink ID="updateCustomer" runat="server" NavigateUrl='<%# "UpdateCustomer.aspx?Customer_ID=" + Eval("Customer_ID") %>' Text="Update" CssClass="hyperlink"></asp:HyperLink>
                                            </div>
                                            <div onclick="showDeleteModal(<%# Eval("Customer_ID") %>);">Delete</div>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    <asp:Label ID="lblNoCustomerFound" runat="server" Text="No Customer Found" Visible="false" CssClass="no-customer-label"></asp:Label>
                </div>

                <div style="margin-bottom: 80px;"></div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="genderSortDDL" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="excelBtn" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:HiddenField ID="hiddenCustomerId" Value="" runat="server" />
    <asp:Button ID="hiddenDeleteButton" runat="server" Text="Delete" OnClick="btnRemoveCustomer_Click" Style="display:none;" />
    <footer>
        <script type="text/javascript">

            function showDeleteModal(customerId) {
                Swal.fire({
                    title: 'Are you sure?',
                    html: "<strong>You are about to delete the Customer with ID:</strong> <span style='color: red;'>" + customerId + "</span>.<br>This action cannot be undone!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('<%= hiddenCustomerId.ClientID %>').value = customerId;
                        __doPostBack('<%= hiddenDeleteButton.UniqueID %>', '');
                    }
                });
            }

            function showDeleteSuccess() {
                Swal.fire({
                    title: 'Deleted!',
                    text: 'The delivery has been successfully deleted.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = window.location.href;
                    }
                });
            }
            document.getElementById('<%= searchBox.ClientID %>').onkeyup = function() {
                __doPostBack('<%= searchBox.ClientID %>', '');
            };
        </script>

        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>
</asp:Content>
