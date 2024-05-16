var productDetails = [
    {
        id: '1',
        name: 'AIRism Cotton Short Sleeve T-Shirt',
        description: 'Smooth "AIRism" fabric with the look of cotton. Refined fabric and design.',
        price: 'RM 30.00',
    }, {
        id: '2',
        name: 'Red T-shirt',
        description: 'Soft cotton t-shirt in blue',
        price: '30.99',
    }
];

// You only need to define these once, so they should be outside of showModalWithProductDetails function
var modal = document.getElementById("myModal");
var span = document.getElementsByClassName("close")[0];
var qtyInput = document.querySelector('.qty');
var radioButtons = document.querySelectorAll('.custom-radio-list input[type=radio]');
var label = document.querySelector('#size');



// Second modal
var closeSpan = document.getElementsByClassName("closeReview")[0];
var reviewModal = document.getElementById("reviewModal");
var reviewBtn = document.getElementById('openReviewBtn');
reviewBtn.onclick = function () {
    showReviewModal();
};
var closeReview = document.getElementsByClassName('closeReview')[0];
closeReview.onclick = function () {
    hideReviewModal();
};

// Function to show the review modal
function showReviewModal() {
    var reviewModal = document.getElementById('reviewModal');
    reviewModal.style.display = "block";
    reviewModal.classList.add('show-modal');
}

// Function to hide the review modal
function hideReviewModal() {
    var reviewModal = document.getElementById('reviewModal');
    reviewModal.style.display = "none";
    reviewModal.classList.remove('show-modal');
}

// Optional: Close the modal if the user clicks anywhere outside of the modal content
window.onclick = function (event) {
    var reviewModal = document.getElementById('reviewModal');
    if (event.target == reviewModal) {
        hideReviewModal();
    }
};


span.onclick = function () {
    modal.style.display = "none";
    // Make all heart icons visible again when modal closes
    showHeartIcons();
};

closeSpan.onclick = function () {
    reviewModal.style.display = "none";
};

// Handle opening and closing of the main modal
document.querySelectorAll('.wishlistItemCard').forEach(item => {
    item.addEventListener('click', function (event) {
        if (event.target.closest('.wishlist-heart-group')) {
            event.preventDefault();  // Prevent default behavior, stopping the page jump
            event.stopPropagation(); // Stop the event from bubbling up if not already doing so
        } else {
            let productId = this.getAttribute('data-product-id');
            showModalWithProductDetails(productId);
            hideHeartIcons(); // Hide all heart icons when any modal is opened
        }
    });
});


function getProductDetails(productId) {
    return productDetails.find(product => product.id === productId);
}

function showModalWithProductDetails(productId) {
    var product = getProductDetails(productId);
    if (product) {
        // Update the modal with the product's details
        document.getElementById('modalProductName').innerText = product.name;
        document.getElementById('modalProductDescription').innerText = product.description;
        document.getElementById('modalProductPrice').innerText = `${product.price}`;

        // Now, display the modal
        modal.style.display = "block";
        resetModalContent();
        hideHeartIcons();
    } else {
        console.error('Product not found for ID:', productId);
    }
}


function resetModalContent() {
    qtyInput.value = 1;  // Reset quantity input
    radioButtons.forEach(radioButton => radioButton.checked = false); // Uncheck all radios
    label.textContent = "S";  // Reset label to default
}
reviewBtn.onclick = function () {
    reviewModal.style.display = "block";
    hideHeartIcons();
}

// Common function to hide all heart icons
function hideHeartIcons() {
    document.querySelectorAll('.wishlist-heart-group').forEach(icon => {
        icon.style.display = 'none';
    });
}

// Common function to show all heart icons
function showHeartIcons() {
    document.querySelectorAll('.wishlist-heart-group').forEach(icon => {
        icon.style.display = ''; // Reset display property
    });
}

