﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="AddReviewItem.aspx.cs" Inherits="Uniqlo.Pages.Review.AddReviewItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <style>
        .backButtonClass {
            margin: 30px 0px -20px 10px;
            border: 2px solid white;
            width: 50px;
            height: 50px;
            padding: 10px 10px 10px 15px;
            background-color: #f0f0f0;
            border-radius: 99%;
        }

        .backButtonClass:hover {
            background-color: #d0d0d0;
        }

        .backLinkClass {
            color: #6F6F6F;
            text-decoration: none;
        }

        .backButtonClass:hover > .backLinkClass {
            color: #8F8F8F;
        }
        .body {
            max-width: 1100px;
            position: relative;
            margin: auto;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; /* 5% from the top and centered */
            padding: 10px 20px 20px 20px;
            border: 1px solid lightgrey;
            width: 80%; /* Could be more or less, depending on screen size */
            border-radius: 5px;
            margin-bottom: 120px;
        }

        .product-content {
            display: flex;
            flex-direction: column;
            padding: 100px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .button-container {
            display: flex;
            text-align: center;
            margin: 60px 0px 0px 0px;
            width: 100%;
            margin-top: 50px;
        }

        .continue-button {
            border: 2px solid lightgrey;
            padding: 20px 90px 20px 90px;
            background: none;
            outline: none;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.5s ease;
            text-decoration: none;
            color: black;
            width: 100%;
        }

        .continue-button:hover {
            background-color: black;
            color: white;
        }
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    </header>

        <asp:ScriptManager runat="server" />
        <div class="body">
            <div class="backButtonClass">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:__doPostBack('HyperLink1', '');" CssClass="backLinkClass"><i class="fa fa-arrow-left" aria-hidden="true"></i></asp:HyperLink>
            </div>
            <div class="modal-content">
                <div class="product-content">
                    <div style="display: flex;">
                        <p>Rating</p>
                        <div class="commentRatingSectionStars" style="font-size: 30px; margin-left: 174px; padding-top: 5px;">
                            <i class="fa fa-star star1" onclick="setRating(1)"></i>
                            <i class="fa fa-star star1" onclick="setRating(2)"></i>
                            <i class="fa fa-star star1" onclick="setRating(3)"></i>
                            <i class="fa fa-star star1" onclick="setRating(4)"></i>
                            <i class="fa fa-star star1" onclick="setRating(5)"></i>
                        </div>
                        <asp:HiddenField ID="HiddenRating" runat="server" />
                    </div>
                    <div>
                        <p>Comment</p>
                        <div class="commentRatingSectionComment">
                            <asp:TextBox ID="commentTextArea" runat="server" Columns="20" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>

                    <div class="button-container">
                         <asp:Button ID="submitRating" runat="server" Text="Submit" CssClass="commentRatingSectionButtonClick continue-button secModalBtn2" OnClick="submitRating_Click" UseSubmitBehavior="true" OnClientClick="return validateAndSubmit();" />
                    </div>
                </div>
            </div>
        </div>

    <footer>
        <script>

            function setRating(rating) {
                var stars = document.querySelectorAll('.star1');
                for (var i = 0; i < stars.length; i++) {
                    stars[i].classList.remove('checked');
                }
                for (var i = 0; i < rating; i++) {
                    stars[i].classList.add('checked');
                }
                // Set the value in a hidden field to post to server
                document.getElementById('<%= HiddenRating.ClientID %>').value = rating;
            }


        </script>
    </footer>
</asp:Content>