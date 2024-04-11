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

// Second modal
var reviewModal = document.getElementById("reviewModal");
var reviewBtn = document.getElementById("openReviewBtn");
var closeSpan = document.getElementsByClassName("closeReview")[0];

// First modal close
span.onclick = function () {
    modal.style.display = "none";
}
//second modal close
closeSpan.onclick = function () {
    reviewModal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    } else if (event.target == reviewModal) {
        reviewModal.style.display = "none";
    }
}

document.querySelectorAll('.limitedOfferCard').forEach(item => {
    item.addEventListener('click', event => {
        let productId = item.getAttribute('data-product-id');
        showModalWithProductDetails(productId);
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
    } else {
        console.error('Product not found for ID:', productId);
    }
}
reviewBtn.onclick = function () {
    reviewModal.style.display = "block";
}
