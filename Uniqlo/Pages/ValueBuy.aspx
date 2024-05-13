<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ValueBuy.aspx.cs" Inherits="Uniqlo.Pages.ValueBuy" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
     
    <header>
      
        <link href="../css/ValueBuy.css" rel="stylesheet" />
         <script>
             function onSubmit(token) {
                 document.getElementById("demo-form").submit();
             }
         </script>
<style>
    .hyperlink{
        text-decoration: none;
        color: #6F6F6F;
    }
</style>
    </header>

    <asp:ScriptManager ID="ValueManagerStaff" runat="server" />
    <asp:UpdatePanel ID="ValuePanelStaff" runat="server">



        <ContentTemplate>

          

            <div class="productBody">
                <!--LIMITED OFFER CARD-->
                <h1 class="header">Value Buy</h1>

                <!--VALUE BUY Banner-->
                <div class="banner">
                    <img src="../Images/uniqloValueBuyBanner.jpg" style="width: 100%;" />
                </div>


                <!--DROP DOWN LIST-->
                <div class="dropdown-bigcontainer" style="margin-bottom: 10px;">
                    <div class="productListHeader">Sort By</div>
                    <div style="display: flex;">

                        <div class="dropdown-container" style="margin-right: 15px;">
                         <asp:DropDownList ID="genderSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ApplyFilters" CssClass="dropdown-display">
    <asp:ListItem Value="">All Genders</asp:ListItem>
    <asp:ListItem Value="M">Men</asp:ListItem>
    <asp:ListItem Value="W">Women</asp:ListItem>
</asp:DropDownList>
                        </div>



                        <div class="dropdown-container">
                        <asp:DropDownList ID="categorySortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ApplyFilters" CssClass="dropdown-display">
    <asp:ListItem Value="">All Categories</asp:ListItem>
    <asp:ListItem Value="Top">Tops</asp:ListItem>
    <asp:ListItem Value="Bottom">Bottoms</asp:ListItem>
</asp:DropDownList>

                        </div>




                        <div style="display: flex; width: 100%; justify-content: flex-end;">
                            <div class="dropdown-container">
                             <asp:DropDownList ID="sortByDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ApplyFilters" CssClass="dropdown-display">
    <asp:ListItem Value="">Sort By</asp:ListItem>
    <asp:ListItem Value="HighToLow">High to Low</asp:ListItem>
    <asp:ListItem Value="LowToHigh">Low to High</asp:ListItem>
</asp:DropDownList>
                            </div>
                        </div>

                    </div>
                </div>



                <!--LIMITED OFFER START-->

















                <asp:DataList ID="dlValueBuy" runat="server" RepeatDirection="Horizontal" Width="100%">
                    <ItemTemplate>


                           <asp:HyperLink ID="productLink" runat="server" NavigateUrl='<%# "/Pages/ProductDetails.aspx?ProdID=" +  Eval("Product_ID") %>' CssClass="hyperlink">
                        <div class="limitedOfferCardContainer">
                            <div class="limitedOfferCard" id="product9" data-product-id="1">
                                <div class="product-image-container">
                                    <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("Product_Name") %>' style="width: 100%" />
                                </div>
                                <div class="limitedOfferContainer">
                                    <div class="product-name">
                                        <h3><b><%# Eval("Product_Name") %></b></h3>
                                    </div>
                                    <div class="product-description">
                                        <p><%# Eval("Description") %></p>
                                    </div>
                                    <div class="product-price">
                                        <p style="text-decoration: line-through; margin-right: 10px;"> <%# Eval("Price", "{0:C}") %></p>
                                        <p style="color: red;"> <%# Eval("Discount_Amount", "{0:C}") %></p>
                                    </div>
                                    <div class="product-rating">
                                        <%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %>
                                        <span><%# Eval("ReviewCount") %></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                            </asp:HyperLink>
                    </ItemTemplate>
                </asp:DataList>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="genderSortDDL" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="categorySortDDL" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="sortByDDL" EventName="SelectedIndexChanged" />

        </Triggers>


    </asp:UpdatePanel>




























    <footer>

         <script>

            

         </script>  
        <script src="../Javascript/valueBuy.js"></script>
        <script src="../Javascript/wishlist.js"></script>
        <script src="../Javascript/productItem.js"></script>
        <script src="../Javascript/modalProduct.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
        <script src="../../../Javascript/colorRadioList.js"></script>
    </footer>
</asp:Content>
