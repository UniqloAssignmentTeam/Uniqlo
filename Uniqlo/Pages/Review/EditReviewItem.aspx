<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="EditReviewItem.aspx.cs" Inherits="Uniqlo.Pages.EditReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <!-- THIRD Modal -->
    <div id="thirdModal" class="modal">
        <div class="modal-content">
            <asp:Repeater ID="updateRatingRepeater" runat="server" ViewStateMode="Disabled">
                <ItemTemplate>
                    <span class="thirdClose">&times;</span>
                    <div class="modal-rating-content">
                        <div style="display: flex;">
                            <p>Rating</p>
                            <div class="commentRatingSectionStars">
                                <i class="fa fa-star star2" onclick="setRating2(1)"></i>
                                <i class="fa fa-star star2" onclick="setRating2(2)"></i>
                                <i class="fa fa-star star2" onclick="setRating2(3)"></i>
                                <i class="fa fa-star star2" onclick="setRating2(4)"></i>
                                <i class="fa fa-star star2" onclick="setRating2(5)"></i>
                            </div>
                        </div>
                        <div>
                            <p>Comment</p>
                            <div class="commentRatingSectionComment">
                                <asp:TextBox ID="commentTextArea2" runat="server" Columns="20" Rows="2" TextMode="MultiLine" Text='<%# Eval("Review") %>'></asp:TextBox>
                            </div>
                        </div>
                        <div class="commentRatingSectionContainer">
                            <asp:Button ID="submitRating2" runat="server" Text="Submit" CssClass="commentRatingSectionButton secModalBtn1 thirdModalButton" OnClick="updateRating_Click" UseSubmitBehavior="true" OnClientClick="return validateAndSubmit();" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:HiddenField ID="HiddenRatingUpdate" runat="server" />

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


</asp:Content>
