<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DeliveryHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDelivery.DeliveryHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
      <style>
        .dropdown-wrapper {
            margin-right: 310px;
        }
        .wrap-items-search-buttons {
            justify-content: normal;
        }
        .name {
            flex-grow: 1;
        }
        .status {
            flex-basis: 15%;
        }
        .gender {
            flex-basis: 10%;
        }
        .category {
            flex-basis: 20%;
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
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
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
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
    <link href="../../css/Admin/adminDelivery.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <div class="productBody">
        <h2>UNIQLO DELIVERY MANAGEMENT</h2>
        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true"  OnTextChanged="searchBox_TextChanged" placeholder="Search Delivery ID"></asp:TextBox>
                </div>
                <div class="dropdown-wrapper">
                    <asp:DropDownList ID="statusSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="statusSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
                        <asp:ListItem Value="">Status</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="In Transit">In Transit</asp:ListItem>
                        <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="btnExcel-Add">
                    <asp:Button ID="btnExcel" CssClass="excel-export" runat="server" Text="Export" OnClick="btnExcel_Click" />
                    <asp:Button ID="addDeliveryBtn" runat="server" Text="➕ Add Delivery" CssClass="product-add" OnClick="addDeliveryBtn_Click" />
                </div>
            </div>
        </div>

        <asp:Repeater ID="rptDeliveries" runat="server" ViewStateMode="Disabled">
            <HeaderTemplate>
                <table class="table" style="width: 100%">
                    <tr class="row">
                        <th class="col productid">Delivery ID</th>
                        <th class="col name">Delivery Address</th>
                        <th class="col price">Status</th>
                        <th class="col gender">Order ID</th>
                        <th class="col eclipse-container">Options</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="row">
                    <td class="col productid"><%# Eval("Delivery_ID") %></td>
                    <td class="col name"><%# Eval("DeliveryAddress") %></td>
                    <td class="col price"><%# Eval("Delivery_Status") %></td>
                    <td class="col gender"><%# Eval("Order_ID") %></td>
                    <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Delivery_ID") %>', 'dropdownDisplay<%# Eval("Delivery_ID") %>')">
                        <div class="eclipse-display" id="dropdownDisplay<%# Eval("Delivery_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                        <div class="eclipse-list" id="dropdownList<%# Eval("Delivery_ID") %>">
                            <div>
                                <asp:HyperLink ID="update" runat="server" NavigateUrl='<%# "UpdateDelivery.aspx?DeliveryID=" + Eval("Delivery_ID") %>' Text="View/Update" style="text-decoration: none; color: grey;"></asp:HyperLink>
                            </div>
                            <div>
                                <asp:HyperLink ID="viewOrder" runat="server" NavigateUrl='<%# "../AdminOrder/OrderItem.aspx?OrderID=" + Eval("Order_ID") %>' Text="View Order" style="text-decoration: none; color: grey;"></asp:HyperLink>
                            </div>
                            <div onclick="showDeleteModal(<%# Eval("Delivery_ID") %>);">Delete</div>
                        </div>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <asp:Label ID="noDeliveryLabel" runat="server" Text="No delivery records found." CssClass="no-delivery-label" Visible="false" />
    </div>
    <div style="margin-bottom: 80px;"></div>
    <asp:HiddenField ID="hiddenDeliveryId" Value="" runat="server" />
    <asp:Button ID="hiddenDeleteButton" runat="server" Text="Delete" OnClick="btnRemoveDelivery_Click" Style="display:none;" />
    <footer>
        <script type="text/javascript">
            function isNumber(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }

            function showDeleteModal(deliveryId) {
                Swal.fire({
                    title: 'Are you sure?',
                    html: "<strong>You are about to delete the delivery with ID:</strong> <span style='color: red;'>" + deliveryId + "</span>.<br>This action cannot be undone!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('<%= hiddenDeliveryId.ClientID %>').value = deliveryId;
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

            document.getElementById('<%= searchBox.ClientID %>').onkeyup = function () {
                __doPostBack('<%= searchBox.ClientID %>', '');
            };
        </script>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>
</asp:Content>
