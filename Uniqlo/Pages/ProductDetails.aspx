<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Uniqlo.Pages.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
         <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
        <style>
            .lblRed {
                color: red;
                font-weight: bold;
            }
        </style>

    </header>

    <div class="productBody" style="margin-top: 50px">


        <asp:FormView ID="formView" runat="server" OnDataBound="formView_DataBound">
            <ItemTemplate>
                <div class="card-wrapper">
                    <div class="productItemCard">
                        <!-- card left -->
                        <div class="product-imgs">
                            <!-- Main Image Display -->
                            <div class="img-display">
                                <div class="img-showcase">
                                    <img id="mainImg" alt="Product Image" />
                                </div>
                            </div>

                            <!-- Thumbnails -->
                            <div class="img-select" runat="server" id="imgSelect" style="display: block;">
                                <asp:DataList ID="dataList" runat="server" RepeatDirection="Horizontal" Width="100%">
                                    <ItemTemplate>
                                        <div class="img-item">
                                            <a href="#" onclick="updateMainImage('<%# Eval("FirstImageId") %>'); return false;">
                                                <img src='/ImageHandler.ashx?id=<%# Eval("FirstImageId") %>' alt="Product Thumbnail" />
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                        <asp:HiddenField ID="productIdHidden" runat="server" Value='<%# Eval("Product_ID") %>' />
                        <asp:HiddenField ID="productNameHidden" runat="server" Value='<%# Eval("Product_Name") %>' />
                        <asp:HiddenField ID="productDiscountHidden" runat="server" Value='<%# Eval("DiscountAmount") %>' />
                        <asp:HiddenField ID="productPriceHidden" runat="server" Value='<%# Eval("Price") %>' />
                        <asp:HiddenField ID="productDescHidden" runat="server" Value='<%# Eval("Description") %>' />
                        <!-- card right -->
                        <div class="product-content" style="margin-top: 100px;">
                            <h2 class="product-title product-name"><%# Eval("Product_Name") %></h2>
                            <div class="product-rating">
                                <%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %>
                                <span><%# Eval("AverageRating", "{0:F2}") %>(<%# Eval("ReviewCount") %>)</span>
                            </div>

                            <div class="product-price">
                                <p class="last-price">Price: <span><%# Convert.ToDecimal(Eval("DiscountAmount")) > 0  ? "<p style='text-decoration: line-through; margin-right: 10px;'>" + String.Format("{0:C}", Eval("Price")) + "</p>" : "<p style='margin-right: 10px;'>" + String.Format("{0:C}", Eval("Price")) + "</p>" %></span></p>
                                <p class="new-price"><span class="product-price"><%# Convert.ToDecimal(Eval("DiscountAmount")) > 0  ? "<span style='color: red;'>" + String.Format("{0:C}", Convert.ToDecimal(Eval("Price")) - Convert.ToDecimal(Eval("DiscountAmount"))) + "</span>" : "" %></span></p>
                            </div>

                            <div class="product-detail">
                                <h2>about this item: </h2>
                                <p class="product-description"><%# Eval("Description") %></p>
                                <ul>
                                    <li>Category: <span><%# Eval("Category.Name") %></span></li>
                                    <li>Shipping Area: <span>Malaysia</span></li>
                                    <li>Shipping Fee: <span>Free of charge for order with total value above RM150. Additional RM20 shipping fees for order below RM150.</span></li>
                                </ul>
                            </div>



                      <asp:ScriptManager ID="ValueManagerStaff" runat="server" />
                     <asp:UpdatePanel ID="ValuePanelStaff" runat="server">
                        <ContentTemplate>



                            <div class="productColorSection">
                                <div class="purchase-color">
                                    <h3>Color:
                                            <label id="color"></label>
                                    </h3>
                                    <div class="purchase-color-item">
                                        <asp:RadioButtonList ID="RadioButtonListColors" runat="server" RepeatDirection="Horizontal" Visible="True"  CssClass="colorRadioList" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListColors_SelectedIndexChanged">
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            </div>

                            <div class="productQtySizeSection">
                                <div class="purchase-size">
                                    <h3><asp:Label ID="sizelbl" runat="server" Text="Size: "></asp:Label><asp:Label ID="Label1" runat="server" Text='<%# Eval("Category.Gender").ToString() == "M" ? "Men " : (Eval("Category.Gender").ToString() == "W" ? "Woman" : "Not Specified") %>'></asp:Label>
                                        
                                        
                                        
                                        <asp:Label ID="labelQuantity" runat="server" Text=""></asp:Label>
                                    </h3>
                                    <div class="purchase-size-item">
                                        <asp:RadioButtonList ID="RadioButtonListSizes" runat="server" RepeatDirection="Horizontal" Visible="false" CssClass="custom-radio-list" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListSizes_SelectedIndexChanged">
                                        </asp:RadioButtonList>
                                        
                                    </div>
                                </div>

                                <div class="purchase-info">
                                    <h3>Quantity: </h3>
                                 <asp:TextBox ID="txtQty" class="qty" runat="server" Text="" onkeypress="return isNumber(event)" MaxLength="5" Enabled="False"></asp:TextBox>


                                </div>
                            </div>
                            <asp:Label ID="lblSize" runat="server" Text="" CssClass="lblRed"></asp:Label>










                            <!--NO ANIMATION ADD TO CART BUTTON-->
                            <div class="cart-button">
                                <asp:LinkButton ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click">
                                    <span class="add-to-cart" runat="server" id="spnAddToCart">Add to Cart</span>
                                    <span class="added" runat="server" id="spnAdded" style="display: none;">Added to Cart</span>
                                    <i class="fas fa-shopping-cart"></i>
                                    <i class="fas fa-solid fa-shirt"></i>
                                </asp:LinkButton>
                            </div>

        
                        </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="RadioButtonListSizes" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="RadioButtonListColors" EventName="SelectedIndexChanged" />
                     <asp:AsyncPostBackTrigger ControlID="btnAddToCart" EventName="Click" />

                </Triggers>


            </asp:UpdatePanel>
                            <div class="social-links">
                                <p>Share At: </p>
                                <asp:LinkButton CssClass="text-dark px-2" ID="btnPinterest" runat="server" Text="Pinterest" OnClientClick="shareOnPinterest()">
                                    <i class="fab fa-pinterest"></i>
                                </asp:LinkButton>
                                <asp:LinkButton CssClass="text-dark px-2" ID="btnTwitter" runat="server" Text="Twitter" OnClientClick="shareOnTwitter()">
                                    <i class="fab fa-twitter"></i>
                                </asp:LinkButton>
                                <asp:LinkButton CssClass="text-dark px-2" ID="btnWhatsapp" runat="server" Text="Whatsapp" OnClientClick="shareOnWhatsApp(); return false;">
                                    <i class="fab fa-whatsapp"></i>
                                </asp:LinkButton>
                                <asp:LinkButton CssClass="text-dark px-2" ID="btnGmail" runat="server" Text="Gmail" OnClick="fetchProductID">
                                    <i class="fa-solid fa-envelope"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:FormView>


                <asp:FormView ID="formView1" runat="server" OnDataBound="formView_DataBound">
                    <ItemTemplate>
                        <!--REVIEW SECTIONS-->
                        <div class="reviewSection" style="display: flex; margin-top: 100px;">
                            <div class="reviewRatingAndBar" style="border: 2px solid #6F6F6F; height: 20%; margin: 50px; border-radius: 16px;">
                                <div class="reviewRating" style="width: 100%">
                                    <div><h3><%# Eval("AverageRating", "{0:F2}") %></h3></div>
                                    <div style="display: flex;"><%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %></div>
                                    <div class="reviewRatingNumUser">
                                        <i class="fa-solid fa-user"></i>
                                        <div style="display: flex; justify-content: center; align-items: center; text-align: center;">
                                            <div><%# Eval("ReviewCount") %></div>
                                            <div>Total</div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="commentSection">
                                <div class="reviewModalSection">
                                    <h2>Reviews</h2>
                                </div>

                                <hr />


                                <asp:Repeater ID="reviewsRepeater" runat="server" DataSource='<%# Eval("Reviews") %>'>
                                    <ItemTemplate>
                                        <div class="commentSectionNewRow">
                                            <h3><%# Eval("CustomerName") %></h3>
                                            <div class="commentRatingSection">
                                                <div class="commentRatingSectionStars">
                                                    <%# GenerateStars(Convert.ToDouble(Eval("customerRating")) ) %>
                                                </div>
                                                <div class="commentRatingSectionDate">
                                                    <%# Eval("reviewDateSubmit") %>
                                                </div>
                                            </div>
                                            <div class="commentRatingSectionDetails">
                                                <%# Eval("customerReview") %>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <h4 class="noMoreRatingFound">No More Ratings Found</h4>
                            </div>


                        </div>

                        </div>
                    </ItemTemplate>
                </asp:FormView>


        <!--VIEWMOREBUTTON END-->

        <asp:HiddenField ID="prodIdHidden" runat="server" />
        <asp:HiddenField ID="prodNameHidden" runat="server" />
        <asp:HiddenField ID="prodDiscountHidden" runat="server" />
        <asp:HiddenField ID="prodPriceHidden" runat="server" />
        <asp:HiddenField ID="prodDescHidden" runat="server" />
        <asp:HiddenField ID="prodImageID" runat="server" />

    </div>
    <footer>
        <script type="text/javascript">
            function isNumber(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }

            function shareOnTwitter() {
                var productName = document.getElementById('<%= prodNameHidden.ClientID %>').value;
                var productDisc = parseFloat(document.getElementById('<%= prodDiscountHidden.ClientID %>').value);
                var productPrice = parseFloat(document.getElementById('<%= prodPriceHidden.ClientID %>').value);
                var productDesc = document.getElementById('<%= prodDescHidden.ClientID %>').value;
                var finalPrice = productPrice - productDisc;
                var imageUrl = window.location.origin + '/ImageHandler.ashx?id=' + document.getElementById('<%= prodImageID.ClientID %>').value;

                var textToShare = encodeURIComponent("Check out this product: " + productName + " for only RM" + finalPrice.toFixed(2) + ". " + productDesc + " " + imageUrl);

                var twitterShareUrl = "https://twitter.com/intent/tweet?" + "text=" + textToShare;
                window.open(twitterShareUrl, "_blank");
            }

            function shareOnPinterest() {
                var productName = document.getElementById('<%= prodNameHidden.ClientID %>').value;
                var productPrice = parseFloat(document.getElementById('<%= prodPriceHidden.ClientID %>').value);
                var productDesc = document.getElementById('<%= prodDescHidden.ClientID %>').value;
                var productDisc = parseFloat(document.getElementById('<%= prodDiscountHidden.ClientID %>').value);
                var imageUrl = window.location.origin + '/ImageHandler.ashx?id=' + document.getElementById('<%= prodImageID.ClientID %>').value;

                var finalPrice = productPrice - productDisc;

                var pinterestShareUrl = "https://www.pinterest.com/pin/create/button/" +
                    "?url=" + encodeURIComponent(window.location.href) +
                    "&media=" + encodeURIComponent(imageUrl) +
                    "&description=" + encodeURIComponent("Check out this product: " + productName + " for only RM " + finalPrice.toFixed(2));

                window.open(pinterestShareUrl, "_blank");
            }


            function shareOnWhatsApp() {
                var productName = document.getElementById('<%= prodNameHidden.ClientID %>').value;
                var productDisc = parseFloat(document.getElementById('<%= prodDiscountHidden.ClientID %>').value);
                var productPrice = parseFloat(document.getElementById('<%= prodPriceHidden.ClientID %>').value);
                var productDesc = document.getElementById('<%= prodDescHidden.ClientID %>').value;

                var finalPrice = productPrice - productDisc;
                var imageUrl = window.location.origin + '/ImageHandler.ashx?id=' + document.getElementById('<%= prodImageID.ClientID %>').value;
                var textToShare = encodeURIComponent("Check out this product: " + productName + " for only RM" + finalPrice.toFixed(2) + ". " + productDesc + " See image here: " + imageUrl);

                var whatsappShareUrl = "https://api.whatsapp.com/send?text=" + textToShare;
                window.open(whatsappShareUrl, "_blank");
            }

        </script>
        <script src="../../../Javascript/category.js"></script>
        <script src="../../../Javascript/slider.js"></script>
        <script src="../../../Javascript/productItem.js"></script>
        <script src="../../../Javascript/addToCartButton.js"></script>
        <script src="../../../Javascript/productSize.js"></script>
        <script src="../../../Javascript/productReview.js"></script>
        <script src="../../../Javascript/wishList.js"></script>
        <script src="../../../Javascript/productAdminDDL.js"></script>
        <script src="../../../Javascript/colorRadioList.js"></script>

        <script>
            function shareOnTwitter() {
                var shareUrl = 'https://twitter.com/intent/tweet?url=' + encodeURIComponent(window.location.href) + '&text=' + encodeURIComponent(document.title);
                window.open(shareUrl, '_blank', 'width=600,height=400');
            } >
        </script>
    </footer>
</asp:Content>
