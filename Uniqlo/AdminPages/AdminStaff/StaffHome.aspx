<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StaffHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminStaff.StaffHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
           <style>
           .hyperlink{
                color: #6F6F6F;
text-decoration: none;
           }
                       .no-discount-label {
    color: red;
    font-size: 16px;
    margin-top: 20px;
    display: block;
    text-align: center;
}
       </style>

    <link href="../../css/Admin/adminStaff.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />


        </header>
    <asp:ScriptManager ID="ScriptManagerStaff" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelStaff" runat="server">
        <ContentTemplate>



            <div class="productBody">
                <h2>UNIQLO STAFF MANAGEMENT</h2>

                <div class="crudProduct">


                    <div class="wrap-items-search-buttons">


                        <div class="search">
                            <span class="material-symbols-outlined">search</span>
                           <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged"  placeholder="Search Staff Name"></asp:TextBox>
                        </div>

                        <div class="dropdown-wrapper">

                            <asp:DropDownList ID="genderSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="genderSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">All Genders</asp:ListItem>
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:DropDownList>
            
                            <asp:DropDownList ID="roleSortDDL" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="roleSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
                                <asp:ListItem Value="">All Roles</asp:ListItem>
                                <asp:ListItem Value="Staff">Staff</asp:ListItem>
                                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                <asp:ListItem Value="Manager">Manager</asp:ListItem>
                            </asp:DropDownList>
                       
                   
                        </div>

                        <div class="btnExcel-Add">
                            <asp:Button ID="excelBtn" runat="server" Text="Export" CssClass="excel-export" OnClick="excelBtn_Click" />

                            <asp:Button ID="addStaffBtn" runat="server" Text="➕ Add Staff" CssClass="product-add" OnClick="addStaffBtn_Click" />
                        </div>
                    </div>
                </div>


                <div class="table">


                    <!--Header-->


                    <asp:Repeater ID="staffRepeater" runat="server" ViewStateMode="Disabled">

                        <HeaderTemplate>
                            <table style="width: 100%" class="table">
                                <tr class="row">


                                    <td class="col staffid">Staff ID</td>
                                    <td class="col name">Staff Name</td>
                                    <td class="col role">Staff Role</td>
                                    <td class="col gender">Gender</td>
                                    <td class="col email">E-mail</td>
                                    <td class="col contactNo">Contact No</td>
                                    <td class="col eclipse-display">
                                        <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                                    </div>
                                </tr>
                        </HeaderTemplate>

                        <ItemTemplate>

                            <tr class="row">

                                <td class="col staffid">
                                    <asp:Label ID="staffID" runat="server" Text='<%# Eval("Staff_ID") %>'></asp:Label></td>
                                <td class="col name">
                                    <asp:Label ID="staffName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                <td class="col role">
                                    <asp:Label ID="role" runat="server" Text='<%# Eval("Role") %>'></asp:Label></td>
                                <td class="col gender">
                                    <asp:Label ID="gender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label></td>
                                <td class="col email">
                                    <asp:Label ID="email" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
                                <td class="col contactNo">
                                    <asp:Label ID="contactNo" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label></td>


                                <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Staff_ID") %>', 'dropdownDisplay<%# Eval("Staff_ID") %>')">
                                    <div class="eclipse-display" id="dropdownDisplay<%# Eval("Staff_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                                    <div class="eclipse-list" id="dropdownList<%# Eval("Staff_ID") %>">

                                        <div>
                                            <asp:HyperLink ID="updateStaff" runat="server" NavigateUrl='<%# "UpdateStaff.aspx?StaffID=" + Eval("Staff_ID") %>' Text="Update" CssClass="hyperlink"></asp:HyperLink>
                                        </div>
                                      <div>
                                          <asp:HyperLink ID="deleteStaff" runat="server" NavigateUrl='<%# "DeleteStaff.aspx?StaffID=" + Eval("Staff_ID") %>' Text="Delete" CssClass="hyperlink"></asp:HyperLink>
                                    </div>
                                      </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                              
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:Label ID="lblNoStaffFound" runat="server" Text="No Staff Found" Visible="false" CssClass="no-discount-label"></asp:Label>
                </div>
       


        <div style="margin-bottom: 80px;">
        </div>

   

    <asp:HiddenField ID="hiddenStaffId" runat="server" Value="" />
    
    <!--DELETE CONFIRMATION-->

  


    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="roleSortDDL" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="genderSortDDL" EventName="SelectedIndexChanged" />
        <asp:PostBackTrigger ControlID="excelBtn" />
       
    </Triggers>


</asp:UpdatePanel>

    <asp:HiddenField ID="modalState" runat="server" Value="closed" />


    <footer>
        

         <script type="text/javascript">
     document.getElementById('<%= searchBox.ClientID %>').onkeyup = function() {
 __doPostBack('<%= searchBox.ClientID %>', '');
     };
         </script>

        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>

        <script src="../../Javascript/Pagination.js"></script>

    </footer>


</asp:Content>
