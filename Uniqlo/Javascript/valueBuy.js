document.addEventListener('DOMContentLoaded', function () {
    var wishlistLabels = document.querySelectorAll('.wishlist-heart-group label');
    wishlistLabels.forEach(function (label) {
        label.addEventListener('click', function (event) {
            event.preventDefault();
            var checkbox = this.previousElementSibling;
            if (checkbox) {
                checkbox.checked = !checkbox.checked;
                checkbox.dispatchEvent(new Event('change'));
            }
        });
    });
});