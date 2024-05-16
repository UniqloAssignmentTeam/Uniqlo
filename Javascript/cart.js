document.addEventListener('DOMContentLoaded', function () {
    var cartItems = document.querySelectorAll('.cart-item');
    var removeItemButtons = document.querySelectorAll('.remove-item');
    // Update totals initially
    updateCartTotals();

    // Setup event listeners on each cart item for modal display
    cartItems.forEach(item => {
        item.addEventListener('click', function (event) {
            // Check if the clicked element or its parent is not the remove button or quantity input
            if (!event.target.classList.contains('remove-item') && !event.target.parentElement.classList.contains('remove-item') && !event.target.classList.contains('qty')) {
                var modal = document.getElementById('myModal');
                modal.style.display = 'block';
            }
        });
    });


    // Function to update the cart totals
    function updateCartTotals() {
        var totalItems = 0;
        var subtotal = 0;

        document.querySelectorAll('.cart-item').forEach(function (cartItem) {
            var quantity = parseInt(cartItem.querySelector('.qty').value, 10);
            var priceText = cartItem.querySelector('.item-subtotal').textContent.trim(); // Trim whitespace
            var itemSubtotal = parseFloat(priceText.replace('Item Price: RM ', '')); // Adjust to match text content
            console.log("Item Subtotal:", itemSubtotal);
            totalItems += quantity;
            subtotal += itemSubtotal;
        });

        console.log("Total Items:", totalItems);
        console.log("Subtotal:", subtotal);

        document.getElementById('totalItemsLabel').textContent = totalItems;
        document.getElementById('totalSubtotalLabel').textContent = subtotal.toFixed(2);
    }

    // Modal close button functionality
    var closeButtons = document.querySelectorAll('.close');
    closeButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            this.closest('.modal').style.display = 'none';
        });
    });
});


