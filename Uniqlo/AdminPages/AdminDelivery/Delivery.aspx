<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="Uniqlo.AdminPages.Delivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <style>
        .dropdown-wrapper {
            margin-right: 310px
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
    </style>

    <link href="../../css/Admin/adminDelivery.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <div class="productBody">
        <h2>UNIQLO DELIVERY MANAGEMENT</h2>
        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <span class="material-symbols-outlined">search</span>
                    <input class="search-input" type="search" placeholder="Search" />
                </div>
                <div class="dropdown-wrapper">
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                        <div class="dropdown-display" id="dropdownDisplay">Status</div>
                        <div class="dropdown-list" id="dropdownList">
                            <div onclick="selectOption('Pending', 'dropdownDisplay')">Pending</div>
                            <div onclick="selectOption('In Transit', 'dropdownDisplay')">In Transit</div>
                            <div onclick="selectOption('Delivered', 'dropdownDisplay')">Delivered</div>
                        </div>
                    </div>
                </div>
                <div class="btnExcel-Add">
                    <button class="excel-export" style="color: #6F6F6F; font-size: 1rem; font-weight: bold;">Export</button>


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
                                <asp:HyperLink ID="update" runat="server" NavigateUrl='<%# "UpdateDelivery.aspx?DeliveryID=" + Eval("Delivery_ID") %>' Text="View/Update"></asp:HyperLink></div>
                            <div>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "UpdateDelivery.aspx?DeliveryID=" + Eval("Delivery_ID") %>' Text="View Order"></asp:HyperLink></div>
                            <div onclick="showDeleteModal(<%# Eval("Delivery_ID") %>);">Delete</div>

                        </div>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>


       
       


    </div>
    <div class="pagination">
        <a href="#" class="page-link" onclick="changePage('prev')">&laquo;</a>
        <a href="#" class="page-link active" onclick="changePage(1)">1</a>
        <a href="#" class="page-link" onclick="changePage(2)">2</a>
        <a href="#" class="page-link" onclick="changePage(3)">3</a>
        <a href="#" class="page-link" onclick="changePage(4)">4</a>
        <a href="#" class="page-link" onclick="changePage(5)">5</a>


        <a href="#" class="page-link" onclick="changePage('next')">&raquo;</a>
    </div>
 <!--DELETE CONFIRMATION-->
    <div id="id01" class="confirmationModal">
    <div class="confirmation-modal-content">
        <div class="confirmationContainer">
            <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
            <h1>Remove Delivery</h1>
            <p>Are you sure you want to remove the delivery information?</p>

            <div class="confirmationClearFix">
                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                <asp:Button ID="btnRemoveStaff" runat="server" Text="Remove" OnClick="btnRemoveDelivery_Click" CssClass="confirmationDeletebtn" />
            </div>
        </div>
    </div>
</div>

 <asp:HiddenField ID="hiddenDeliveryId" runat="server" Value="" />
 
   <footer>
       <script>

           function showDeleteModal(deliveryId) {
               document.getElementById('<%= hiddenDeliveryId.ClientID %>').value = deliveryId;  
               document.getElementById('id01').style.display = 'block';  
           }
       </script>
       <script src="../../Javascript/productBtnEclipse.js"></script>
       <script src="../../Javascript/productAdminDDL.js"></script>

       <script src="../../Javascript/Pagination.js"></script>
   </footer>

</asp:Content>
