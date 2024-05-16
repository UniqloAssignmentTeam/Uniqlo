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

        <link href="../../css/Admin/adminStaff.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />
    </header>

    <asp:ScriptManager ID="ScriptManagerCustomer" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelCustomer" runat="server">
        <ContentTemplate>
            <div class="customerBody">
                <h2>UNIQLO CUSTOMER MANAGEMENT</h2>

                <div class="crudCustomer">
                    <div class="wrap-items-search-buttons">
                        <div class="search">
                            <span class="material-symbols-outlined">search</span>
                            <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged" placeholder="Search Customer Name"></asp:TextBox>
                        </div>

                        <div class="dropdown-wrapper">
                            <asp:DropDownList ID="genderSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="genderSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">All Genders</asp:ListItem>
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:DropDownList>
            
                            <asp:DropDownList ID="statusSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="statusSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">All Statuses</asp:ListItem>
                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="btnExcel-Add">
                            <asp:Button ID="excelBtn" runat="server" Text="Export" CssClass="excel-export" OnClick="excelBtn_Click" />
                            <asp:Button ID="addCustomerBtn" runat="server" Text="➕ Add Customer" CssClass="customer-add" OnClick="addCustomerBtn_Click" />
                        </div>
                    </div>
                </div>

                <div class="table">
                    <asp:Repeater ID="customerRepeater" runat="server" ViewStateMode="Disabled">
                        <HeaderTemplate>
                            <table style="width: 100%" class="table">
                                <tr class="row">
                                    <td class="col customerId">Customer ID</td>
                                    <td class="col name">Customer Name</td>
                                    <td class="col email">E-mail</td>
                                    <td class="col gender">Gender</td>
                                    <td class="col status">Status</td>
                                    <td class="col contactNo">Contact No</td>
                                    <td class="col eclipse-display">
                                        <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                                    </td>
                                </tr>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="row">
                                <td class="col customerId">
                                    <asp:Label ID="customerId" runat="server" Text='<%# Eval("Customer_ID") %>'></asp:Label></td>
                                <td class="col name">
                                    <asp:Label ID="customerName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                <td class="col email">
                                    <asp:Label ID="email" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
                                <td class="col gender">
                                    <asp:Label ID="gender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label></td>
                                <td class="col status">
                                    <asp:Label ID="status" runat="server" Text='<%# Eval("Status") %>'></asp:Label></td>
                                <td class="col contactNo">
                                    <asp:Label ID="contactNo" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label></td>

                                <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Customer_ID") %>', 'dropdownDisplay<%# Eval("Customer_ID") %>')">
                                    <div class="eclipse-display" id="dropdownDisplay<%# Eval("Customer_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                                    <div class="eclipse-list" id="dropdownList<%# Eval("Customer_ID") %>">
                                        <div>
                                            <asp:HyperLink ID="updateCustomer" runat="server" NavigateUrl='<%# "UpdateCustomer.aspx?CustomerID=" + Eval("Customer_ID") %>' Text="Update" CssClass="hyperlink"></asp:HyperLink>
                                        </div>
                                        <div>
                                            <asp:HyperLink ID="deleteCustomer" runat="server" NavigateUrl='<%# "DeleteCustomer.aspx?CustomerID=" + Eval("Customer_ID") %>' Text="Delete" CssClass="hyperlink"></asp:HyperLink>
                                        </div>
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

            <asp:HiddenField ID="hiddenCustomerId" runat="server" Value="" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="statusSortDDL" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="genderSortDDL" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="excelBtn" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:HiddenField ID="modalState" runat="server" Value="closed" />

    <footer>
        <script type="text/javascript">
            document.getElementById('<%= searchBox.ClientID %>').onkeyup = function() {
                __doPostBack('<%= searchBox.ClientID %>', '');
            };
        </script>

        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>
</asp:Content>
