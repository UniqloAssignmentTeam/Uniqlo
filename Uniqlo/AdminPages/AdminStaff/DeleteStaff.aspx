<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DeleteStaff.aspx.cs" Inherits="Uniqlo.AdminPages.AdminStaff.DeleteStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../css/Admin/addStaff.css" rel="stylesheet" />

</header>
    <style>
        .confirmationDeletebtn{
            
            width:100px;
            height:50px;
        }
        .confirmationbtn{
    
    width:170px;
    height:50px;
}
    </style>

       <div class="container">
<div class="productItemCard">
    <h2 class="product-title">UNIQLO DELETE STAFF</h2>
</div>
    
                  <div class="modal-content">
       

      
                   
                    <h1>Remove Staff with ID:<asp:Label ID="staffIdlbl" runat="server" Text="Label"></asp:Label></h1>
                    <p>Are you sure you want to remove the staff?</p>
                    <label for="userEmail">Enter your email for verification:</label>
                    <asp:TextBox ID="userEmail" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSendCode" runat="server" Text="Send Verification Code" CssClass="confirmationbtn" AutoPostback="False" OnClick="btnSendCode_Click" />
                      <br />
                      <br />
                      <label for="userEmail">Enter verification code:</label>
                   <asp:TextBox ID="txtVerificationCode" runat="server" Visible="true"></asp:TextBox>
                    
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>




                    <div class="confirmationClearFix">
                        <asp:Button ID="Button1" runat="server" Text="Cancel" CssClass="confirmationDeletebtn" />
                        <asp:Button ID="btnRemoveStaff" runat="server" Text="Remove" OnClick="btnCheckCode_Click" CssClass="confirmationDeletebtn" OnClientClick="return validateEmail();" Enabled="false" />
                    </div>
                </div>

    
   
           

           </div>




</asp:Content>
