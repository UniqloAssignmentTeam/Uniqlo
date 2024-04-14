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
            var priceText = cartItem.querySelector('.item-subtotal').textContent;
            var itemSubtotal = parseFloat(priceText.replace('Subtotal: RM ', ''));

            totalItems += quantity;
            subtotal += itemSubtotal;
        });

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




// Function to update the cart totals
function updateCartTotals() {
    var cartItems = document.querySelectorAll('.cart-item');
    var totalItems = 0;
    var subtotal = 0;

    cartItems.forEach(function (cartItem) {
        var quantity = parseInt(cartItem.querySelector('.qty').value, 10);
        var itemSubtotal = parseFloat(cartItem.querySelector('.item-subtotal').textContent.replace('Subtotal: RM ', ''));
        totalItems += quantity;
        subtotal += itemSubtotal;
    });

    document.getElementById('totalItemsLabel').textContent = totalItems;
    document.getElementById('totalSubtotalLabel').textContent = subtotal.toFixed(2);

    calculateTax(subtotal); // Calculate and display the tax and total price based on new subtotal
}

// Function to calculate and display tax and update total price
function calculateTax(subtotal) {
    var taxRate = 0.10;
    var taxAmount = subtotal * taxRate;
    var totalWithTax = subtotal + taxAmount;

    document.getElementById('totalTaxLabel').textContent = taxAmount.toFixed(2);
    document.getElementById('totalPriceLabel').textContent = totalWithTax.toFixed(2);
}
