<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Uniqlo.AdminPages.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link href="../css/test.css" rel="stylesheet" />


     <div class="dropdown-wrapper">
     <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
         <div class="dropdown-display" id="dropdownDisplay">Status</div>
         <div class="dropdown-list" id="dropdownList">
             <div onclick="selectOption('Valid', 'dropdownDisplay')">Valid</div>
             <div onclick="selectOption('Invalid', 'dropdownDisplay')">Invalid</div>
         </div>
     </div>
 </div>

    <div class="dropdown-wrapper">
        <div class="dropdown-container">
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-display li">
        <asp:ListItem>srg</asp:ListItem>
        <asp:ListItem>men</asp:ListItem>
     </asp:DropDownList>
            </div>
        </div>

</asp:Content>
