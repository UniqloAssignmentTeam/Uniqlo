<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="SendProductGmailToFriend.aspx.cs" Inherits="Uniqlo.Pages.SendProductGmailToFriend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
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

            .continue-button:hover{
                background-color: black;
                color: white;
            }

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

            .continue-div{
                width: 100%;
            }

        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </header>

    <div class="body">
        <div class="backButtonClass">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:__doPostBack('HyperLink1', '');" CssClass="backLinkClass"><i class="fa fa-arrow-left" aria-hidden="true"></i></asp:HyperLink>
        </div>
        <div class="modal-content">

            <div class="product-content">


                <asp:Label ID="friendEmail" runat="server" Text="Write your Friend Email here: "></asp:Label>
                <asp:TextBox ID="friendEmailInput" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="friendEmailInput"
                    ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="friendEmailInput"
                    ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ForeColor="Red" Display="Dynamic" />

                <br />
                <asp:Label ID="emailContent" runat="server" Text="Write your Message here: "></asp:Label>
                <asp:TextBox ID="emailContentInput" runat="server" TextMode="MultiLine" Rows="4" Columns="50" MaxLength="500"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContent" runat="server" ControlToValidate="emailContentInput"
                ErrorMessage="Message content is required." ForeColor="Red" Display="Dynamic" />
                <br />

                <div class="button-container">
                    <div class="continue-div">
                        <asp:Button ID="addButton" runat="server" Text="Submit" CssClass="continue-button" OnClick="btnSend_Click" CausesValidation="true"/>
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
