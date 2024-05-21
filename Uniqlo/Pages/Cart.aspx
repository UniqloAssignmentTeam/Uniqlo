<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Uniqlo.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/Cart.css" rel="stylesheet" />
    <header>
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </header>
    <div class="productBody">
        <h1>Shopping Cart</h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="cart-page-container">
                    <div class="cart-items-container">
                        <asp:Repeater ID="rptCartItems" runat="server">
    <ItemTemplate>
        <div class="cart-item" id='<%# "cart" + Eval("Quantity_Id") %>'>
            <asp:Button ID="btnRemoveItem" runat="server" Text="&times;" CssClass="remove-item" CommandName="RemoveCartItem" CommandArgument='<%# Eval("Quantity_Id") %>' OnCommand="btnRemoveItem_Command" />
            <div class="cart-item-image-container">
                <img src='/ImageHandler.ashx?id=<%# Eval("Image_Id") %>' alt="ProductImage" />
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
                    <%# ShowPrice(Eval("OriginalPrice"), Eval("DiscountedPrice")) %>
                </div>
                <p>Quantity: </p>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="qty" Text='<%# Eval("Quantity") %>' MaxLength="3" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged" TextMode="Number" />
                <p class="item-subtotal"><b>Item Price: RM <%# String.Format("{0:0.00}", Eval("Item_Price")) %></b></p>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

                    </div>
                    <!-- Cart Summary -->
                    <div class="cart-summary">
                        <h3>Cart Summary</h3>
                        <p><b>Total Items: </b><asp:Label ID="lblTotalItems" runat="server" Text="Label" CssClass="total-items"></asp:Label></p>
                        <p><b>Subtotal: RM </b><asp:Label ID="lblSubtotal" runat="server" Text="" CssClass="total-subtotal"></asp:Label></p>
                        <div class="buttons-container">
                            <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="btn-checkout" OnClick="btnCheckout_Click" />
                            <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="btn-continue-shopping" PostBackUrl="~/Pages/Home.aspx" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="rptCartItems" EventName="ItemCommand" />
            </Triggers>
        </asp:UpdatePanel>
        <footer>
          <script type="text/javascript">
            
                  function validateNumberInput(input) {
                      input.value = input.value.replace(/[^0-9]/g, '');
    }
       

              // Function to allow only numeric input and disallow '0' as the first digit
              function isNumberKey(evt) {
                  var charCode = (evt.which) ? evt.which : evt.keyCode;
                  var inputValue = evt.target.value;

                  // Disallow non-numeric characters
                  if (charCode < 48 || charCode > 57) {
                      return false;
                  }

                  // Disallow '0' as the first character
                  if (charCode == 48 && inputValue.length == 0) {
                      return false;
                  }

                  return true;
              }

              // Function to enforce max length
              function maxLengthCheck(object) {
                  if (object.value.length > object.maxLength) {
                      object.value = object.value.slice(0, object.maxLength);
                  }

                  // Disallow '0' as the first character
                  if (object.value.startsWith('0')) {
                      object.value = '';
                  }
              }
          </script>
        </footer>
    </div>
   
</asp:Content>
