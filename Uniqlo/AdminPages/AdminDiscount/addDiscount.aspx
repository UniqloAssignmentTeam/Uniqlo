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
                    <input type="text" name="productName" value="">
                </div>
                 <div class="form-group">
     <label for="productName">Amount - Discount</label>
     <input type="text" name="productName" value="">
 </div>
                           
              

                <div class="form-group">
                    <label for="productName">Start Date</label>
                    <input class="form-field" type="date" value="">
                </div>
                  <div class="form-group">
      <label for="productName">End Date</label>
      <input class="form-field" type="date" value="">
  </div>

                
              
            </div>

          
            <div class="button-container">
                <div class="cancel-div">
                    <a href="Discount.aspx" class="cancel-button">CANCEL</a>
                </div>
                <div class="continue-div">
                    <a href="Discount.aspx" class="continue-button">ADD</a>
                </div>
            </div>
        </div>
    </div>
    


        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>





</asp:Content>
