<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
                        <header>
                            <link href="../../css/Admin/addDiscount.css" rel="stylesheet" />
      </header>
     
 
 
 
         <div class="container">
      <div class="productItemCard">
          <h2 class="product-title">UNIQLO UPDATE DISCOUNT</h2>
      </div>
      <div class="modal-content">
          

          <div class="product-content">

              <div class="form-group">
     <label for="discountID">Discount ID</label>
        <asp:TextBox ID="discountID" runat="server" Enabled="False"></asp:TextBox>
 </div>
          


                           


             <div class="form-group">
     <label for="productName">Product Name</label>
     
     <asp:DropDownList ID="DdlProductName" runat="server" CssClass="scrollable-dropdown dropdown-display"></asp:DropDownList>
    
     
 </div>
                                   


    <div class="form-group">
    <label for="discountAmount">Amount - Discount</label>
      <asp:TextBox ID="discountAmount" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredValidatorDiscountAmount" runat="server" ControlToValidate="discountAmount"
        ErrorMessage="Discount amount is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegexValidatorDiscountAmount" runat="server" ControlToValidate="discountAmount"
        ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Invalid discount amount" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
    ControlToValidate="discountAmount"
    ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Please enter a number. Optionally, you can use up to two decimal places." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>

</div>


                            <div class="form-group">
  <label for="productName">Status</label>
  <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
      <asp:DropDownList ID="status" runat="server" CssClass="dropdown-display">
          <asp:ListItem>Active</asp:ListItem>
          <asp:ListItem>Inactive</asp:ListItem>
      </asp:DropDownList>
  </div>
             </div>
            


              <div class="form-group">
                  <label for="productName">Start Date</label>
                    <asp:TextBox ID="startDate" runat="server" type="date"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="startDate"
 ErrorMessage="Start date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
              </div>
                <div class="form-group">
    <label for="productName">End Date</label>
    <asp:TextBox ID="endDate" runat="server" type="date"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="endDate"
ErrorMessage="End date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
</div>

              
            
          </div>

        
          <div class="button-container">
    
         
<asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button" CausesValidation="false" OnClick="cancelBtn_Click"/>
 <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button" CausesValidation="true" OnClick="updateBtn_Click" />
  </div>
      </div>
  </div>
  


      <footer>
      <script src="../../Javascript/productAdminDDL.js"></script>
          </footer>

</asp:Content>
