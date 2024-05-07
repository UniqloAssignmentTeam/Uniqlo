<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductHome.aspx.cs" Inherits="Uniqlo.AdminPages.AdminProduct.ProductHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
        <header>
        <link href="../../css/Admin/adminProduct.css" rel="stylesheet" />
       <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
       <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <style>
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
    </header>

   <div class="productBody">
      <h2>UNIQLO PRODUCT MANAGEMENT</h2>
      <div class="crudProduct">
         <div class="wrap-items-search-buttons">
            <div class="search">
               <span class="material-symbols-outlined">search</span>
               <input class="search-input" type="search" placeholder="Search" />
            </div>
            <div class="dropdown-wrapper">
             
     <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
         <div class="dropdown-display" id="dropdownDisplay">Category</div>
         <div class="dropdown-list" id="dropdownList">
             <div onclick="selectOption('Tops', 'dropdownDisplay')">Tops</div>
             <div onclick="selectOption('Bottom', 'dropdownDisplay')">Bottoms</div>
         </div>
     </div>
               <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                  <div class="dropdown-display" id="dropdownDisplay2">Gender</div>
                  <div class="dropdown-list" id="dropdownList2">
                     <div onclick="selectOption('Men', 'dropdownDisplay2')">Men</div>
                     <div onclick="selectOption('Women', 'dropdownDisplay2')">Women</div>
                    
                  </div>
               </div>
            </div>
             <div class="btnExcel-Add">
                 <asp:Button ID="excelBtn" runat="server" Text="Export" CssClass="excel-export" />
                 <asp:Button ID="addProdBtn" runat="server" Text="➕ Add Product" CssClass="product-add" style="color: #6F6F6F; text-decoration: none; font-size: 1rem; font-weight: bold;" OnClick="addProdBtn_Click" />
             </div>
         </div>
      </div>

       <div class="table">
           <asp:Repeater ID="prodRepeater" runat="server" ViewStateMode="Disabled">

               <HeaderTemplate>
                   <table style="width: 100%" class="table">
                       <tr class="row">
                           <td class="col productid">Product ID</td>
                           <td class="col name">Product Name</td>
                           <td class="col wear">Category</td>
                           <td class="col price">Price</td>
                           <td class="col gender">Gender</td>
                           <td class="col eclipse-display">
                               <asp:Button ID="Button2" runat="server" Text="Button" Visible="False" />
                           </div>
                       </tr>
               </HeaderTemplate>

               <ItemTemplate>

                   <tr class="row">

                       <td class="col productid">
                           <asp:Label ID="prodID" runat="server" Text='<%# Eval("Product_ID") %>'></asp:Label>
                       </td>
                       <td class="col name">
                           <asp:Label ID="prodName" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                       </td>
                       <td class="col wear">
                           <asp:Label ID="categoryName" runat="server" Text='<%# Eval("Category.Name") %>'></asp:Label>
                       </td>
                       <td class="col price">
                           <asp:Label ID="price" runat="server" Text='<%# Eval("Price", "{0:C}") %>'></asp:Label>
                       </td>
                       <td class="col gender">
                           <asp:Label ID="gender" runat="server" Text='<%# Eval("Category.Gender").ToString() == "M" ? "Men " : (Eval("Category.Gender").ToString() == "W" ? "Woman" : "Not Specified") %>'></asp:Label>
                       </td>


                       <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Product_ID") %>', 'dropdownDisplay<%# Eval("Product_ID") %>')">
                           <div class="eclipse-display" id="dropdownDisplay<%# Eval("Product_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                           <div class="eclipse-list" id="dropdownList<%# Eval("Product_ID") %>">

                               <div>
                                   <asp:HyperLink ID="viewProduct" runat="server" NavigateUrl='<%# "viewMoreProduct.aspx?ProdID=" + Eval("Product_ID") %>' Text="View More" style="text-decoration:none; color: #6F6F6F"></asp:HyperLink>
                               </div>
                               <div>
                                   <asp:HyperLink ID="updateProduct" runat="server" NavigateUrl='<%# "UpdateProduct.aspx?ProdID=" + Eval("Product_ID") %>' Text="Update" style="text-decoration:none; color: #6F6F6F"></asp:HyperLink>
                               </div>
                               <div onclick="showDeleteModal(<%# Eval("Product_ID") %>);">Delete</div>

                           </div>

                       </td>

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
        <asp:HiddenField ID="hiddenProductId" runat="server" Value="" />


        <!--DELETE CONFIRMATION-->
       <div id="id01" class="confirmationModal">
           <div class="confirmation-modal-content">
               <div class="confirmationContainer">
                   <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
                   <h1>Remove Product</h1>
                   <p>Are you sure you want to remove the product?</p>

                   <div class="confirmationClearFix">
                       <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                       <asp:Button ID="btnRemoveProduct" runat="server" Text="Remove" OnClick="btnRemoveProduct_Click" CssClass="confirmationDeletebtn" />
                   </div>
               </div>
           </div>
       </div>
           <!--DELETE CONFIRMATION END-->

       </div>
 
   
   <footer>
       <script type="text/javascript">
           function showDeleteModal(staffId) {
               document.getElementById('<%= hiddenProductId.ClientID %>').value = staffId;  // Set the staff ID to hidden field
               document.getElementById('id01').style.display = 'block';  // Show the modal
           }
       </script>
       <script src="../../Javascript/Pagination.js"></script>
      <script src="../../Javascript/productBtnEclipse.js"></script>
      <script src="../../Javascript/productAdminDDL.js"></script>

   </footer>
</asp:Content>
