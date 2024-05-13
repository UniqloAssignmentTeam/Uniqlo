<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="addDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.addDiscount"%>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

                <header>
                   
                    <link href="../../css/Admin/addDiscount.css" rel="stylesheet" />
                    <style>
                        .scrollable-dropdown {
                            max-height: 150px; 
                            overflow-y: auto;  
                        }
                    </style>
        </header>
       
 
 
 
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO ADD DISCOUNT</h2>
        </div>

        <div class="modal-content">
           

            <div class="product-content">
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    
                   <asp:DropDownList ID="DdlProductName" runat="server" CssClass="scrollable-dropdown dropdown-display">
</asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidatorProduct" runat="server" ValidateEmptyText="true" ControlToValidate="DdlProductName" ErrorMessage="Please select a product" ForeColor="Red" Display="Dynamic" OnServerValidate="ValidateProductName_ServerValidate"></asp:CustomValidator>
                    
                </div>

               
                 <div class="form-group">
     <label for="discountAmount">Amount - Discount</label>
         <asp:TextBox ID="discountAmount" runat="server"></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegexValidatorDiscountAmount" runat="server" ControlToValidate="discountAmount"
     ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Invalid discount amount" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="discountAmount"
ErrorMessage="Discount amount is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RangeValidator ID="RangeValidatorDiscountAmount" runat="server"
        ControlToValidate="discountAmount"
        MinimumValue="0.01" MaximumValue="300"
        Type="Currency"
        ErrorMessage="Discount amount must be between RM 0.01 and RM 300" ForeColor="Red" Display="Dynamic">
    </asp:RangeValidator>
 </div>
                        



                <div class="form-group">
                    <label for="productName">Start Date</label>
                      <asp:TextBox ID="startDate" runat="server"  type="date"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="startDate"
ErrorMessage="Start date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:CustomValidator ID="CustomValidatorDate" runat="server" ControlToValidate="startDate" ErrorMessage="Start date must be before end date" ForeColor="Red" Display="Dynamic" OnServerValidate="CustomValidatorDate_ServerValidate"></asp:CustomValidator>
                </div>

      <div class="form-group">
      <label for="productName">End Date</label>
       <asp:TextBox ID="endDate" runat="server"  type="date"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="endDate"
ErrorMessage="End date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
  </div> 
            </div>
            <asp:Label ID="eventLinkLabel" runat="server" Visible="false"></asp:Label>
          
            <div class="button-container">
              
                     <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancel-button" Onclick="cancelBtn_Click"/>
                     <asp:Button ID="addBtn" runat="server" Text="ADD" CssClass="continue-button" CausesValidation="true" Onclick="addBtn_Click"/>
            </div>
        </div>
    </div>
   
   

        <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>





</asp:Content>
