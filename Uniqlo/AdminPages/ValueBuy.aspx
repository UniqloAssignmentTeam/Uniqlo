<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ValueBuy.aspx.cs" Inherits="Uniqlo.AdminPages.ValueBuy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="../css/ValueBuy.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    </head>
    <div class="productBody">
        <header>
            <h2>Manage Value Buy Products</h2>
        </header>

        <div class="value-buy-container">
            <!-- Button to Add New Product -->
            <asp:Button ID="btnAddProduct" runat="server" Text="Add New Product" OnClick="btnAddProduct_Click" CssClass="btn-add" />
            
            <!-- Display Existing Products -->
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CssClass="product-grid" OnSelectedIndexChanged="gvProducts_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Product" HeaderText="Product Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price (RM)" />
                    <asp:BoundField DataField="Availability" HeaderText="Availability" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-edit" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
