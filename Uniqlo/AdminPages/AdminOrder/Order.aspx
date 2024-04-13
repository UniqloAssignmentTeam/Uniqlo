<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Uniqlo.AdminPages.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
    <link href="../../css/Admin/adminOrder.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
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
    </style>

    <div class="productBody">
        <h2>UNIQLO ORDER HISTORY</h2>

        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <span class="material-symbols-outlined">search</span>
                    <input class="search-input" type="search" placeholder="Search" />
                </div>
                <div class="btnExcel-Add">
                    <button class="excel-export" style="color: #6F6F6F; font-weight:bold;">Export</button>
                </div>
            </div>
        </div>

        <div class="table">
            <!-- Header -->
            <div class="row">
                <div class="col productid">Order ID</div>
                <div class="col name">Customer Name</div>
                <div class="col price">Order Number</div>
                <div class="col gender">Total Amount</div>
                <div class="col category">Total Item</div>
                <div class="col wear">Date</div>
                <div class="col eclipse-container">
                    <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                </div>
            </div>

            <!-- Product 1 -->
            <div class="row">
                <div class="col productid">1001</div>
                <div class="col name">Janice Lee</div>
                <div class="col price">111</div>
                <div class="col gender">RM 109.90</div>
                <div class="col category">1</div>
                <div class="col wear">14/3/2024</div>
                <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">
                    <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                    <div class="eclipse-list" id="dropdownList3">
                        <a href="OrderItem.aspx" style="text-decoration: none; color: #6F6F6F;"><div>View More</div></a>
                    </div>
                </div>
            </div>

            <!-- Product 2 -->
            <div class="row">
                <div class="col productid">1002</div>
                <div class="col name">Jeffer Ooi</div>
                <div class="col price">112</div>
                <div class="col gender">RM 100.00</div>
                <div class="col category">4</div>
                <div class="col wear">14/3/2024</div>
                <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
            </div>

            <!-- Product 3 -->
            <div class="row">
                <div class="col productid">1003</div>
                <div class="col name">Oh Beng Yee</div>
                <div class="col price">113</div>
                <div class="col gender">RM 12.00</div>
                <div class="col category">8</div>
                <div class="col wear">14/3/2024</div>
                <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
            </div>

            <!-- Product 4 -->
            <div class="row">
                <div class="col productid">1004</div>
                <div class="col name">Tan Chee Han</div>
                <div class="col price">114</div>
                <div class="col gender">RM 45.00</div>
                <div class="col category">12</div>
                <div class="col wear">12/3/2024</div>
                <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
            </div>

            <!-- Product 5 -->
            <div class="row">
                <div class="col productid">1005</div>
                <div class="col name">Yip Yong</div>
                <div class="col price">115</div>
                <div class="col gender">RM 50.00</div>
                <div class="col category">1</div>
                <div class="col wear">12/3/2024</div>
                <div class="col eclipse-container"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
            </div>
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
    </div>

    <footer>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
    </footer>
</asp:Content>
