<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DiscountHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminDiscount.DiscountHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
   
    
    <link href="../../css/Admin/adminDiscount.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
     <asp:ScriptManager ID="ScriptManagerDiscount" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelDiscount" runat="server">
<ContentTemplate>


    <div class="productBody">
        <h2>UNIQLO DISCOUNT MANAGEMENT</h2>
        <div class="crudProduct">
            <div class="wrap-items-search-buttons">
                <div class="search">
                    <span class="material-symbols-outlined">search</span>
                  <asp:TextBox ID="searchBox" runat="server" CssClass="search-input" AutoPostBack="true" OnTextChanged="searchBox_TextChanged"  placeholder="Search Product Name"></asp:TextBox>
       
                </div> 
                

                <div class="dropdown-wrapper">
 <asp:DropDownList ID="statusSortDDL" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="statusSortDDL_SelectedIndexChanged" CssClass="dropdown-display">
 <asp:ListItem Value="">All Status</asp:ListItem>
 <asp:ListItem Value="Active">Active</asp:ListItem>
  <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
</asp:DropDownList>
                </div>

                <div class="btnExcel-Add">
                    <asp:Button ID="excelExport" runat="server" Text="Export" CssClass="excel-export" OnClick="btnExport_Click"/>
                    <asp:Button ID="addDiscountBtn" runat="server" Text="➕ Add Discount" CssClass="product-add" Onclick="addDiscountBtn_Click"/>
                </div>
                
            </div>
        </div>


        


        


           <asp:Repeater ID="discountRepeater" runat="server" ViewStateMode="Disabled" >

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
 </div>

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

         <div> <asp:HyperLink ID="updateDiscount" runat="server" NavigateUrl='<%# "UpdateDiscount.aspx?DiscountID=" + Eval("Discount_ID") %>' Text="Update"></asp:HyperLink></div>
       <div onclick="showDeleteModal(<%# Eval("Discount_ID") %>);">Delete</div>

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
        <asp:AsyncPostBackTrigger ControlID="statusSortDDL" EventName="SelectedIndexChanged" />
        <asp:PostBackTrigger ControlID="excelExport" />
         <asp:AsyncPostBackTrigger ControlID="searchBox" EventName="TextChanged" />
    </Triggers>


       </asp:UpdatePanel>

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
            <p>Are you sure you want to remove this discount? </p>
            <b><span style="font-size:30px;">ID:</span></b> <span id="modalDiscountId" style="font-size:30px; color:red;"></span>
            <div class="confirmationClearFix">
                <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="confirmationCancelbtn" OnClick="cancelRemoveDiscount_Click"/>
                 <asp:Button ID="btnRemoveDiscount" runat="server" Text="Delete" CssClass="confirmationDeletebtn" OnClick="btnRemoveDiscount_Click"/>
               
            </div>
        </div>
    </div>
</div>


       <asp:HiddenField ID="hiddenDiscountId" runat="server" Value="" />

    <footer>
        <script type="text/javascript">
            function showDeleteModal(discountId) {
                document.getElementById('<%= hiddenDiscountId.ClientID %>').value = discountId;
                document.getElementById('id01').style.display = 'block';
                document.getElementById('modalDiscountId').innerText = discountId;
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
