<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Uniqlo.Pages.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/Profile.css" rel="stylesheet" />
        <style>
            .dropdownListHyperLink {
                color: #6F6F6F;
                text-decoration: none;
            }
        </style>
    </header>
    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
        <div class="main-body" id="profileDisplay">
            <div class="profile-header">             
                <!--<asp:Image ID="ImgUpload" runat="server" alt="User Avatar" class="avatar" AlternateText='<%#Eval("img_src") %>' />         -->       
                <h4 class="username"> <asp:Label ID="txtName" class="form-control read-only-textbox" runat="server"></asp:Label></h4>
            </div>

            <div class="info-item">
                <span class="info-label">Email:</span>
                 <asp:TextBox ID="txtEmail" class="info-value" runat="server" autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">Gender:</span>
                <asp:TextBox ID="txtGender" class="info-value" runat="server" autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">Contact No:</span>
                <asp:TextBox ID="txtPhone" class="info-value" runat="server" autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">Address:</span>
                <asp:TextBox ID="txtAddress" class="info-value" runat="server"  autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">Postcode</span>
                <asp:TextBox ID="txtPostCode" class="info-value" runat="server" autofocus="" maxlength="5" ReadOnly="True" ></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">City</span>
                 <asp:TextBox ID="txtCity" class="info-value" runat="server" autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">State</span>
                 <asp:TextBox ID="txtState" class="info-value" runat="server" autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="info-item">
                <span class="info-label">Country</span>
                <asp:TextBox ID="txtCountry" class="info-value" runat="server" autofocus="" ReadOnly="True"></asp:TextBox>
            </div>
            <br />
            <div class="edit-profile" id="orderHistoryBigContainer">
                <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" CssClass="edit-button" OnClick="btnEditProfile_Click" />
                <asp:Button ID="btnChgPass" runat="server" Text="Change Password" CssClass="edit-button" OnClick="btnChgPass_Click" />
            </div>
        </div>
    </div>

    <div class="dropdown-wrapper" style="justify-content: flex-start; margin: auto; max-width: 1100px; position: relative; margin-top: 50px;">

        <div class="dropdown-container" style="margin-left: 20px;">
            <asp:DropDownList ID="ddlDate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" CssClass="dropdown-display">
                <asp:ListItem Value="">Default</asp:ListItem>
                <asp:ListItem Value="ascending">Sort by Oldest</asp:ListItem>
                <asp:ListItem Value="descending">Sort by Latest</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div class="container" style="margin: auto; max-width: 1100px; position: relative;">
        <div class="main-body">

            <!-- Existing profile information goes here -->

            <!-- Order History Section -->


                    <asp:ScriptManager ID="ScriptManagerProduct" runat="server" />


                    <asp:UpdatePanel ID="UpdatePanelProduct" runat="server">


                        <ContentTemplate>
                            <asp:Repeater ID="orderRepeater" runat="server" ViewStateMode="Disabled">

                                <HeaderTemplate>
                                    <table style="width: 100%" class="table">
                                        <tr class="row">


                                            <td class="col orderID">Order ID</td>
                                            <td class="col totalItem">Total Item</td>
                                            <td class="col totalAmount">Total Amount</td>
                                            <td class="col datePurchased">Date</td>
                                            <td class="col deliveryStatus">Status</td>
                                            <td class="col eclipse-display">
                                                <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                                            </div>
                                        </tr>
                                </HeaderTemplate>

                                <ItemTemplate>

                                    <tr class="row">

                                        <td class="col orderID">
                                            <asp:Label ID="orderID" runat="server" Text='<%# Eval("Order_ID") %>'></asp:Label></td>
                                        <td class="col totalItem">
                                            <asp:Label ID="totalItem" runat="server" Text='<%# Eval("Total_Item") %>'></asp:Label></td>
                                        <td class="col totalAmount">
                                            <asp:Label ID="totalAmount" runat="server" Text='<%# Eval("Total_Price", "{0:C}") %>'></asp:Label></td>
                                        <td class="col datePurchased">
                                            <asp:Label ID="datePurchased" runat="server" Text='<%# Eval("Payment_DateTime", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                        <td class="col deliveryStatus">
                                            <asp:Label ID="deliveryStatus" runat="server" Text='<%# Eval("Delivery_Status") %>'></asp:Label></td>



                                        <td class="col eclipse-container" onclick="toggleDropdown('dropdownList<%# Eval("Order_ID") %>', 'dropdownDisplay<%# Eval("Order_ID") %>')">
                                            <div class="eclipse-display" id="dropdownDisplay<%# Eval("Order_ID") %>" style="border: none;"><i class="fa fa-ellipsis-v" aria-hidden="true"></i></div>
                                            <div class="eclipse-list" id="dropdownList<%# Eval("Order_ID") %>">

                                                <div>
                                                    <asp:HyperLink ID="viewOrderDetails" runat="server" NavigateUrl='<%# "OrderHistoryItem.aspx?Order_ID=" + Eval("Order_ID") %>' Text="View More" CssClass="dropdownListHyperLink"></asp:HyperLink>
                                                </div>


                                            </div>

                                        </td>

                                    </tr>





                                </ItemTemplate>

                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>








                            </asp:Repeater>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlDate" EventName="SelectedIndexChanged" />
                        </Triggers>


                    </asp:UpdatePanel>




                </div>
           
    </div>
    <footer>

        <script src="../Javascript/productBtnEclipse.js"></script>
        <script src="../Javascript/productAdminDDL.js"></script>

    </footer>

</asp:Content>
