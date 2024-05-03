<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.addDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

                <header>
                   
                    <link href="../../css/Admin/addDiscount.css" rel="stylesheet" />
        </header>
       
 
 
 
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO ADD DISCOUNT</h2>
        </div>
        <div class="modal-content">
           

            <div class="product-content">
                <div class="form-group">
                    <label for="productName">Product ID</label>
                     <asp:TextBox ID="productName" runat="server"></asp:TextBox>
                </div>

               
                 <div class="form-group">
     <label for="productDiscount">Amount - Discount</label>
         <asp:TextBox ID="productDiscount" runat="server"></asp:TextBox>
 </div>
                        



                <div class="form-group">
                    <label for="productName">Start Date</label>
                      <asp:TextBox ID="startDate" runat="server"  type="date"></asp:TextBox>
                </div>

      <div class="form-group">
      <label for="productName">End Date</label>
       <asp:TextBox ID="endDate" runat="server"  type="date"></asp:TextBox>
  </div> 
            </div>

          
            <div class="button-container">
              
                     <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button"/>
                     <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button"/>
            </div>
        </div>
    </div>
   


        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>





</asp:Content>
