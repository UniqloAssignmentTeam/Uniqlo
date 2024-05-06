﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DiscountHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDiscount.DiscountHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    
    <link href="../../css/Admin/adminDiscount.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        .dropdown-container {
            margin-left: -150px;
        }
        .category{
            flex-basis:10%;
        }
        .price{
            flex-basis:15%;
        }
       
        .confirmationClearFix{
    width: 100%;
    margin-top: 90px;
}

        /* Add a color to the cancel button */
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
   

        /* Add padding and center-align text to the container */
        .confirmationContainer {
          padding: 16px;
          text-align: center;
        }

        /* The Modal (background) */
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

        /* Modal Content/Box */
        .confirmation-modal-content {
          background-color: #fefefe;
          margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
          border: 1px solid #888;
          width: 80%; /* Could be more or less, depending on screen size */
          height: 400px;
        }


        .confirmation-modal-content h1{
            margin-top: 60px;
        }

        .confirmation-modal-content p{
            margin-top: 30px;
        }
 
        /* The Modal Close Button (x) */
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

        /* Clear floats */
        .confirmationClearFix::after {
          content: "";
          clear: both;
          display: table;
        }

        /* Change styles for cancel button and delete button on extra small screens */
        @media screen and (max-width: 300px) {
          .confirmationCancelbtn, .confirmationDeletebtn {
             width: 100%;
          }
        }
    </style>

    <div class="productBody">
        <h2>UNIQLO DISCOUNT MANAGEMENT</h2>
        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <span class="material-symbols-outlined">search</span>
                    <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" Text="Search"></asp:TextBox>
                </div>
                

                <div class="dropdown-wrapper">
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                        <div class="dropdown-display" id="dropdownDisplay">Status</div>
                        <div class="dropdown-list" id="dropdownList">
                            <div onclick="selectOption('Valid', 'dropdownDisplay')">Valid</div>
                            <div onclick="selectOption('Invalid', 'dropdownDisplay')">Invalid</div>
                        </div>
                    </div>
                </div>

                <div class="btnExcel-Add">
                    <asp:Button ID="excelExport" runat="server" Text="Export" CssClass="excel-export" />
                    <asp:Button ID="Button3" runat="server" Text="➕ Add Discount" CssClass="product-add" />
                </div>
                
            </div>
        </div>


        <div class="table">
            <!--Header-->
            <div class="row">
                <div class="col productid">Discount ID</div>
                <div class="col name">Product Name</div>
                <div class="col category">Amount</div>
                <div class="col price">Status</div>
                <div class="col gender">Start Date</div>
                <div class="col category">End Date</div>
                <div class="col eclipse-container">
                    <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                </div>
            </div>
            <!--Product 1-->
            <div class="row">
                <div class="col productid">1</div>
                <div class="col name">AIRism Cotton Jersey Short Sleeve Skipper Polo Shirt</div>
                <div class="col wear">10.00</div>
                <div class="col price">Active</div>
                <div class="col gender">2024-04-01</div>
                <div class="col category">2024-04-30</div>
                <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">
                    <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true" style="color:#6F6F6F;"></i></div>
                    <div class="eclipse-list" id="dropdownList3">
                        <a href="UpdateDiscount.aspx" style="text-decoration:none; color:#6F6F6F;">
                            <div>Update</div>
                        </a>
                        <div onclick="document.getElementById('id01').style.display='block'">Delete</div>
                    </div>
                </div>
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

         <!--DELETE CONFIRMATION-->
        <div id="id01" class="confirmationModal">
            <div class="confirmation-modal-content">
                <div class="confirmationContainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
                    <h1>Remove Discount</h1>
                    <p>Are you sure you want to remove this discount?</p>

                    <div class="confirmationClearFix">
                        <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="confirmationCancelbtn"/>
                         <asp:Button ID="deleteBtn" runat="server" Text="Delete" CssClass="confirmationDeletebtn"/>
                       
                    </div>
                </div>
            </div>
        </div>

        

    </div>

    <footer>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>

</asp:Content>