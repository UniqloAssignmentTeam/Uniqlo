document.addEventListener('DOMContentLoaded', function () {
    var thumbnails = document.querySelectorAll('.img-item img');
    if (thumbnails.length > 0) {
        // Set the src of the main image to the src of the first thumbnail
        document.getElementById('mainImg').src = thumbnails[0].src;
    }
});

function updateMainImage(imageUrl) {
    document.getElementById('mainImg').src = '/ImageHandler.ashx?id=' + imageUrl;
}
