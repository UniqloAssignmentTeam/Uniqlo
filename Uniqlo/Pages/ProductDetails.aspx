<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Uniqlo.Pages.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../../../css/product.css" rel="stylesheet" />
        <style>
            .lblRed{
                color:red;
                font-weight: bold;
            }
        </style>

    </header>

    <div class="productBody" style="margin-top:50px">


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
                            <div class="img-select" runat="server" id="imgSelect" style="display:block;">
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

                        <!-- card right -->
                        <div class="product-content" style="margin-top: 100px;">
                            <h2 class="product-title product-name"><%# Eval("Product_Name") %></h2>
                            <div class="product-rating">
                                <%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %>
                                <span><%# Eval("AverageRating") %>(<%# Eval("ReviewCount") %>)</span>
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

                                <div class="productColorSection">
                                    <div class="purchase-color">
                                        <h3>Color:
                                            <label id="color"></label>
                                        </h3>
                                        <div class="purchase-color-item">
                                            <asp:RadioButtonList ID="RadioButtonListColors" runat="server" RepeatDirection="Horizontal" Visible="True" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListColors_SelectedIndexChanged">
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </div>

                                <div class="productQtySizeSection">
                                    <div class="purchase-size">
                                        <h3>Size: <%# Eval("Category.Gender").ToString() == "M" ? "Men " : (Eval("Category.Gender").ToString() == "W" ? "Woman" : "Not Specified") %>
                                            <asp:Label ID="labelQuantity" runat="server" Text=""></asp:Label>
                                        </h3>
                                        <div class="purchase-size-item">
                                            <asp:RadioButtonList ID="RadioButtonListSizes" runat="server" RepeatDirection="Horizontal" Visible="True" CssClass="custom-radio-list"  AutoPostBack="True" OnSelectedIndexChanged="RadioButtonListSizes_SelectedIndexChanged">
                                            </asp:RadioButtonList>
                                            
                                        </div>
                                    </div>

                                    <div class="purchase-info">
                                        <h3>Quantity: </h3>
                                        <asp:TextBox ID="txtQty" class="qty" runat="server" Text="1" onkeypress="return isNumber(event)" MaxLength="5"></asp:TextBox>
                                    </div>
                                </div> 
                                    <asp:Label ID="lblSize" runat="server" Text="" CssClass="lblRed"></asp:Label>
                            



                            <!--NO ANIMATION ADD TO CART BUTTON-->
                            <div class="cart-button">
                                <asp:LinkButton ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click">
        <span class="add-to-cart" runat="server" id="spnAddToCart">Add To Cart</span>
        <span class="added" runat="server" id="spnAdded" style="display: none;">Added</span>
        <i class="fas fa-shopping-cart"></i>
        <i class="fas fa-solid fa-shirt"></i>
    </asp:LinkButton>
                            </div>


                            <div class="social-links">
                                <p>Share At: </p>
                                <a href="#">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-instagram"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-whatsapp"></i>
                                </a>
                                <a href="#">
                                    <i class="fab fa-pinterest"></i>
                                </a>
                            </div>

                        </div>
                    </div>
            </ItemTemplate>
        </asp:FormView>

        <asp:FormView ID="formView1" runat="server" OnDataBound="formView_DataBound">
            <ItemTemplate>
                <!--REVIEW SECTIONS-->
                <div class="reviewSection" style="display:flex; margin-top: 100px;">
                    <div class="reviewRatingAndBar" style="border: 2px solid #6F6F6F; height: 20%; margin: 50px; border-radius: 16px;">
                        <div class="reviewRating">
                            <h3 style="margin-left:55px;"><%# Eval("AverageRating") %></h3>
                            <div style="display:flex;"><%# GenerateStars(Convert.ToDouble(Eval("AverageRating")) ) %></div>
                            <div class="reviewRatingNumUser" style="margin-left: 50px;"><i class="fa-solid fa-user"></i>
                                <div style="display: flex; margin-left:-16px;"><div><%# Eval("ReviewCount") %></div> <div>Total</div></div>
                            </div>
                        </div>
                    </div>


                    <div class="commentSection">
                        <div class="reviewModalSection">
                            <h2>Reviews</h2>
                        </div>
                        <hr />

                        <div class="reviewSectionDropDownLists">
                            <div class="dropdown-container" onclick="toggleDropdown('dropdownList1', 'dropdownDisplay1')">
                                <div class="dropdown-display" id="dropdownDisplay1">
                                    Star 
                                <i class="fas fa-star star reviewStar"></i>
                                    (All)
                                </div>
                                <div class="dropdown-list" id="dropdownList1">
                                    <div onclick="selectOption('5 Star (8)', 'dropdownDisplay1')">
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        (8)
                                    </div>
                                    <div onclick="selectOption('4 Star (5)', 'dropdownDisplay1')">
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        (5)
                                    </div>
                                    <div onclick="selectOption('3 Star (4)', 'dropdownDisplay1')">
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        (4)
                                    </div>
                                    <div onclick="selectOption('2 Star (3)', 'dropdownDisplay1')">
                                        <i class="fas fa-star star"></i>
                                        <i class="fas fa-star star"></i>
                                        (3)
                                    </div>
                                    <div onclick="selectOption('1 Star (1)', 'dropdownDisplay1')">
                                        <i class="fas fa-star star"></i>
                                        (1)
                                    </div>
                                </div>
                            </div>


                            <div class="dropdown-container" onclick="toggleDropdown('dropdownList2', 'dropdownDisplay2')">
                                <div class="dropdown-display" id="dropdownDisplay2">Variation (All)</div>
                                <div class="dropdown-list" id="dropdownList2">
                                    <div onclick="selectOption('Variation (S)', 'dropdownDisplay2')">S</div>
                                    <div onclick="selectOption('Variation (M)', 'dropdownDisplay2')">M</div>
                                    <div onclick="selectOption('Variation (L)', 'dropdownDisplay2')">L</div>
                                    <div onclick="selectOption('Variation (XL)', 'dropdownDisplay2')">XL</div>
                                </div>
                            </div>

                        </div>

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
            } 
        </script>
    </footer>
</asp:Content>
    