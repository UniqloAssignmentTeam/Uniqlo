<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Uniqlo.AdminPages.Staff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link href="../../css/Admin/adminStaff.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
       
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
<!--Header-->   --> 

                   
                 <asp:Repeater ID="staffRepeater" runat="server" ViewStateMode="Disabled">

                     <HeaderTemplate>
                          <table class="table">
     <tr>
         <div class="row">

             <div class="col staffid"><td>Staff ID</td></div>
             
         <td class="col name">Staff Name</td>
         <td class="col role">Staff Role</td>
         <td class="col gender">Gender</td>
         <td class="col email">E-mail</td>
         <td class="col contactNo">Contact No</td>
         </div>
     </tr>
     
                     </HeaderTemplate>

                     <ItemTemplate>

                         <tr class="row">
                            
 <td class="col staffid"><asp:Label ID="staffID" runat="server" Text='<%# Eval("Staff_ID") %>'></asp:Label></td>
<td class="col name"><asp:Label ID="staffName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
<td class="col role"><asp:Label ID="role" runat="server" Text='<%# Eval("Role") %>'></asp:Label></td>
<td class="col gender"><asp:Label ID="gender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label></td>
<td class="col email"><asp:Label ID="email" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
<td class="col contactNo"><asp:Label ID="contactNo" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label></td>

                             
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
