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
        } else if (message.includes("opening hour") || message.includes("operating hour") || message.includes("when you open") || message.includes("what time do you close") || message.includes("store hour")) {
            botReply = "Our stores are open from 10 AM to 9 PM every day.";
        } else if (message.includes("return policy") || message.includes("refund") || message.includes("exchange policy") || message.includes("returns") || message.includes("exchange")) {
            botReply = "You can return products within 30 days of purchase with a valid receipt.";
        } else if (message.includes("size")) {
            botReply = "We have sizes ranging from XS to XXL. Availability may vary by item and location.";
        } else if (message.includes("locate") || message.includes("store near") || message.includes("location")) {
            botReply = "Let me help you find a store near you. Could you share your location or any specific area you are interested in?";
        } else if (message.includes("shipping cost") || message.includes("delivery charge") || message.includes("shipping fee") || message.includes("delivery fee")) {
            botReply = "Shipping costs will be around RM 20 for every delivery, if the purchase does not achieve RM 150.";
        } else if (message.includes("track order") || message.includes("order status") || message.includes("status") || message.includes("order")) {
            botReply = "You can check the status of your order by visiting the 'Order Status' section on our website.";
        } else if (message.includes("help")) {
            botReply = "Sure, what do you need help with?";
        } else if (message.includes("payment methods") || message.includes("payment options") || message.includes("payment")) {
            botReply = "We accept credit cards, debit cards, and cash on delivery.";
        } else if (message.includes("new arrivals") || message.includes("latest collection") || message.includes("new") || message.includes("latest")) {
            botReply = "You can view our latest arrivals on our website.";
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
        } else if (message.includes("pre-order") || message.includes("backorder") || message.includes("preorder") || message.includes("pre order")) {
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
            botReply = "No, our stores are not pet-friendly.";
        } else if (message.includes("teenagers")) {
            botReply = "Absolutely! We have a trendy selection specifically for teenagers. Check out our 'Teens' section online or visit us in-store.";
        } else if (message.includes("ethical sourcing")) {
            botReply = "Yes, we are committed to ethical sourcing practices. Our products are made with respect for people, animals, and the environment.";
        } else if (message.includes("recycling program")) {
            botReply = "Yes, we encourage sustainability by hosting a recycling program. Bring in your old clothes for recycling and receive a discount on your next purchase!";
        } else if (message.includes("price matching")) {
            botReply = "Yes, we offer price matching! If you find a lower price for an identical item at a competing store, show us the price and we will match it.";
        } else if (message.includes("discount")) {
            botReply = "Yes, we offer group discounts for large purchases. Please contact our sales team for more details.";
        } else if (message.includes("wheelchair")) {
            botReply = "Yes, all our stores are wheelchair accessible, and we strive to ensure that everyone can shop comfortably.";
        } else if (message.includes("online account")) {
            botReply = "By creating an online account, you can track your orders, manage returns easily, and get exclusive access to special offers and promotions.";
        } else if (message.includes("virtual try-on")) {
            botReply = "Yes, our website offers a virtual try-on feature that lets you see how clothes look on a model that matches your dimensions.";
        } else if (message.includes("business casual")) {
            botReply = "Certainly! For a business casual look, we recommend our range of polos, light sweaters, and chinos. Check out our 'Business Casual' section for more options.";
        } else if (message.includes("catalog")) {
            botReply = "Our catalogs are available on our website under the ‘Category’ section. You can also pick up a printed copy in any of our stores.";
        } else if (message.includes("eco-friendly") || message.includes("ecofriendly") || message.includes("eco friendly")) {
            botReply = "We offer a wide range of eco-friendly products made from organic and recycled materials. Look for our 'Eco-Friendly' badge on products online and in-store.";
        } else if (message.includes("Thank You") || message.includes("Bye")) {
            botReply = "See you!";
        } else if (message.includes("promotion") || message.includes("promotions")) {
            botReply = "Stay updated on our promotions and special deals by subscribing to our newsletter or following us on social media!";
        } else if (message.includes("product availability") || message.includes("in stock")) {
            botReply = "Let me check the availability of that product for you. Please wait a moment.";
        } else if (message.includes("modify order") || message.includes("change order")) {
            botReply = "You can modify your order if it hasn't been processed yet. Please provide your order number for assistance.";
        } else if (message.includes("holiday hours") || message.includes("open on holidays")) {
            botReply = "Our store hours may vary on holidays. Please check our website or contact your local store for holiday hours.";
        } else if (message.includes("bulk order") || message.includes("bulk discounts")) {
            botReply = "Yes, we offer discounts for bulk orders. Contact our sales team for more details.";
        } else if (message.includes("product recommendation") || message.includes("recommend a")) {
            botReply = "Certainly! What type of product are you looking for, and for what occasion?";
        } else if (message.includes("member benefits") || message.includes("membership perks")) {
            botReply = "As a member, you'll enjoy exclusive discounts, early access to sales, and personalized offers tailored to your preferences.";
        } else if (message.includes("international returns") || message.includes("returning from abroad")) {
            botReply = "Yes, we accept returns for international orders. Please review our international return policy for more details.";
        } else if (message.includes("product details") || message.includes("more about")) {
            botReply = "Sure! What specific information are you looking for about the product?";
        } else if (message.includes("gift wrapping") || message.includes("gift wrap")) {
            botReply = "Yes, we offer gift wrapping services for a small fee. You can add this option during checkout.";
        } else if (message.includes("value buy") || message.includes("valuebuy")) {
            botReply = "We have special value buy deals on selected items. Check our website or visit our stores for the latest offers!";
        } else if (message.includes("delivery time") || message.includes("shipping time") || message.includes("how long for delivery")) {
            botReply = "Delivery times vary depending on your location and the shipping method chosen. Typically, orders are delivered within 3-7 business days.";
        } else if (message.includes("product care") || message.includes("care instructions")) {
            botReply = "Check the care label on your garment for washing instructions. You can also find care tips on our website.";
        } else if (message.includes("category") || message.includes("product category")) {
            botReply = "Our products are categorized into various sections such as Men's, Women's, Kids', and Accessories. What specific category are you interested in?";
        } else if (message.includes("occasion") || message.includes("event")) {
            botReply = "What type of occasion or event are you shopping for?";
        } else if (message.includes("latest trends") || message.includes("current fashion")) {
            botReply = "Stay updated on the latest trends by checking our 'New In' section on the website or visiting our stores.";
        } else if (message.includes("bestseller") || message.includes("popular")) {
            botReply = "Explore our bestseller collection featuring top-rated and most-loved products by our customers.";
        } else if (message.includes("size recommendation") || message.includes("what size should I get")) {
            botReply = "To find the best fit, refer to our size chart available on the product page. If you need further assistance, feel free to ask!";
        } else if (message.includes("shop by brand") || message.includes("favorite brand")) {
            botReply = "We offer a wide range of brands catering to different styles and preferences. Explore our collection by your favorite brands!";
        } else if (message.includes("gift ideas") || message.includes("gift suggestions")) {
            botReply = "Looking for gift ideas? Check out our curated gift collections for inspiration!";
        } else if (message.includes("promotion") || message.includes("promotions")) {
            botReply = "Stay updated on our promotions and special deals by subscribing to our newsletter or following us on social media!";
        } else {
            botReply = "I'm not sure how to answer that. Can you provide more details or ask about something else?";
        }
        displayBotResponse(botReply);
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