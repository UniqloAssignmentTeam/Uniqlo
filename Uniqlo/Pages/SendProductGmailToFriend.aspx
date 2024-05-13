<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="SendProductGmailToFriend.aspx.cs" Inherits="Uniqlo.Pages.SendProductGmailToFriend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <head>
        <style>
            .body{
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
                margin-left: 40px;
            }
            .cancel-button {
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
                margin-right: 30px;
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
                margin-left: 30px;
            }

            .continue-button:hover, .cancel-button:hover, .addColor-button:hover {
                background-color: black;
                color: white;
            }
        </style>
    </head>

    <div class="body">

        <div class="modal-content">

            <div class="product-content">


                <asp:Label ID="friendEmail" runat="server" Text="Write your Friend Email here: "></asp:Label>
                <asp:TextBox ID="friendEmailInput" runat="server"></asp:TextBox>

                <br />
                <asp:Label ID="emailContent" runat="server" Text="Write your Message here: "></asp:Label>
                <asp:TextBox ID="emailContentInput" runat="server" TextMode="MultiLine" Rows="4" Columns="50" MaxLength="500"></asp:TextBox>

                <br />

                <div class="button-container">
                    <div class="cancel-div">
                        <asp:Button ID="cancelButton" runat="server" Text="Cancel" CssClass="cancel-button" OnClick="backToProductDetails"  />
                    </div>
                    <div class="continue-div">
                        <asp:Button ID="addButton" runat="server" Text="Submit" CssClass="continue-button" OnClick="btnSend_Click"/>
                    </div>
                </div>


                <asp:HiddenField ID="prodNameHidden" runat="server" />
                <asp:HiddenField ID="prodDiscountHidden" runat="server" />
                <asp:HiddenField ID="prodPriceHidden" runat="server" />
                <asp:HiddenField ID="prodDescHidden" runat="server" />
                <asp:HiddenField ID="prodImageID" runat="server" />


            </div>
        </div>
    </div>
</asp:Content>
