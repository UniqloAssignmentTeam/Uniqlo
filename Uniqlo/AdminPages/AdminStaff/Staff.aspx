<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Uniqlo.AdminPages.Staff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link href="../../css/Admin/adminStaff.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        .dropdown-wrapper {
            margin-left: -24px;
        }
        .category{
    flex-basis:20%;
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
        <h2>UNIQLO STAFF MANAGEMENT</h2>

        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <span class="material-symbols-outlined">search</span>
                    <input class="search-input" type="search" placeholder="Search" />
                </div>

                <div class="dropdown-wrapper">
                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
                        <div class="dropdown-display" id="dropdownDisplay">Gender</div>
                        <div class="dropdown-list" id="dropdownList">
                            <div onclick="selectOption('Male', 'dropdownDisplay')">Male</div>
                            <div onclick="selectOption('Female', 'dropdownDisplay')">Female</div>
                        </div>
                    </div>

                    <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                        <div class="dropdown-display" id="dropdownDisplay2">Role</div>
                        <div class="dropdown-list" id="dropdownList2">
                            <div onclick="selectOption('Staff', 'dropdownDisplay2')">Staff</div>
                            <div onclick="selectOption('Admin', 'dropdownDisplay2')">Admin</div>
                            <div onclick="selectOption('Manager', 'dropdownDisplay2')">Manager</div>
                        </div>
                    </div>
                </div>

                <div class="btnExcel-Add">
                    <asp:Button ID="excelBtn" runat="server" Text="Export" CssClass="excel-export"/>
                
                     <asp:Button ID="addStaffBtn" runat="server" Text="➕ Add Staff" CssClass="product-add" OnClientClick="addStaff" OnClick="addStaffBtn_Click" />
                </div>
            </div>
        </div>
                <div class="table">
                    
 <!--
<!--Header-->

            --> 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
               <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                <HeaderTemplate>  
                    <table>
                        <tr class="row">
                            <td>
                                 <div class="col productid">Staff ID</div>

                            </td>
                        </tr>
                   
    </HeaderTemplate>  

            <ItemTemplate>   

            </ItemTemplate>  
             <SeparatorTemplate>  
                <tr>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                </tr>  
            </SeparatorTemplate>  

             <AlternatingItemTemplate>  
                <tr>  
                    <td>

                    </td>
                </tr>  
            </AlternatingItemTemplate>
             <SeparatorTemplate>  
                <tr>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                    <td>  
                        <hr />  
                    </td>  
                </tr>  
            </SeparatorTemplate> 
             <FooterTemplate>  
                <tr>  
                    <td>  
                        School Records displayed  
                    </td>  
                </tr>  
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
                <h1>Remove Staff</h1>
                <p>Are you sure you want to remove the staff?</p>
    
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
