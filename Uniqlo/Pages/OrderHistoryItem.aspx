<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="OrderHistoryItem.aspx.cs" Inherits="Uniqlo.Pages.OrderHistoryItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
      <header>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link href="../css/Admin/OrderItem.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
        <style>
            .backButtonClass{
                margin: 20px 0px; 
                border: 2px solid white; 
                width: 50px; 
                height: 50px; 
                padding: 10px 10px 10px 15px; 
                background-color: #f0f0f0; 
                border-radius: 99%;
            }

            .backButtonClass:hover{
              background-color: #d0d0d0; 
            }

            .backLinkClass{
                color: #6F6F6F; 
                text-decoration: none;
            }

            .backButtonClass:hover > .backLinkClass {
              color: #8F8F8F; 
            }            
            
            /*Button in table*/
            .orderReceivedSection{
                margin: auto;
                margin-top: 20px;
                width: 300px;
                height: 50px;
                padding: 10px 0px 0px 130px;
                border: 2px solid black;
                transition: all 0.5s ease;
                font-weight: bold;
                cursor: pointer;
            }

            .orderReceivedSection:hover{
                background-color: black;
            }

            .orderReceivedSection:hover > .orderReceivedButton{
                color: white;
            }

            .orderReceivedButton{
                text-decoration: none;
                color: black;
            }

            /*MODAL*/
            /* The Modal (background) */
            .modal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 1; /* Sit on top */
              padding-top: 180px; /* Location of the box */
              left: 0;
              top: 0;
              width: 100%; /* Full width */
              height: 100%; /* Full height */
              overflow: auto; /* Enable scroll if needed */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
              background-color: #fefefe;
              margin: auto;
              padding: 20px;
              border: 1px solid #888;
              width: 50%;
            }

            /* The Close Button */
            .close {
              color: #aaaaaa;
              float: right;
              font-size: 28px;
              font-weight: bold;
            }

            .close:hover,
            .close:focus {
              color: #000;
              text-decoration: none;
              cursor: pointer;
            }

            .modal-rating-content{
                margin-top: 60px;
                font-size: 20px;
                margin-bottom: 10px;
                margin-left: 60px;
            }

            .commentRatingSectionStars{
                margin-top: 16px;
                margin-left: 100px;
                font-size: 25px;
            }

            .commentRatingSectionComment{
                margin-top: 30px;
            }
            .commentRatingSectionComment textarea{
                margin-top: -10px;
                width: 600px;
                height: 110px;
                font-size: 18px;
                resize: none;
            }

            .commentRatingSectionContainer{
                border: 2px solid black;
                width: 91%;
                margin-left: 0;
                margin-top: 30px;
                margin-bottom: 30px;
                height: 50px;
                transition: all 0.5s ease;
                padding-top: 5px;
            }

            .commentRatingSectionButton{
                text-decoration: none;
                color: black;
                padding: 50px 300px 50px 275px;
                font-weight: bold;
                font-size: 15px;
            }

            .commentRatingSectionContainer:hover{
                background-color: black;
            }

            .commentRatingSectionContainer:hover > .commentRatingSectionButton{
                color: white;
            }
        </style>
    </header>
    <div class="productBody">
        
        <div class="backButtonClass">
            <a href="Profile.aspx" class="backLinkClass"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
        </div>
        
        <h1>ORDER HISTORY ITEM</h1>
       
         <div class="cart-page-container">
             <div class="cart-items-container" style="width: 70%;">
                 <!-- Cart Item 1 -->
                 <div class="cart-item" data-product-id="1">
                     <div class="cart-item-image-container">
                         <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt="AIRism Cotton Short Sleeve T-Shirt"/>
                     </div>
                     <div class="item-details">
                         <div class="item-name">
                             <h3><b>AIRism Cotton Short Sleeve T-Shirt</b></h3>
                         </div>
                         <div class="item-description"> 
                             <p>Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.</p><br />
                         </div>
                         <div class="item-details">
                             <p><b>Size:</b> M</p>
                             <p><b>Color:</b> Red</p>
                         </div>
                             <p><b>Price:</b> RM30.00</p>
                             <p><b>Quantity:</b> 1</p>
                         <p class="item-subtotal"><b>Subtotal: RM 30.00</b></p>
                         <div class="orderReceivedSection" id="reviewModal">
                             <a href="#" class="orderReceivedButton">Review</a>
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
                         <div class="item-details">
                             <p><b>Size:</b> M</p>
                             <p><b>Color:</b> Red</p>
                         </div>
                         <p><b>Price:</b> RM30.00</p>
                         <p><b>Quantity:</b> 1</p>
                         <p class="item-subtotal"><b>Subtotal: RM 30.00</b></p>
                         <div class="orderReceivedSection">
                             <a href="#" class="orderReceivedButton">Review</a>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Cart Summary -->
             <div class="cart-summary" style="width: 30%;">
                 <h3>Order Summary</h3>
                 <p><b>Date: </b>14/3/2024 </p>
                 <p><b>Payment method: </b>Cash </p>
                 <p><b>Payment status: </b>Paid</p>
                 <!-- <p><b>Total Price: </b> <span id="totalItemsLabel" class="total-items"></span> </p> -->
                 <p><b>Total Price: </b>RM109.90 </p>
                 <p><b>Total Items: </b>2</p>
                 <p><b>Shipping Charges : </b>RM20</p>
                 <p><b>Total: </b>RM129.90</p>
             </div>

             
             <!-- The Modal -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <div class="modal-rating-content">
                        <div style="display: flex;">
                            <p>Rating</p>
                            <div class="commentRatingSectionStars">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                        </div>
                        <div>
                            <p>Comment</p>
                            <div class="commentRatingSectionComment">
                                <textarea id="TextArea1" cols="20" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="commentRatingSectionContainer">
                            <a href="#" class="commentRatingSectionButton">Submit</a>
                        </div>
                    </div>
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

            //REVIEW MODAL
            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var btn = document.getElementById("reviewModal");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function() {
              modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
              modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
              if (event.target == modal) {
                modal.style.display = "none";
              }
            }
        </script>
    </div>

</asp:Content>
