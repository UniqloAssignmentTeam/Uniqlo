﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ViewReviewItem.aspx.cs" Inherits="Uniqlo.Pages.ReviewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <!-- Second Modal -->
    <div id="secModal" class="modal" runat="server">
        <div class="modal-content">

            <asp:Repeater ID="ratingRepeater" runat="server" ViewStateMode="Disabled">
                <ItemTemplate>
                    <div class="modal-rating-content">
                        <div style="display: flex;">
                            <p>Rating</p>
                            <div class="commentRatingSectionStars">
                                <%# GenerateStars(Convert.ToDouble(Eval("Rating")) ) %>
                            </div>
                        </div>
                        <div>
                            <p>Comment</p>
                            <div class="commentRatingSectionComment">
                                <asp:TextBox ID="commentTextArea1" runat="server" Columns="20" Rows="2" TextMode="MultiLine" Enabled="false" Text='<%# Eval("Review") %>'></asp:TextBox>
                            </div>
                        </div>
                        <div style="display: flex; margin-top: 20px; width: 600px;" class="secModalBtnBorder">
                            <div style="width: 50%; border: 2px solid black; margin: 2px; height: 50px;" class="secModalBtnBorder1" id="thirdBtn">
                                <a href='<%# "EditReviewItem.aspx?ReviewID=" + Eval("Review_ID") %>' class="secModalBtn1">Edit</a>
                            </div
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>


</asp:Content>