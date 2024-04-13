<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Uniqlo.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <link href="../css/ContactUs.css?v=1.1" rel="stylesheet" />
    <div class="productBody">
        <div class="contact-container">
            <h2>Contact Us</h2>
            <p>Feel free to reach out to us with any questions, feedback, or concerns you may have. Our team is here to help!</p>
        
            <!-- Chatbot Section -->
            <div class="chatbot-container">
                <div class="chatbot-messages" id="chatbotMessages">
                    <!-- Welcome message styled as a chatbot message -->
                    <div class="chatbot-message">
                        <p>Welcome to Uniqlo! Please don't hesitate to let us know what we can assist you with.</p>
                    </div>
                    <!-- Chatbot messages will appear here -->
                </div>
                <div class="chatbot-input">
                    <input type="text" id="userInput" placeholder="Type your message..." />
                    <button id="sendButton">Send</button>
                </div>
            </div>
        </div>
    </div>
    <script src="../Javascript/ContactUs.js"></script>
</asp:Content>