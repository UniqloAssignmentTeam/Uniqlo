document.addEventListener('DOMContentLoaded', function () {
    // Attach the event listener to the entire document or a specific container that holds your wishlist items
    document.body.addEventListener('change', function (event) {
        // Check if the changed element is a checkbox within your wishlist section
        if (event.target.type === 'checkbox' && event.target.closest('.wishlist-heart-group')) {
            // Only prompt when trying to uncheck (remove from wishlist)
            if (!event.target.checked) {
                // Show confirmation dialog
                if (!confirm("Are you sure you want to remove this item from your wishlist?")) {
                    // If the user cancels, prevent the checkbox from being unchecked
                    event.preventDefault(); // This stops the checkbox from changing state
                    event.target.checked = true; // Explicitly re-check the checkbox
                }
            }
        }
    });
});
