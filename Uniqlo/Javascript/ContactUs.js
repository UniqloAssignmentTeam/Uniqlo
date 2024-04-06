function sendMessage() {
    var userInput = document.getElementById("userInput").value;
    var chatbotMessages = document.getElementById("chatbotMessages");

    // Append user message to chatbot messages
    chatbotMessages.innerHTML += "<div><strong>You:</strong> " + userInput + "</div>";

    // Simulate chatbot response (replace this with your actual chatbot logic)
    var botResponse = "I'm sorry, I'm just a demo chatbot. Please contact our support team for assistance.";
    chatbotMessages.innerHTML += "<div><strong>Chatbot:</strong> " + botResponse + "</div>";

    // Scroll to bottom of chat messages
    chatbotMessages.scrollTop = chatbotMessages.scrollHeight;

    // Clear input field
    document.getElementById("userInput").value = "";
}
