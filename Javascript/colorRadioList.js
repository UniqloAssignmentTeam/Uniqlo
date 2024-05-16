document.addEventListener("DOMContentLoaded", function () {
    // Define the colors corresponding to each radio button
    var colors = ["White", "Grey", "Pink"];
    // Select all labels in the radio button list
    var radioButtons = document.querySelectorAll('.color-radio-list input[type="radio"]');
    var labels = document.querySelectorAll('.color-radio-list label');

    // Set background color for each label and add event listeners
    labels.forEach(function (label, index) {
        label.style.backgroundColor = colors[index]; // Set the background color

        // Add a change event listener to each corresponding radio button
        radioButtons[index].addEventListener('change', function () {
            if (this.checked) {
                const displayLabel = document.querySelector('#color');
                displayLabel.textContent = colors[index]; // Update the display label with the color value
            }
        });
    });
});
