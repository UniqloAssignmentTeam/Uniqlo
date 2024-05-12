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

    // Add event listeners for remove buttons
    removeItemButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.stopPropagation(); // Prevent event from bubbling to cart item
            var cartItem = this.closest('.cart-item');
            cartItem.remove(); // Remove the cart item from the DOM
            updateCartTotals(); // Update totals after item removal
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

function calculateTax(subtotal) {
    var taxRate = 0.10;
    var taxAmount = subtotal * taxRate;
    var totalWithTax = subtotal + taxAmount;

    document.getElementById('totalTaxLabel').textContent = taxAmount.toFixed(2);
    document.getElementById('totalPriceLabel').textContent = totalWithTax.toFixed(2);
}
