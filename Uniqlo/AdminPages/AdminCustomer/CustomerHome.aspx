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
                    <asp:Repeater ID="customerRepeater" runat="server">
                            <HeaderTemplate>
                                <table style="width: 100%" class="table">
                                    <tr class="row">
                                        <th class="col name">Name</th>
                                        <th class="col gender">Gender</th>
                                        <th class="col contactNo">Contact No</th>
                                        <th class="col address">Address</th>
                                        <th class="col email">Email</th>
                                        <th class="col password">Password</th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="row">
                                    <td class="col name">
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </td>
                                    <td class="col gender">
                                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                    </td>
                                    <td class="col contactNo">
                                        <asp:Label ID="lblContactNo" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label>
                                    </td>
                                    <td class="col address">
                                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                    </td>
                                    <td class="col email">
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </td>
                                    <td class="col password">
                                        <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
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
