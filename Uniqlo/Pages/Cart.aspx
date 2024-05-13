<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Uniqlo.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/Cart.css" rel="stylesheet" />
    <div class="productBody">
        <header>
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        </header>
        <h1>Shopping Cart</h1>

        <div class="cart-page-container">
            <div class="cart-items-container">
                <asp:Repeater ID="rptCartItems" runat="server">
                    <ItemTemplate>
                        <div class="cart-item" id='<%# "cart" + Eval("Quantity_Id") %>'>
                            <span class="remove-item">&times;</span>
                            <div class="cart-item-image-container">
                                 <img src='/ImageHandler.ashx?id=<%# Eval("Image_Id") %>' alt="ProductImage"/>
                            </div>
                            <div class="item-details">
                                <div class="item-name">
                                    <h3><b><%# Eval("Name") %></b></h3>
                                </div>
                                <div class="item-description">
                                    <p><%# Eval("Description") %></p>
                                </div>
                                <div class="item-details">
                                    <p><b>Size:</b> <%# Eval("Size") %></p>
                                    <p><b>Color:</b> <%# Eval("Color") %></p>

                                </div>
                                <div class="item-price">
                                    <p style="text-decoration: line-through; margin-right: 10px;">RM <%# Eval("OriginalPrice") %></p>
                                    <p style="color: red;">RM <%# Eval("DiscountedPrice") %></p>
                                </div>
                                <p>Quantity: </p>
                                <input type="number" class="qty" min="0" value='<%# Eval("Quantity") %>' />
                                <p class="item-subtotal"><b>Item Price: RM <%# Eval("Item_Price") %></b></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Cart Summary -->
            <div class="cart-summary">
                <h3>Cart Summary</h3>
                <p><b>Total Items: </b><span id="totalItemsLabel" class="total-items"></span></p>
                <p><b>Subtotal: RM </b><span id="totalSubtotalLabel" class="total-subtotal"></span></p>
                <div class="buttons-container">
                    <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="btn-checkout" PostBackUrl="~/Pages/Delivery.aspx" />
                    <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="btn-continue-shopping" PostBackUrl="~/Pages/Home.aspx" />
                </div>
            </div>
        </div>
    </div>
    <script src="../Javascript/cart.js"></script>
</asp:Content>
