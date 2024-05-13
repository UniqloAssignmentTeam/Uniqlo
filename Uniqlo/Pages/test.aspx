<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Uniqlo.Pages.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


     <script src="https://www.google.com/recaptcha/api.js" async defer></script>


   <form id="form1" runat="server">
        <div>
       <div class="g-recaptcha" data-sitekey="6Lc38NgpAAAAANFR2iSW9Bm0ir6yRA-RqVdC0cVv"></div>
      <!-- Sign Up Button -->
      <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" CssClass="button-field" />
           </div>

        </form>
    


</asp:Content>
