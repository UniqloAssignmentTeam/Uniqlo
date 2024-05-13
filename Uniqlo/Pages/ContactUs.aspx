<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Uniqlo.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="../css/ContactUs.css?v=1.1" rel="stylesheet" />
    <div class="productBody">
        <div class="contact-container">
            <h2>Contact Us</h2>
            <p>Feel free to reach out to us with any questions, feedback, or concerns you may have. Our team is here to help!</p>
            <p>*You may contact us through the email and contact number as below*</p>
            <p>Email: uniqlomy@gmail.com</p>
            <p>Contact No: 04-2657622</p>
        
            <div class="chatbot-container">
                <div class="form">
                    <div class="bot-inbox inbox">
                        <div class="icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="msg-header">
                            <p>Welcome to Uniqlo! Please don't hesitate to let us know what we can assist you with.</p>
                        </div>
                    </div>
                </div>
                <div class="chatbot-input">
                    <input type="text" id="userInput" placeholder="Type your message..." required/>
                    <button id="sendButton">Send</button>
                </div>
            </div>
        </div>
    </div>
    <script src="../Javascript/ContactUs.js" defer></script>
</asp:Content>
