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
            .close, .secClose, .thirdClose {
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
            
            .secClose:hover,
            .secClose:focus {
              color: #000;
              text-decoration: none;
              cursor: pointer;
            }            
            .thirdClose:hover,
            .thirdClose:focus {
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

            .star {
                color: #ffc107;
            }

            /*SECOND MODAL BUTTON*/
            
            .secModalBtnBorder1,
            .secModalBtnBorder2{
                transition: all 0.5s ease;
                cursor: pointer;

            }       
            
            .secModalBtn1,
            .secModalBtn2{
                text-decoration: none;
                color: black;
                padding: 20px 150px 0px 125px;
            }
            
            .secModalBtnBorder1:hover,
            .secModalBtnBorder2:hover{
                background-color: black;
            }  
            
            .secModalBtnBorder1:hover > .secModalBtn1{
                color: white;
            }            
            
            .secModalBtnBorder2:hover > .secModalBtn2{
                color: white;
            }

            /*CONFIRMATION MODAL*/
            .confirmationClearFix{
                width: 100%;
                margin-top: 90px;
            }

            /* Add a color to the cancel button */
            .confirmationCancelbtn, .confirmationDeletebtn {
                border: 2px solid black;
                padding: 20px 150px 20px 150px;
                background: none;
                outline: none;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease;
                width: 100%;
                text-decoration: none;
                color: black;
                width: calc((100% / 2) - 20px);
    
            }

            .confirmationDeletebtn:hover, 
            .confirmationCancelbtn:hover {
                background-color: black;
                color: white;
            }             
   

            /* Add padding and center-align text to the container */
            .confirmationContainer {
              padding: 16px;
              text-align: center;
            }

            /* The Modal (background) */
            .confirmationModal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 2; /* Sit on top */
              left: 0;
              top: 0;
              width: 100%; /* Full width */
              height: 100%; /* Full height */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
              padding-top: 50px;
              margin-top: 55px;
            }

            /* Modal Content/Box */
            .confirmation-modal-content {
              background-color: #fefefe;
              margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
              border: 1px solid #888;
              width: 50%; /* Could be more or less, depending on screen size */
              height: 440px;
            }


            .confirmation-modal-content h1{
                margin-top: 60px;
            }

            .confirmation-modal-content p{
                margin-top: 30px;
            }
 
            /* The Modal Close Button (x) */
            .confirmationClose {
              float: right;
              font-size: 40px;
              font-weight: bold;
              color: #f1f1f1;
            }

            .confirmationClose:hover,
            .confirmationClose:focus {
              color: black;
              cursor: pointer;
            }

            /* Clear floats */
            .confirmationClearFix::after {
              content: "";
              clear: both;
              display: table;
            }

            /* Change styles for cancel button and delete button on extra small screens */
            @media screen and (max-width: 300px) {
              .confirmationCancelbtn, .confirmationDeletebtn {
                 width: 100%;
              }
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
                         <p class="item-subtotal"><b>Item Price: RM 30.00</b></p>
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
                         <p class="item-subtotal"><b>Item Price: RM 30.00</b></p>
                         <div class="orderReceivedSection" id="secBtn">
                             <a href="#" class="orderReceivedButton" style="padding: 0px 100px 0px 0px;">View</a>
                         </div>
                     </div>
                 </div>
             </div>

             <!-- Cart Summary -->
             <div class="cart-summary" style="width: 30%;">
                 <h3>ORDER ID : 1001</h3>
                 <p><b>Date: </b>14/3/2024 </p>
                 <p><b>Payment method: </b>Cash </p>
                 <p><b>Payment status: </b>Paid</p>
                 <p><b>Delivery status: </b>Delivered</p>
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

            <!-- Second Modal -->
            <div id="secModal" class="modal">
                <div class="modal-content">
                    <span class="secClose">&times;</span>
                    <div class="modal-rating-content">
                        <div style="display: flex;">
                            <p>Rating</p>
                            <div class="commentRatingSectionStars">
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                                <i class = "fas fa-star star"></i>
                            </div>
                        </div>
                        <div>
                            <p>Comment</p>
                            <div class="commentRatingSectionComment">
                                <textarea id="TextArea2" cols="20" rows="2" disabled>Lorem ipsum dolor sit, Lorem ipsum dolor sit amet consectetur, adipisicing elit. Id labore iusto, doloremque eveniet eos nostrum cupiditate. Laboriosam voluptates, eligendi minus totam, fuga, quidem officiis tempore quod placeat voluptate sunt soluta ratione deserunt sequi quia laborum quasi ullam repellendus molestias aliquid illo illum iure. Fugit cupiditate, alias rem nobis iste minima dolor ea porro fugiat, ipsum eum unde error aliquid consequatur. amet consectetur adipisicing elit. Praesentium eligendi maxime possimus temporibus! Labore accusamus facilis sequi dolorem ullam odio.</textarea>
                            </div>
                        </div>
                        <div style="display: flex; margin-top: 20px; width: 600px;" class="secModalBtnBorder">
                            <div style="width: 50%; border: 2px solid black; margin: 2px; height: 50px;" class="secModalBtnBorder1" id="thirdBtn">
                                <a href="#" class="secModalBtn1">Edit</a>
                            </div>
                            <div style="width: 50%; border: 2px solid black; height: 50px; margin-top: 2px;" class="secModalBtnBorder2">
                                <a href="#" class="secModalBtn2"  onclick="document.getElementById('id01').style.display='block'">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- THIRD Modal -->
            <div id="thirdModal" class="modal">
                <div class="modal-content">
                    <span class="thirdClose">&times;</span>
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
                                <textarea id="TextArea3" cols="20" rows="2"></textarea>
                            </div>
                        </div>
                        <div class="commentRatingSectionContainer">
                            <a href="#" class="commentRatingSectionButton">Submit</a>
                        </div>
                    </div>
                </div>
            </div>
            
             <!--DELETE CONFIRMATION-->
            <div id="id01" class="confirmationModal">
                <div class="confirmation-modal-content">
                    <div class="confirmationContainer">
                        <span onclick="document.getElementById('id01').style.display='none'" class="confirmationClose" title="Close Modal">×</span>
                        <h1>Remove Review</h1>
                        <p>Are you sure you want to remove your review?</p>

                        <div class="confirmationClearFix">
                            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationCancelbtn">Cancel</button>
                            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="confirmationDeletebtn">Remove</button>
                        </div>
                    </div>
                </div>
            </div>
           <!--DELETE CONFIRMATION END-->


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
            var secModal = document.getElementById("secModal");
            var thirdModal = document.getElementById("thirdModal");

            // Get the button that opens the modal
            var btn = document.getElementById("reviewModal");
            var secBtn = document.getElementById("secBtn");
            var thirdBtn = document.getElementById("thirdBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
            var secClose = document.getElementsByClassName("secClose")[0];
            var thirdClose = document.getElementsByClassName("thirdClose")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function() {
              modal.style.display = "block";
            }

            secBtn.onclick = function () {
                secModal.style.display = "block";
            }
            thirdBtn.onclick = function () {
                thirdModal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
              modal.style.display = "none";
            }
            secClose.onclick = function () {
                secModal.style.display = "none";
            }
            thirdClose.onclick = function () {
                thirdModal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
              if (event.target == modal) {
                  modal.style.display = "none";
              } else if (event.target == secModal) {
                  secModal.style.display = "none";
              } else if (event.target == thirdModal) {
                  secModal.style.display = "none";
              }
            }
        </script>
    </div>

</asp:Content>
