<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Discount1.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDiscount.Discount1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">



    <link href="../../css/Admin/Discount1.css" rel="stylesheet" />
    <link href="../../css/Admin/neww.css" rel="stylesheet" />
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
                    <input class="search-input" type="search" placeholder="Search" />
                </div>


                <div class="dropdown-wrapper">
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                        <div class="dropdown-display" id="dropdownDisplay1">Status</div>
                        <div class="dropdown-list" id="dropdownList">
                            <div onclick="selectOption('Valid', 'dropdownDisplay')">Valid</div>
                            <div onclick="selectOption('Invalid', 'dropdownDisplay')">Invalid</div>
                        </div>
                    </div>
                    
                </div>

               
       
              <asp:DropDownList runat="server" ID="ddlStatus" CssClass="dropdown-display">
    <asp:ListItem Text="Status"></asp:ListItem>
    <asp:ListItem Text="Valid" Value="Valid"></asp:ListItem>
    <asp:ListItem Text="Invalid" Value="Invalid"></asp:ListItem>
</asp:DropDownList>

                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-display">
                    <asp:ListItem>Valid</asp:ListItem>
                    <asp:ListItem>Invalid</asp:ListItem>
                </asp:DropDownList>






                <div class="btnExcel-Add">
                    <asp:Button ID="exportBtn" runat="server" Text="Export" CssClass="excel-export"/>
                    <asp:Button ID="Button2" runat="server" Text="➕ Add Discount" CssClass="product-add" OnClick="BtnDiscountAdd"/>
                    
                </div>
            </div>
        </div>
       
      
                  
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand"></asp:Repeater>







         <!--DELETE CONFIRMATION-->
        <div id="id01" class="confirmationModal">
            <div class="confirmation-modal-content">
                <div class="confirmationContainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
                    <h1>Remove Discount</h1>
                    <p>Are you sure you want to remove this discount?</p>

                    <div class="confirmationClearFix">
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationDeletebtn">Remove</button>
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
