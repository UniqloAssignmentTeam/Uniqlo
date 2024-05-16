<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminOrder.OrderHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
        <link href="../../css/Admin/adminOrder.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .dropdown-container {
            margin-left: -180px;
        }

        .price {
            flex-basis: 15%;
        }

        @media screen and (min-width: 992px) {
            .product-imgs {
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
            }
        }

        .confirmationClearFix {
            width: 100%;
            margin-top: 90px;
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
            display: none;
            position: fixed;
            z-index: 2;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 50px;
            margin-top: 100px;
        }

        .confirmation-modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto;
            border: 1px solid #888;
            width: 80%;
            height: 400px;
        }

        .no-discount-label {
            color: red;
            font-size: 16px;
            margin-top: 20px;
            display: block;
            text-align: center;
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

    <div class="productBody">
        <asp:ScriptManager ID="ScriptManagerProduct" runat="server" />
        <asp:UpdatePanel ID="UpdatePanelProduct" runat="server">
            <ContentTemplate>
                <h2>UNIQLO ORDER MANAGEMENT</h2>

                <div class="crudProduct">
                    <div class="wrap-items-search-buttons">
                        <div class="search">
                            <span class="material-symbols-outlined">search</span>
                            <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged" placeholder="Search Order Name"></asp:TextBox>
                        </div>

                        <div class="dropdown-wrapper" style="margin-left: -300px;">
                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">Status</asp:ListItem>
                                <asp:ListItem Value="Paid">Paid</asp:ListItem>
                                <asp:ListItem Value="Unpaid">Unpaid</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="btnExcel-Add">
                            <asp:Button ID="excelExport" runat="server" Text="Export" CssClass="excel-export" OnClick="btnExport_Click" />
                        </div>
                    </div>
                </div>

                <asp:Repeater ID="orderRepeater" runat="server" ViewStateMode="Disabled">
                    <HeaderTemplate>
                        <table class="table" style="width: 100%">
                            <!-- Header -->
                            <tr class="row">
                                <td class="col productid">Order ID</td>
                                <td class="col name">Customer Name</td>
                                <td class="col price">Total Item</td>
                                <td class="col gender">Total Amount</td>
                                <td class="col category">Date</td>
                                <td class="col wear">Status</td>
                                <td class="col eclipse-container">
                                    <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="row">
                            <td class="col productid"><%# Eval("OrderId") %></td>
                            <td class="col name"><%# Eval("CustomerName") %></td>
                            <td class="col price"><%# Eval("OrderListTotalItems") %></td>
                            <td class="col gender"><%# Eval("PaymentTotalAmount") %></td>
                            <td class="col category"><%# Eval("PaymentDate", "{0:dd/MM/yyyy}") %></td>
                            <td class="col wear"><%# Eval("PaymentStatus") %></td>
                            <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("OrderId") %>', 'dropdownDisplay<%# Eval("OrderId") %>')">
                                <div class="eclipse-display" id="dropdownDisplay<%# Eval("OrderId") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                                <div class="eclipse-list" id="dropdownList<%# Eval("OrderId") %>">
                                    <div>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "OrderItem.aspx?OrderID=" + Uniqlo.EncryptionHelper.Encrypt((string)Eval("OrderId").ToString()) %>' Text="View More" Style="text-decoration: none; color: #6F6F6F"></asp:HyperLink>
                                    </div>
                                    <div onclick="showDeleteModal(<%# Eval("OrderId") %>);">Delete</div>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Label ID="noDiscount" runat="server" Text="No Orders Available" CssClass="no-discount-label" Visible="false"></asp:Label>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged" />
                <asp:PostBackTrigger ControlID="excelExport" />
            </Triggers>
        </asp:UpdatePanel>

        <asp:HiddenField ID="hiddenOrderId" runat="server" Value="" />
        <asp:Button ID="hiddenDeleteButton" runat="server" Text="Delete" OnClick="btnRemoveOrder_Click" Style="display:none;" />

        <div style="margin-bottom: 80px;"></div>
    </div>
    <footer>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script>
            function showDeleteModal(orderID) {
                Swal.fire({
                    title: 'Are you sure?',
                    html: "<strong>You are about to delete the orders with ID:</strong> <span style='color: red;'>" + orderID + "</span>.<br>This action cannot be undone!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('<%= hiddenOrderId.ClientID %>').value = orderID;
                        __doPostBack('<%= hiddenDeleteButton.UniqueID %>', '');
                    }
                });
            }

            function showDeleteSuccess() {
                Swal.fire({
                    title: 'Deleted!',
                    text: 'The order has been successfully deleted.',
                    icon: 'success',
                    confirmButtonText: 'Ok'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = window.location.href;
                    }
                });
            }

            document.getElementById('<%= searchBox.ClientID %>').onkeyup = function () {
                __doPostBack('<%= searchBox.ClientID %>', '');
            };
        </script>
    </footer>

</asp:Content>
