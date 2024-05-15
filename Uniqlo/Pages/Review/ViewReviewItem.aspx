<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ViewReviewItem.aspx.cs" Inherits="Uniqlo.Pages.ReviewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <!-- Second Modal -->
    <div id="secModal" class="modal" runat="server">
        <div class="modal-content">
                    <div class="modal-rating-content">
                        <div style="display: flex;">
                            <p>Rating</p>
                            <div class="commentRatingSectionStars">
                                <asp:HiddenField ID="hdfRating" runat="server" />
                                <%# GenerateStars(Convert.ToDouble(double.Parse(hdfRating.Value))) %>
                            </div>
                        </div>
                        <div>
                            <p>Comment</p>
                            <div class="commentRatingSectionComment">
                                <asp:TextBox ID="commentTextArea1" runat="server" Columns="20" Rows="2" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                        <div style="display: flex; margin-top: 20px; width: 600px;" class="secModalBtnBorder">
                            <div style="width: 50%; border: 2px solid black; margin: 2px; height: 50px;" class="secModalBtnBorder1" id="thirdBtn">
                                <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="secModalBtn1" OnClick="EditButton_Click" />
                            </div>
                                <asp:Button ID="btnDeleteReview" runat="server" Text="Delete" OnClick="btnDeleteReview_Click" />
                        </div>
                    </div>
        </div>
    </div>


</asp:Content>
