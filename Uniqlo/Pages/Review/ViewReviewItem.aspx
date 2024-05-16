<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ViewReviewItem.aspx.cs" Inherits="Uniqlo.Pages.ReviewItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
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
            margin-left: 12px;
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
    <asp:ScriptManager runat="server" />

    <div class="body">
        <div class="backButtonClass">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:__doPostBack('HyperLink1', '');" CssClass="backLinkClass">
                <i class="fa fa-arrow-left" aria-hidden="true"></i>
            </asp:HyperLink>
        </div>
        <div class="modal-content">
            <div class="product-content">
                <div style="display: flex;">
                    <p>Rating</p>
                    <div class="commentRatingSectionStars" style="font-size: 30px;">
                        <asp:HiddenField ID="hdfRating" runat="server" />
                        <div style="color: #ffe234; margin-left: 200px; padding-top: 5px;"><%# GenerateStars(Convert.ToDouble(double.Parse(hdfRating.Value))) %></div>
                    </div>
                </div>
                <div>
                    <p>Comment</p>
                    <div class="commentRatingSectionComment">
                        <asp:TextBox ID="commentTextArea1" runat="server" Columns="20" Rows="2" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="button-container">
                    <div class="cancel-div">
                        <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="cancel-button" OnClick="EditButton_Click" />
                    </div>
                    <div class="continue-div">
                        <asp:Button ID="btnDeleteReview" runat="server" Text="Delete" CssClass="continue-button" OnClick="btnDeleteReview_Click" OnClientClick="return confirmDelete();" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
        <script>
            function confirmDelete() {
                Swal.fire({
                    title: 'Are you sure?',
                    text: 'You won\'t be able to revert this!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        __doPostBack('<%= btnDeleteReview.UniqueID %>', '');
                    }
                });
                return false; // Prevent default button action
            }
        </script>
    </footer>
</asp:Content>
