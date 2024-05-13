document.addEventListener("DOMContentLoaded", function () {
    const userInput = document.getElementById("userInput");
    const sendButton = document.getElementById("sendButton");
    const chatForm = document.querySelector(".chatbot-container .form");
    const API_KEY = 'sk-proj-WlBiyF3y144pEBPUsX8lT3BlbkFJ530C390tBabj3U3gWqD0';
    const API_URL = 'https://api.openai.com/v1/chat/completions';

    function addUserMessage() {
        var message = userInput.value.trim();
        if (message !== "") {
            displayUserMessage(message);
            simulateBotTyping(message);
            userInput.value = ""; // Clear input after the message is sent and displayed
        }
        // If message is empty, maybe keep the input as is or focus it so user knows to write something.
        else {
            userInput.focus(); // Focus on the input field if no message is entered
        }
    }

    function displayUserMessage(message) {
        const userDiv = document.createElement("div");
        userDiv.classList.add("user-inbox", "inbox");
        const msgHeader = document.createElement("div");
        msgHeader.classList.add("msg-header");
        const p = document.createElement("p");
        p.textContent = message;
        msgHeader.appendChild(p);
        userDiv.appendChild(msgHeader);
        chatForm.appendChild(userDiv);
        chatForm.scrollTop = chatForm.scrollHeight; // Scroll to the bottom
    }

    function simulateBotTyping(message) {
        const typingIndicator = displayTypingIndicator();
        setTimeout(() => {
            chatForm.removeChild(typingIndicator); // Remove the typing indicator
            sendMessage(message); // Call sendMessage here with the user's message
        }, 1000); // Shortened delay for better responsiveness
    }

    function displayTypingIndicator() {
        const botTypingDiv = document.createElement("div");
        botTypingDiv.classList.add("bot-inbox", "inbox");
        const iconDiv = document.createElement("div");
        iconDiv.classList.add("icon");
        const i = document.createElement("i");
        i.classList.add("fas", "fa-user");
        iconDiv.appendChild(i);
        const msgHeader = document.createElement("div");
        msgHeader.classList.add("msg-header");
        const p = document.createElement("p");
        p.textContent = "...";
        msgHeader.appendChild(p);
        botTypingDiv.appendChild(iconDiv);
        botTypingDiv.appendChild(msgHeader);
        chatForm.appendChild(botTypingDiv);
        chatForm.scrollTop = chatForm.scrollHeight;
        return botTypingDiv;
    }

    async function sendMessageToChatGPT(message) {
        try {
            const response = await fetch(API_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${API_KEY}`
                },
                body: JSON.stringify({
                    model: "chatgpt-3.5-turbo",
                    message: [{ "role": "user", "content": message }]
                })
            });

            if (!response.ok) {
                throw new Error('Failed to fetch response from API');
            }

            const data = await response.json();
            const generatedText = data.choices[0].text.trim(); // Extract the generated text from the response
            displayBotResponse(generatedText); // Call displayBotResponse with the generated text
        } catch (error) {
            console.error('Error sending message to ChatGPT API:', error);
            const errorMessage = 'Oops! An error occurred. Please try again.';
            displayBotResponse(errorMessage); // Call displayBotResponse with the error message
        }
    }




    function displayBotResponse(message) {
        const botDiv = document.createElement("div");
        botDiv.classList.add("bot-inbox", "inbox");
        const iconDiv = document.createElement("div");
        iconDiv.classList.add("icon");
        const i = document.createElement("i");
        i.classList.add("fas", "fa-user");
        iconDiv.appendChild(i);
        const msgHeader = document.createElement("div");
        msgHeader.classList.add("msg-header");
        const p = document.createElement("p");
        p.textContent = message;
        msgHeader.appendChild(p);
        botDiv.appendChild(iconDiv);
        botDiv.appendChild(msgHeader);
        chatForm.appendChild(botDiv);
        chatForm.scrollTop = chatForm.scrollHeight;
    }

    sendButton.addEventListener("click", addUserMessage);
    userInput.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Prevent form submit
            addUserMessage();
        }
    });
});