<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderItem.aspx.cs" Inherits="Uniqlo.AdminPages.OrderItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
       <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
    <link href="../css/OrderItem.css" rel="stylesheet" />
    


   <div class="productBody">
       <header>
           <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
       </header>
       <h1>Order History</h1>
       
       <div class="cart-items-container">
           <!-- Cart Item 1 -->
           <div class="cart-item" id="cart1" data-product-id="1">
               <div class="cart-item-image-container">
                   <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="AIRism Cotton Short Sleeve T-Shirt"  width="100" height="300"/>
               </div>
               <div class="item-details">
                   <div class="item-name">
                       <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                   </div>
                   <div class="item-description">
                       <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                   </div>
                   <div class="item-information">
                       <div class="item-size">
                       <p><b>Size:</b> M</p> 
                           </div>
                       <div class="item-color">
                       <p><b>Color:</b> Blue</p> 
                      </div>
                   </div>
                   <div class="item-price">
                    
                       <p>Price: RM 30.00</p>
                   </div>
                   <div class="qty">
                   <p>Quantity: </p>
                   <p class="qty-qty"> 1</p>  
                        <p class="item-subtotal"><b>Subtotal: RM 30.00</b></p>
                        
                       </div>

               </div>
           </div>

           <!-- Cart Item 2 -->
           <div class="cart-item" id="cart2" data-product-id="2">
               <div class="cart-item-image-container">
                   <img src="../../../Images/Categories/Woman/Bottoms/SweatCargoPants1.jpg" alt="Sweat Cargo Pants"/>
               </div>
               <div class="item-details">
                   <div class="item-name">
                       <h3><b>Sweat Cargo Pants</b></h3>
                   </div>
                   <div class="item-description">
                       <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p>
                   </div>
                    <div class="item-information">
      <div class="item-size">
      <p><b>Size:</b> M</p> 
          </div>
      <div class="item-color">
      <p><b>Color:</b> Blue</p> 
     </div>
  </div>
                   <div class="item-price">
                      
                       <p>Price: RM 79.90</p>
                   </div>
                    <div class="qty">
                   <p>Quantity: </p>
                   <p class="qty-qty">1</p>
                   <p class="item-subtotal"><b>Subtotal: RM 79.90</b></p>
                        </div>
               </div>
           </div>




           <!-- Cart Summary -->
           <div class="cart-summary">
               <h3>Order Summary</h3>
               <p><b>Total Items: </b><span id="totalItemsLabel" class="total-items"></span></p>
               <p><b>Total Price: RM </b><span id="totalPriceLabel" class="total-price"></span></p>
               <div class="viewMoreSection">
      <a href="../AdminPages/Order.aspx" class="viewMoreButton">BACK</a>
  </div>
           </div>
       </div>

               <script>
                   // Calculate and display total items and total price
                   window.addEventListener('DOMContentLoaded', (event) => {
                       var cartItems = document.querySelectorAll('.cart-item');
                       var totalItems = 0;
                       var totalPrice = 0;

                       cartItems.forEach(function (cartItem) {
                           var quantity = parseInt(cartItem.querySelector('.qty').value);
                           var subtotal = parseFloat(cartItem.querySelector('.item-subtotal').textContent.replace('Subtotal: RM ', ''));
                           totalItems += quantity;
                           totalPrice += subtotal;
                       });

                       document.getElementById('totalItemsLabel').textContent = totalItems;
                       document.getElementById('totalPriceLabel').textContent = totalPrice.toFixed(2);
                   });
               </script>
       </div>



</asp:Content>
