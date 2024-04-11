document.addEventListener('DOMContentLoaded', function () {
    // Get all radio buttons within the RadioButtonList container
    const radioButtons = document.querySelectorAll('.custom-radio-list input[type=radio]');

    radioButtons.forEach(radioButton => {
        radioButton.addEventListener('change', function () {
            if (this.checked) {
                const label = document.querySelector('#size');
                label.textContent = this.nextSibling.innerText;
            }
        });
    });
});

