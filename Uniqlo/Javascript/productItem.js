const imgs = document.querySelectorAll('.img-select a');
const imgBtns = [...imgs];
let imgId = 1;
var modal = document.getElementById("myModal");

imgBtns.forEach((imgItem) => {
    imgItem.addEventListener('click', (event) => {
        event.preventDefault();
        imgId = imgItem.dataset.id;
        slideImage();
    });
});

function slideImage() {
    const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

    document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
}

window.addEventListener('resize', slideImage);

// Add an event listener for closing the modal
const closeModalButton = document.querySelector('.close'); // Adjust the selector to your modal's close button

//When click outside modal will return slide to first slide and close the modal
window.onclick = function (event) {
    if (event.target == modal) {
        // Reset the slider to the first image
        imgId = 1;
        slideImage();
        modal.style.display = "none";
    }
}

closeModalButton.addEventListener('click', function () {
    // Reset the slider to the first image
    imgId = 1;
    slideImage();
});

