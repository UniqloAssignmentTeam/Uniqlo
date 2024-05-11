document.addEventListener("DOMContentLoaded", function () {
    const userInput = document.getElementById(".userInput");
    const sendButton = document.getElementById(".sendButton");
    const chatForm = document.querySelector(".chatbot-container .form");

    const API_URL = "https://api.openai.com/v1/chat/completions";
    const API_KEY = "sk-proj-qHWWWBzWiTJvAJVozf4ZT3BlbkFJac6qPGQiggcFNQvcdeyo";

    sendButton.addEventListener("click", function () {
        const userMessage = userInput.value.trim();
        if (userMessage) {
            displayUserMessage(userMessage);
            simulateBotTyping(userMessage);
            userInput.value = ""; // Clear input after sending
        }
    });

    userInput.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Prevent form submit
            sendButton.click();
        }
    });

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
        chatForm.scrollTop = chatForm.scrollHeight;
    }

    function simulateBotTyping(message) {
        const typingIndicator = displayTypingIndicator();
        setTimeout(() => {
            chatForm.removeChild(typingIndicator);
            fetchResponseFromAPI(message);
        }, 1000);
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

    function fetchResponseFromAPI(message) {
        fetch(API_URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${API_KEY}`
            },
            body: JSON.stringify({
                model: "gpt-3.5-turbo",
                messages: [{ role: "user", content: message }]
            })
        })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    console.error("API Error:", data.error.message);
                    displayBotResponse("I'm having trouble understanding that. Could you rephrase?");
                } else {
                    displayBotResponse(data.choices[0].message.content);
                }
            })
            .catch(error => {
                console.error('Fetch Error:', error);
                displayBotResponse("Oops! An error occurred. Please try again later.");
            });
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
});
