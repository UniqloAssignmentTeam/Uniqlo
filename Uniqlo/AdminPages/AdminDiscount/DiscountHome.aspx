<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DiscountHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDiscount.DiscountHome" %>
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
    </header>


    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link href="../../css/Admin/adminDiscount.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />



    <asp:ScriptManager ID="ScriptManagerDiscount" runat="server" />
<asp:UpdatePanel ID="UpdatePanelDiscount" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="productBody">
            <h2>UNIQLO DISCOUNT MANAGEMENT</h2>
            <div class="crudProduct">
                <div class="wrap-items-search-buttons">
                    <div class="search">
                        <span class="material-symbols-outlined">search</span>
                        <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged" placeholder="Search Product Name"></asp:TextBox>
                    </div>
                    <div class="dropdown-wrapper">
                        <asp:DropDownList ID="statusSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="statusSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
                            <asp:ListItem Value="">All Status</asp:ListItem>
                            <asp:ListItem Value="Active">Active</asp:ListItem>
                            <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="btnExcel-Add">
                        <asp:Button ID="excelExport" runat="server" Text="Export" CssClass="excel-export" OnClick="btnExport_Click"/>
                        <asp:Button ID="addDiscountBtn" runat="server" Text="➕ Add Discount" CssClass="product-add" Onclick="addDiscountBtn_Click" />
                    </div>
                </div>
            </div>
            <asp:Repeater ID="discountRepeater" runat="server" ViewStateMode="Disabled">
                <HeaderTemplate>
                    <table style="width:100%" class="table">
                        <tr class="row">
                            <td class="col discountId">Discount ID</td>
                            <td class="col name">Product Name</td>
                            <td class="col price">Amount Discount</td>
                            <td class="col wear">Status</td>
                            <td class="col startDate">Start Date</td>
                            <td class="col endDate">End Date</td>
                            <td class="col eclipse-display">
                                <asp:Button ID="Button2" runat="server" Text="Button" Visible="False" />
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="row">
                        <td class="col discountId"><asp:Label ID="discountIdLabel" runat="server" Text='<%# Eval("Discount_ID") %>'></asp:Label></td>
                        <td class="col name"><asp:Label ID="productName" runat="server" Text='<%# Eval("Product.Product_Name") %>'></asp:Label></td>
                        <td class="col price"><asp:Label ID="price" runat="server" Text='<%# Eval("Discount_Amount","{0:C}") %>'></asp:Label></td>
                        <td class="col wear"><asp:Label ID="wear" runat="server" Text='<%# Eval("Status") %>'></asp:Label></td>
                        <td class="col startDate"><asp:Label ID="startDate" runat="server" Text='<%# Eval("Start_Date", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                        <td class="col endDate"><asp:Label ID="endDate" runat="server" Text='<%# Eval("End_Date", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                        <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Discount_ID") %>', 'dropdownDisplay<%# Eval("Discount_ID") %>')">   
                            <div class="eclipse-display" id="dropdownDisplay<%# Eval("Discount_ID") %>" style="border:none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                            <div class="eclipse-list" id="dropdownList<%# Eval("Discount_ID") %>">
                                <div><asp:HyperLink ID="updateDiscount" runat="server" NavigateUrl='<%# "UpdateDiscount.aspx?DiscountID=" + Eval("Discount_ID") %>' Text="Update" CssClass="hyperlink"></asp:HyperLink></div>
                                <div onclick="showDeleteSweet(<%# Eval("Discount_ID") %>);">Delete</div>
                            </div>
                        </td>

                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
           <asp:Label ID="noDiscount" runat="server" Text="No Discounts Available" CssClass="no-discount-label" Visible="false"></asp:Label>

        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="statusSortDDL" EventName="SelectedIndexChanged" />
        <asp:PostBackTrigger ControlID="excelExport" />
        <asp:AsyncPostBackTrigger ControlID="searchBox" EventName="TextChanged" />
    </Triggers>
</asp:UpdatePanel>

        <div style="margin-bottom: 80px;">
        </div>


     <!--DELETE CONFIRMATION-->
    <asp:HiddenField ID="hiddenDiscountId" runat="server" />
<asp:Button ID="hiddenDeleteButton" runat="server" Text="Delete" OnClick="btnRemoveDiscount_Click" Style="display:none;" />


    <footer>
      <script type="text/javascript">
          // Handle search box on keyup event
          document.getElementById('<%= searchBox.ClientID %>').onkeyup = function () {
              __doPostBack('<%= searchBox.UniqueID %>', '');
    };

    function showDeleteSweet(discountId) {
        Swal.fire({
            title: 'Are you sure?',
            html: "<strong>You are about to delete the discount with ID:</strong> <span style='color: red;'>" + discountId + "</span>.<br>This action cannot be undone!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('<%= hiddenDiscountId.ClientID %>').value = discountId;
                __doPostBack('<%= hiddenDeleteButton.UniqueID %>', '');
            }
        });
          }

          function showDeleteSuccess() {
              Swal.fire({
                  title: 'Deleted!',
                  text: 'The discount has been successfully deleted.',
                  icon: 'success',
                  confirmButtonText: 'Ok'
              }).then((result) => {
                  if (result.isConfirmed) {
                      window.location.href = window.location.href; // This will reload the page
                  }
              });
          }

          function showAlert(type, title, message) {
              Swal.fire({
                  icon: type,
                  title: title,
                  text: message,
                  timer: 5000,
                  timerProgressBar: true,
                  showConfirmButton: false
              });
          }

          function showExportSuccess() {
              Swal.fire({
                  icon: 'success',
                  title: 'Export Successful',
                  text: 'The discounts have been successfully exported to Excel.',
                  timer: 5000,
                  timerProgressBar: true,
                  showConfirmButton: false
              });
          }
      </script>





           
      

     
        
        <script src="../../Javascript/productBtnEclipse.js"></script>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script src="../../Javascript/Pagination.js"></script>
    </footer>

</asp:Content>
