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

    $(document).ready(function () {
        $("sendButton").on("click", function () {
            $value = $("data").val();
            $msg = '<div class="user-inbox inbox">< div class="msg=header" ><p>' + $value + '</p></div ></div > ';
            $(".chatbot-messages").append($msg);
        })
    })
}
