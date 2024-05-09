<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DiscountHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDiscount.DiscountHome" %>
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
          
            <!--Product 1-->
            <div class="row">
                
            </div>
        </div>


        


                             <asp:Repeater ID="staffRepeater" runat="server" ViewStateMode="Disabled" >

                     <HeaderTemplate>
                          <table style="width:100%" class="table">
     <tr class="row">
        

        <td class="col discountId">Discount ID</td>
         <td class="col name">Product Name</td>
         <td class="col price">Amount</td>
         <td class="col wear">Status</td>
         <td class="col startDate">Start Date</td>
         <td class="col endDate">End Date</td>
       <td class="col eclipse-display">
    <asp:Button ID="Button2" runat="server" Text="Button" Visible="False" />
 </div>

     </tr>
     
                     </HeaderTemplate>

                     <ItemTemplate>

                         <tr class="row">
                            
 <td class="col discountId"><asp:Label ID="discountId" runat="server" Text='<%# Eval("Discount_ID") %>'></asp:Label></td>
<td class="col name"><asp:Label ID="productName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
<td class="col price"><asp:Label ID="price" runat="server" Text='<%# Eval("Role") %>'></asp:Label></td>
<td class="col wear"><asp:Label ID="wear" runat="server" Text='<%# Eval("Gender") %>'></asp:Label></td>
<td class="col startDate"><asp:Label ID="startDate" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
<td class="col endDate"><asp:Label ID="endDate" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label></td>


<td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Staff_ID") %>', 'dropdownDisplay<%# Eval("Staff_ID") %>')">   
      <div class="eclipse-display" id="dropdownDisplay<%# Eval("Staff_ID") %>" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
      <div class="eclipse-list" id="dropdownList<%# Eval("Staff_ID") %>">

         <div> <asp:HyperLink ID="updateStaff" runat="server" NavigateUrl='<%# "UpdateStaff.aspx?StaffID=" + Eval("Staff_ID") %>' Text="Update"></asp:HyperLink></div>
       <div onclick="showDeleteModal(<%# Eval("Staff_ID") %>);">Delete</div>

      </div>

</td>
                            
                         </tr>





                     </ItemTemplate>  

                    <FooterTemplate>
                            </table>
                    </FooterTemplate>



                    




                 </asp:Repeater>

     





















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
