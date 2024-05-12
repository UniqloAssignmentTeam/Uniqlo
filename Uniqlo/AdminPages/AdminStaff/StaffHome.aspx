<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StaffHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminStaff.StaffHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">



    <link href="../../css/Admin/adminStaff.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../../css/Admin/ErrorMessage.css" rel="stylesheet" />
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
                         <asp:CustomValidator ID="CustomValidator1" runat="server" ValidateEmptyText="true" ControlToValidate="roleSortDDL" ErrorMessage="Please select a Role" ForeColor="Red" Display="Dynamic" OnServerValidate="ValidateStaffRole_ServerValidate"></asp:CustomValidator>
                   
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
                                            <asp:HyperLink ID="updateStaff" runat="server" NavigateUrl='<%# "UpdateStaff.aspx?StaffID=" + Eval("Staff_ID") %>' Text="Update"></asp:HyperLink>
                                        </div>
                                      <div onclick="showDeleteModal(<%# Eval("Staff_ID") %>);">Delete</div>

                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="roleSortDDL" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="genderSortDDL" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="excelBtn" />
        </Triggers>


    </asp:UpdatePanel>


        <div style="margin-bottom: 80px;">
        </div>

   

    <asp:HiddenField ID="hiddenStaffId" runat="server" Value="" />

    <!--DELETE CONFIRMATION-->
 <div id="id01" class="confirmationModal">
    <div class="confirmation-modal-content">
        <div class="confirmationContainer">
            <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
            <h1>Remove Staff</h1>
            <p>Are you sure you want to remove the staff?</p>
            <label for="userEmail">Enter your email for verification:</label>
            
            <asp:TextBox ID="userEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnSendCode" runat="server" Text="Send Verification Code" CssClass="confirmationSendCodebtn" OnClick="btnSendCode_Click" />

            <div class="confirmationClearFix">
                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                <asp:Button ID="btnRemoveStaff" runat="server" Text="Remove" OnClick="btnRemoveStaff_Click" CssClass="confirmationDeletebtn" OnClientClick="return validateEmail();" Enabled="false" />
            </div>
        </div>
    </div>
</div>




    <footer>
        <script type="text/javascript">
            function showDeleteModal(staffId) {
                document.getElementById('<%= hiddenStaffId.ClientID %>').value = staffId; // Set the staff ID to hidden field
               document.getElementById('<%= userEmail.ClientID %>').value = ''; // Clear the email input
    document.getElementById('id01').style.display = 'block'; // Show the modal
}

function validateEmail() {
                var email = document.getElementById('<%= userEmail.ClientID %>').value;
                var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/; // Simple email validation regex
                if (!regex.test(email)) {
                    alert("Please enter a valid email address.");
                    return false;
                }
                return true;
            }

        </script>

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
