<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="viewMoreProduct.aspx.cs" Inherits="Uniqlo.AdminPages.viewMoreProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    
        <header>
            <link href="../../css/Admin/addProduct.css" rel="stylesheet" />
        </header>
       
    <style>
        
    .button-container {
        display: flex;
        text-align: center;
        margin: 60px 0px 60px 0px;
        width: 100%;
        margin-top: 50px;
        margin-left: 210px;
    }
    .cancel-button {
       border: 2px solid lightgrey;
    padding: 20px 180px 20px 180px;
    background: none;
    outline: none;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.5s ease;
    text-decoration: none;
    color: black;
    }

    .continue-button:hover, .cancel-button:hover, .addColor-button:hover {
        background-color: black;
        color: white;
    }
    </style>
 
 
    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO VIEW PRODUCT</h2>
        </div>
        <div class="modal-content">
            <asp:FormView ID="formView" runat="server" OnDataBound="formView_DataBound">
                <ItemTemplate>
                    <table class="product-content">
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblProdID" runat="server" Text="Product ID"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtProdID" runat="server" Enabled="false" Text='<%# Eval("Product_ID") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtProdName" runat="server" Enabled="false" Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtDescription" CssClass="form-field" Enabled="false" TextMode="MultiLine" runat="server" Rows="4" Columns="50" Text='<%# Eval("Description") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:TextBox ID="txtPrice" CssClass="form-field" Enabled="false" runat="server" Text='<%# Eval("Price") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Panel ID="Panel1" runat="server" CssClass="dropdown-container">
                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-display" SelectedValue='<%# Eval("Category.Name") %>' Enabled="false">
                                        <asp:ListItem Text="Tops" Value="Top"></asp:ListItem>
                                        <asp:ListItem Text="Bottoms" Value="Bottom"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group">
                                <asp:Panel ID="Panel2" runat="server" CssClass="dropdown-container">
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-display" SelectedValue='<%# Eval("Category.Gender") %>' Enabled="false">
                                        <asp:ListItem Text="Men" Value="M"></asp:ListItem>
                                        <asp:ListItem Text="Women" Value="W"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </td>
                        </tr>





                        <asp:DataList ID="dataList" runat="server" OnItemDataBound="dataList_ItemDataBound" CssClass="sizeQtyTable">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <h2><%# Eval("Color") %></h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div>
                                            <img src='/ImageHandler.ashx?id=<%# Eval("FirstImageId") %>' alt="Product Name" style="width: 500%; padding-left: 10px;"/>
                                        </div>
                                    </td>
                                </tr>
                                <asp:Repeater ID="RepeaterSizes" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="width:20%; text-align:center;"><div><%# Eval("Size") %></div></td>
                                            <td style="width: 80%; padding-top:10px;"><asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("Qty") %>' Enabled="false"></asp:TextBox></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ItemTemplate>
                        </asp:DataList>
                    </table>
                </ItemTemplate>
            </asp:FormView>

            <div class="button-container">
                <div class="cancel-div">
                    <asp:Button ID="btnCancel" CssClass="cancel-button" runat="server" Text="BACK" style="width: 100%;" OnClick="btnCancel_Click"/>
                </div>
            </div>
        </div>
    </div>
    


        <footer>

        <script src="../../Javascript/productAdminDDL.js"></script>
            </footer>







</asp:Content>
