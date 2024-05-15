<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="EditReviewItem.aspx.cs" Inherits="Uniqlo.Pages.EditReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <div id="thirdModal" class="modal">
        <div class="modal-content">
            <div class="modal-rating-content">
                <div style="display: flex;">
                    <p>Rating</p>
                    <div class="commentRatingSectionStars">
                        <i class="fa fa-star star2" onclick="setRating(1)"></i>
                        <i class="fa fa-star star2" onclick="setRating(2)"></i>
                        <i class="fa fa-star star2" onclick="setRating(3)"></i>
                        <i class="fa fa-star star2" onclick="setRating(4)"></i>
                        <i class="fa fa-star star2" onclick="setRating(5)"></i>
                    </div>
                </div>
                <div>
                    <p>Comment</p>
                    <div class="commentRatingSectionComment">
                        <asp:TextBox ID="Review" runat="server" Columns="20" Rows="2" TextMode="MultiLine" Text="Review"></asp:TextBox>
                    </div>
                </div>
                <div class="commentRatingSectionContainer">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="commentRatingSectionButton secModalBtn1 thirdModalButton" OnClick="btnUpdate_Click" UseSubmitBehavior="true" OnClientClick="return validateAndSubmit();" />

                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenRatingUpdate" runat="server" />

    <script>
        function setRating(rating) {
            document.getElementById('<%= HiddenRatingUpdate.ClientID %>').value = rating;
        }

        function showPopup() {
            // Display the popup
            alert('Review updated successfully!');

            // Redirect after 2 seconds
            setTimeout(function () {
                window.location.href = 'ViewReviewItem.aspx'; // Replace with the actual page URL
            }, 2000);
        }
    </script>

</asp:Content>
