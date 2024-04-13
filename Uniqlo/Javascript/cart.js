document.addEventListener('DOMContentLoaded', function () {
    var cartItems = document.querySelectorAll('.cart-item');

    // Update totals initially
    updateCartTotals();

    // Setup event listeners on each cart item
    cartItems.forEach(item => {
        item.addEventListener('click', function (event) {
            // Check if the clicked element or its parent is not the remove button
            if (!event.target.classList.contains('remove-item') && !event.target.parentElement.classList.contains('remove-item')) {
                var modal = document.getElementById('myModal');
                modal.style.display = 'block';
            }
        });
    });

    // Event listener for removing items
    document.querySelectorAll('.remove-item').forEach(item => {
        item.addEventListener('click', function () {
            var cartItem = this.closest('.cart-item');
            cartItem.remove(); // Removes the cart item from the DOM
            updateCartTotals(); // Recalculate cart totals after item removal
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
