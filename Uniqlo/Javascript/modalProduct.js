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
var colorRadioButtons = document.querySelectorAll('.color-radio-list input[type="radio"]');
var colorLabel = document.querySelector('#color');

// Second modal
var reviewModal = document.getElementById("reviewModal");
var reviewBtn = document.getElementById("openReviewBtn");
var closeSpan = document.getElementsByClassName("closeReview")[0];

span.onclick = function () {
    modal.style.display = "none";
    // Make all heart icons visible again when modal closes
    showHeartIcons();
    resetModalContent();
};

closeSpan.onclick = function () {
    reviewModal.style.display = "none";
};

// Handle opening and closing of the main modal
document.querySelectorAll('.limitedOfferCard').forEach(item => {
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
    colorRadioButtons.forEach(colorRadioButtons => colorRadioButtons.checked = false); // Uncheck all radios
    colorLabel.textContent = "White";  // Reset label to default
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