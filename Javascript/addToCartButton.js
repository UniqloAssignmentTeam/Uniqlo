const cartButtons = document.querySelectorAll('.cart-button');

cartButtons.forEach(button => {
    button.addEventListener('click', cartClick);
});

function cartClick() {
    let button = this;
    button.classList.add('clicked');

    // Listen for the animationend event
    button.addEventListener('animationend', function () {
        // Use setTimeout to delay the class removal by 1 second
        setTimeout(() => {
            // Remove the 'clicked' class to return to normal state
            button.classList.remove('clicked');
        }, 1000); // Delay in milliseconds
    }, { once: true }); // The { once: true } option auto-removes this event listener after it fires once
}
