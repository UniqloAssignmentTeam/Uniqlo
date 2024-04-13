﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Discount.aspx.cs" Inherits="Uniqlo.AdminPages.Discount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link href="../../css/productAdmin.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        .dropdown-container {
            margin-left: -150px;
        }
        .wear{
            flex-basis:10%;
        }
        .price{
            flex-basis:15%;
        }
       

    </style>

    <div class="productBody">
        <h2>UNIQLO DISCOUNT</h2>
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
                            <div onclick="selectOption('Valid', 'dropdownDisplay')">Valid</div>
                            <div onclick="selectOption('Invalid', 'dropdownDisplay')">Invalid</div>
                        </div>
                    </div>
                </div>
                <div class="btnExcel-Add">
                    <button class="excel-export" style="color: #6F6F6F; font-size: 1rem; font-weight: 400;">Export</button>
                    <a href="addDiscount.aspx" style="text-decoration: none; color: #6F6F6F;">
                        <div class="product-add">➕ Add Discount</div>
                    </a>
                </div>
            </div>
        </div>
        <div class="table">
            <!--Header-->
            <div class="row">
                <div class="col productid">Discount ID</div>
                <div class="col name">Product ID</div>
                <div class="col wear">Amount</div>
                <div class="col price">Status</div>
                <div class="col gender">Start Date</div>
                <div class="col category">End Date</div>
                <div class="col eclipse-container">
                    <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                </div>
            </div>
            <!--Product 1-->
            <div class="row">
                <div class="col productid">1001</div>
                <div class="col name">Product Name</div>
                <div class="col wear">Valid</div>
                <div class="col price">100.00</div>
                <div class="col gender">11/2/2024</div>
                <div class="col category">15/2/2024</div>
                <div class="col eclipse-container" onclick="toggleDropdown('dropdownList3', 'dropdownDisplay3')">
                    <div class="eclipse-display" id="dropdownDisplay3" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true" style="color:#6F6F6F;"></i></div>
                    <div class="eclipse-list" id="dropdownList3">
                        <a href="UpdateDiscount.aspx" style="text-decoration:none; color:#6F6F6F;">
                            <div>Update</div>
                        </a>
                        <div>Delete</div>
                    </div>
                </div>
            </div>
            <!--Product 2-->
            <div class="row">
                <div class="col productid">1002</div>
                <div class="col name">Product Name</div>
                <div class="col wear">Low In Stock</div>
                <div class="col price">99.00</div>
                <div class="col gender">Gender</div>
                <div class="col category">Category</div>
                <div class="col eclipse-container">
                    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                </div>
            </div>
            <!--Product 3-->
            <div class="row">
                <div class="col productid">1003</div>
                <div class="col name">Product Name</div>
                <div class="col wear">In Stock</div>
                <div class="col price">130.00</div>
                <div class="col gender">Gender</div>
                <div class="col category">Category</div>
                <div class="col eclipse-container">
                    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                </div>
            </div>
            <!--Product 4-->
            <div class="row">
                <div class="col productid">1004</div>
                <div class="col name">Product Name</div>
                <div class="col  wear">In Stock</div>
                <div class="col price">12.00</div>
                <div class="col gender">Gender</div>
                <div class="col category">jefferozf@gmail.com</div>
                <div class="col eclipse-container">
                    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                </div>
            </div>
            <!--Product 5-->
            <div class="row">
                <div class="col productid">1005</div>
                <div class="col name">Product Name</div>
                <div class="col wear">Low In Stock</div>
                <div class="col price">112.00</div>
                <div class="col gender">Gender</div>
                <div class="col category">asdasd</div>
                <div class="col eclipse-container">
                    <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                </div>
            </div>
        </div>

        <div class="viewMoreSection">
            <   1..10  >
        </div>

        

     

    </div>

    <footer>
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
    </footer>

</asp:Content>
