document.addEventListener("DOMContentLoaded", function () {
    const userInput = document.getElementById("userInput");
    const sendButton = document.getElementById("sendButton");
    const chatForm = document.querySelector(".chatbot-container .form");

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

    function sendMessage(message) {
        // Enhanced response logic for a clothing store
        let botReply;
        message = message.toLowerCase(); // Normalize the message for easier matching

        if (message.includes("hello") || message.includes("hi") || message.includes("halo") || message.includes("hey") || message.includes("greeting")) {
            botReply = "Hello there! How can I assist you today?";
        } else if (message.includes("opening hour") || message.includes("operating hour") || message.includes("when you open")) {
            botReply = "Our stores are open from 10 AM to 9 PM every day.";
        } else if (message.includes("return policy") || message.includes("refund") || message.includes("exchange policy") || message.includes("returns")) {
            botReply = "You can return products within 30 days of purchase with a valid receipt.";
        } else if (message.includes("size")) {
            botReply = "We have sizes ranging from XS to XXL. Availability may vary by item and location.";
        } else if (message.includes("locate") || message.includes("store near") || message.includes("location")) {
            botReply = "Let me help you find a store near you. Could you share your location or any specific area you are interested in?";
        } else if (message.includes("shipping cost") || message.includes("delivery charge") || message.includes("shipping fee")) {
            botReply = "Shipping costs depend on the order size and destination. It's free for orders over $75!";
        } else if (message.includes("track order") || message.includes("order status") || message.includes("status") || message.includes("order")) {
            botReply = "You can check the status of your order by visiting the 'Order Status' section on our website.";
        } else if (message.includes("help")) {
            botReply = "Sure, what do you need help with?";
        } else if (message.includes("payment methods") || message.includes("payment options") || message.includes("payment")) {
            botReply = "We accept all major credit cards, PayPal, and cash on delivery.";
        } else if (message.includes("new arrivals") || message.includes("latest collection") || message.includes("new") || message.includes("latest")) {
            botReply = "You can view our latest arrivals on our website's 'New In' section.";
        } else if (message.includes("sales") || message.includes("discounts")) {
            botReply = "Stay tuned for our seasonal sales and promotions! Sign up for our newsletter to get notified.";
        } else if (message.includes("product availability") || message.includes("stock")) {
            botReply = "To check the availability of a specific product, please provide its name or code.";
        } else if (message.includes("gift cards") || message.includes("gift vouchers")) {
            botReply = "We offer gift cards of various denominations. They make perfect gifts for your loved ones!";
        } else if (message.includes("contact information") || message.includes("customer support")) {
            botReply = "You can reach our customer support team at support@clothingstore.com or call us at +1-800-123-4567.";
        } else if (message.includes("size chart") || message.includes("sizing guide")) {
            botReply = "You can find our size chart on the product page. It provides measurements for each size to help you choose.";
        } else if (message.includes("privacy policy") || message.includes("data protection")) {
            botReply = "We take your privacy seriously. You can read our privacy policy on our website for more information.";
        } else if (message.includes("store locations") || message.includes("branches")) {
            botReply = "We have multiple store locations across the country. Visit our website to find the nearest one to you.";
        } else if (message.includes("newsletter")) {
            botReply = "Subscribe to our newsletter to stay updated on the latest trends, offers, and events!";
        } else if (message.includes("gift wrapping") || message.includes("packaging")) {
            botReply = "We offer gift wrapping services for a small fee. You can select this option during checkout.";
        } else if (message.includes("product care") || message.includes("washing instructions")) {
            botReply = "Check the care label on your garment for washing instructions. You can also find care tips on our website.";
        } else if (message.includes("loyalty program") || message.includes("reward points")) {
            botReply = "Join our loyalty program to earn points on every purchase and redeem them for discounts or freebies!";
        } else if (message.includes("international shipping") || message.includes("overseas delivery")) {
            botReply = "Yes, we offer international shipping. Shipping costs and delivery times vary depending on the destination.";
        } else if (message.includes("product reviews") || message.includes("customer feedback")) {
            botReply = "You can read customer reviews and ratings for each product on our website.";
        } else if (message.includes("gift returns") || message.includes("exchange policy")) {
            botReply = "We accept returns and exchanges for gifts. Please provide the original order number or gift receipt.";
        } else if (message.includes("pre-order") || message.includes("backorder")) {
            botReply = "Some items may be available for pre-order or backorder. Contact customer support for more details.";
        } else if (message.includes("customization") || message.includes("personalization")) {
            botReply = "We offer customization services for select products. Contact us for more information.";
        } else if (message.includes("fabric") || message.includes("material")) {
            botReply = "Our clothes are made from a variety of high-quality materials including cotton, polyester, and sustainable fabrics. You can find specific material details on each product page.";
        } else if (message.includes("warranty") || message.includes("guarantee")) {
            botReply = "Yes, our products come with a 90-day warranty against manufacturing defects. Please contact our support team if you have any issues.";
        } else if (message.includes("events") || message.includes("in-store events")) {
            botReply = "Yes, we frequently host events and promotions at our stores. Check our website’s events section or sign up for our newsletter to stay updated!";
        } else if (message.includes("pet-friendly") || message.includes("pet friendly") || message.includes("pet")) {
            botReply = "Yes, our stores are pet-friendly! We welcome well-behaved pets in all our locations.";
        } else if (message.includes("teenagers")) {
            botReply = "Absolutely! We have a trendy selection specifically for teenagers. Check out our 'Teens' section online or visit us in-store.";
        } else if (message.includes("ethical sourcing")) {
            botReply = "Yes, we are committed to ethical sourcing practices. Our products are made with respect for people, animals, and the environment.";
        } else if (message.includes("recycling program")) {
            botReply = "Yes, we encourage sustainability by hosting a recycling program. Bring in your old clothes for recycling and receive a discount on your next purchase!";
        } else if (message.includes("price matching")) {
            botReply = "Yes, we offer price matching! If you find a lower price for an identical item at a competing store, show us the price and we will match it.";
        } else if (message.includes("group discounts")) {
            botReply = "Yes, we offer group discounts for large purchases. Please contact our sales team for more details.";
        } else if (message.includes("wheelchair accessible")) {
            botReply = "Yes, all our stores are wheelchair accessible, and we strive to ensure that everyone can shop comfortably.";
        } else if (message.includes("online account")) {
            botReply = "By creating an online account, you can track your orders, manage returns easily, and get exclusive access to special offers and promotions.";
        } else if (message.includes("virtual try-on")) {
            botReply = "Yes, our website offers a virtual try-on feature that lets you see how clothes look on a model that matches your dimensions.";
        } else if (message.includes("business casual")) {
            botReply = "Certainly! For a business casual look, we recommend our range of polos, light sweaters, and chinos. Check out our 'Business Casual' section for more options.";
        } else if (message.includes("seasonal catalogs")) {
            botReply = "Our seasonal catalogs are available on our website under the ‘Catalogs’ section. You can also pick up a printed copy in any of our stores.";
        } else if (message.includes("eco-friendly products")) {
            botReply = "We offer a wide range of eco-friendly products made from organic and recycled materials. Look for our 'Eco-Friendly' badge on products online and in-store.";
        } else if (message.includes("Thank You") || message.includes("Bye")) {
            botReply = "See you!.";
        } else if (message.includes("value buy") || message.includes("valuebuy")) {
            botReply = "We have special value buy deals on selected items. Check our website or visit our stores for the latest offers!";
        } else if (message.includes("promotion") || message.includes("promotions")) {
            botReply = "Stay updated on our promotions and special deals by subscribing to our newsletter or following us on social media!";
        } else {
            botReply = "I'm not sure how to answer that. Can you provide more details or ask about something else?";
        }
        displayBotResponse(botReply); // Display the hardcoded bot response
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