document.addEventListener('DOMContentLoaded', function () {
    var wishlistLabels = document.querySelectorAll('.wishlist-heart-group label');

    wishlistLabels.forEach(function (label) {
    label.addEventListener('click', function (event) {
        event.preventDefault();
        var checkbox = this.previousElementSibling;

        // Check the current state of the checkbox before toggling
        if (checkbox.checked) {
            // If it's checked (item is in wishlist), ask for confirmation to remove
            var actionConfirmed = window.confirm('Are you sure you want to remove this item from your wishlist?');
            if (actionConfirmed) {
                // If confirmed, uncheck the checkbox, update the heart icon, and show the message
                checkbox.checked = false;
                toggleHeartIcon(checkbox, false);
                displayActionMessage(this, 'Item has been removed from wishlist', '#f44336');
            } else {
                // If not confirmed, prevent the heart icon from changing
                event.stopPropagation(); // This is moved inside the if block
                return; // Exit the function without toggling the checkbox state
            }
        } else {
            // If it's not checked (item is not in wishlist), no need for confirmation to add
            checkbox.checked = true;
            toggleHeartIcon(checkbox, true);
            displayActionMessage(this, 'Item has been added to wishlist', '#4CAF50');
        }
    });

        const addToCartButtons = document.querySelectorAll('.btnMoveToCart');
        addToCartButtons.forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault(); // Prevent form submission or any default action
                event.stopPropagation(); // Stop event from bubbling up to parent elements
                showModalWithProductDetails(this.closest('.wishlistItemCard').getAttribute('data-product-id'));
            });
        });

        function showModalWithProductDetails(productId) {
            var product = getProductDetails(productId);
            if (product) {
                // Update the modal with the product's details
                document.getElementById('modalProductName').innerText = product.name;
                document.getElementById('modalProductDescription').innerText = product.description;
                document.getElementById('modalProductPrice').innerText = product.price;

                // Hide heart icons and display the modal
                hideHeartIcons();
                modal.style.display = "block";
                resetModalContent();
            } else {
                console.error('Product not found for ID:', productId);
            }
        }


        // Function to reset the content of the modal if needed
        function resetModalContent() {
            qtyInput.value = 1;
        }

});

    function displayActionMessage(labelElement, message, color) {
        const messageElement = labelElement.closest('.wishlistItemCard').querySelector('.action-message');
        messageElement.textContent = message;
        messageElement.style.display = 'block';
        messageElement.style.color = color;
        setTimeout(() => {
            messageElement.style.display = 'none';
        }, 3500); // Hide after 3 seconds
    }

    // Function to update heart icon style based on checkbox state
    function toggleHeartIcon(checkbox, isChecked) {
        var heartPath = checkbox.nextElementSibling.querySelector('path');
        if (isChecked) {
            heartPath.style.fill = 'red';
            heartPath.style.stroke = 'red';
        } else {
            heartPath.style.fill = 'white';
            heartPath.style.stroke = 'grey';
        }
    }



    const addToCartButtons = document.querySelectorAll('.btnMoveToCart');
    const removeFromCartButtons = document.querySelectorAll('.btnRemove');

    addToCartButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();
            event.stopPropagation();
            const messageElement = this.closest('.product-actions').querySelector('.action-message');
            messageElement.textContent = 'Item has been added to cart';
            messageElement.style.display = 'block';
            messageElement.style.color = '#4CAF50'; // Green color for added
            setTimeout(() => {
                messageElement.style.display = 'none';
            }, 3500); // Hide after 3 seconds
        });
    });

    removeFromCartButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();
            event.stopPropagation();
            const parentItem = this.closest('.wishlistItemCard'); // Find the parent wishlist item

            // Show a confirmation dialog
            if (window.confirm('Are you sure you want to remove this item from your wishlist?')) {
                parentItem.remove(); // Remove the entire wishlist item from the DOM if confirmed

                // Optionally, show a confirmation message after removing
                const actionMessage = parentItem.querySelector('.action-message');
                actionMessage.textContent = 'Item has been removed from wishlist';
                actionMessage.style.display = 'block';
                actionMessage.style.color = '#f44336'; // Red color for removed
                setTimeout(() => {
                    actionMessage.style.display = 'none';
                }, 3500); // Hide after 3 seconds
            }
        });
    });
});
