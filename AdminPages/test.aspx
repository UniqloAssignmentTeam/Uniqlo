<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Uniqlo.AdminPages.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link href="../css/test.css" rel="stylesheet" />

      <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
   <div class="dropdown-display" id="dropdownDisplay">Year</div>
   <div class="dropdown-list" id="dropdownList">
      <div onclick="selectOption('2024', 'dropdownDisplay')">2024</div>
      <div onclick="selectOption('2023', 'dropdownDisplay')">2023</div>
      <div onclick="selectOption('2022', 'dropdownDisplay')">2022</div>
   </div>
</div>


    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-display">
    <asp:ListItem>Men</asp:ListItem>
    <asp:ListItem>Women</asp:ListItem>
</asp:DropDownList>


    <script src="../Javascript/productAdminDDL.js"></script>

</asp:Content>
