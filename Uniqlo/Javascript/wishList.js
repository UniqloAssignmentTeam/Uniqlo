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
var reviewModal = document.getElementById("reviewModal");
var reviewBtn = document.getElementById("openReviewBtn");
var closeSpan = document.getElementsByClassName("closeReview")[0];

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
            event.preventDefault(); // Prevent the default action
            var checkbox = this.previousElementSibling; // Get the checkbox related to this label

            if (checkbox) {
                checkbox.checked = !checkbox.checked; // Toggle the checkbox state
                toggleHeartIcon(checkbox, checkbox.checked); // Toggle the heart icon color based on checkbox state
                event.stopPropagation(); // Stop further propagation of the event
            }
        });
    });

    function toggleHeartIcon(checkbox, isChecked) {
        var heartPath = checkbox.nextElementSibling.querySelector('path');
        if (isChecked) {
            heartPath.style.fill = 'white';
            heartPath.style.stroke = 'grey'; // Change the stroke to grey when checked
        } else {
            heartPath.style.fill = 'red';
            heartPath.style.stroke = 'red'; // Revert the stroke to red when unchecked
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
            const messageElement = this.closest('.product-actions').querySelector('.action-message');
            messageElement.textContent = 'Item has been removed';
            messageElement.style.display = 'block';
            messageElement.style.color = '#f44336'; // Red color for removed
            setTimeout(() => {
                messageElement.style.display = 'none';
            }, 3500); // Hide after 3 seconds
        });
    });
});
