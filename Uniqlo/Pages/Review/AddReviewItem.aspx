<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="AddReviewItem.aspx.cs" Inherits="Uniqlo.Pages.Review.AddReviewItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
        <div id="myModal" class="modal" runat="server">
        <div class="modal-content">
            <asp:Button ID="Button1" runat="server" Text="&times;" OnClick="btnCloseModal_Click" CssClass="close" />
            <div class="modal-rating-content">
                <div style="display: flex;">
                    <p>Rating</p>
                    <div class="commentRatingSectionStars">
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


                <div style="width: 91%; border: 2px solid black; height: 50px; margin-top: 2px;" class="commentRatingSectionContainer secModalBtnBorder2">
                    <asp:Button ID="submitRating" runat="server" Text="Submit" CssClass="commentRatingSectionButtonClick secModalBtn2" OnClick="submitRating_Click" UseSubmitBehavior="true" OnClientClick="return validateAndSubmit();" />
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
