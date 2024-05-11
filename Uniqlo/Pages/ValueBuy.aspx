<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ValueBuy.aspx.cs" Inherits="Uniqlo.Pages.ValueBuy" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
      <%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
    <header>
         <script src="https://www.google.com/recaptcha/api.js"></script>
        <link href="../css/ValueBuy.css" rel="stylesheet" />
         <script>
             function onSubmit(token) {
                 document.getElementById("demo-form").submit();
             }
         </script>
    </header>

    <asp:ScriptManager ID="ValueManagerStaff" runat="server" />
    <asp:UpdatePanel ID="ValuePanelStaff" runat="server">



        <ContentTemplate>

            <button class="g-recaptcha" 
        data-sitekey="reCAPTCHA_site_key" 
        data-callback='onSubmit' 
        data-action='submit'>Submit</button>

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
                          <asp:DropDownList ID="genderSortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterProducts" CssClass="dropdown-display">
    <asp:ListItem Value="">All Genders</asp:ListItem>
    <asp:ListItem Value="M">Men</asp:ListItem>
    <asp:ListItem Value="F">Women</asp:ListItem>
</asp:DropDownList>
                        </div>



                        <div class="dropdown-container">
                            <asp:DropDownList ID="categorySortDDL" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterProducts" CssClass="dropdown-display">
    <asp:ListItem>All Categories</asp:ListItem>
    <asp:ListItem>Tops</asp:ListItem>
    <asp:ListItem>Bottom</asp:ListItem>
</asp:DropDownList>
                        </div>




                        <div style="display: flex; width: 100%; justify-content: flex-end;">
                            <div class="dropdown-container">
                                <asp:DropDownList ID="sortByDDL" runat="server" CssClass="dropdown-display">
                                    <asp:ListItem>Sort By</asp:ListItem>
                                    <asp:ListItem>Most Popular</asp:ListItem>
                                    <asp:ListItem>High to Low</asp:ListItem>
                                    <asp:ListItem>Low to High</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>
                </div>



                <!--LIMITED OFFER START-->

















                <asp:DataList ID="dlValueBuy" runat="server" RepeatDirection="Horizontal" Width="100%">
                    <ItemTemplate>



                        <div class="limitedOfferCardContainer">
                            <div class="limitedOfferCard" id="product9" data-product-id="1">
                                <div class="product-image-container">
                                    <img src='/ImageHandler.ashx?id=<%# Eval("Image_ID") %>' alt='<%# Eval("Product_Name") %>' style="width: 100%" />
                                    <div class="wishlistSection">
                                        <div class="wishlist-heart-group">
                                            <input name="wishListProduct" id="wishListProduct9" data-product-id="1" type="checkbox" />
                                            <label for="wishListProduct" data-hover-text="Wish List">
                                                <svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" version="1.1" x="0px" y="0px" viewBox="0 0 100 100">
                                                    <g transform="translate(0,-952.36218)">
                                                        <path style="color: #000000; enable-background: accumulate;" d="m 34.166665,972.36218 c -11.41955,0 -19.16666,8.91891 -19.16666,20.27029 0,19.45943 15,27.56753 35,39.72973 20.00001,-12.1622 34.99999,-20.2703 34.99999,-39.72973 0,-11.35137 -7.7471,-20.27029 -19.16665,-20.27029 -7.35014,0 -13.39148,4.05405 -15.83334,6.48647 -2.44185,-2.43241 -8.48319,-6.48647 -15.83334,-6.48647 z" fill="transparent" id="heart-path" stroke="#737373" stroke-width="5" marker="none" visibility="visible" display="inline" overflow="visible" />
                                                    </g>
                                                </svg>
                                            </label>
                                        </div>
                                    </div>
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
