﻿function toggleDropdown(dropdownListId, dropdownDisplayId) {
    var dropdownList = document.getElementById(dropdownListId);
    dropdownList.classList.toggle('open');
    var dropdownDisplay = document.getElementById(dropdownDisplayId);
    dropdownDisplay.classList.toggle('open');
}

function selectOption(option, dropdownDisplayId) {
    var dropdownDisplay = document.getElementById(dropdownDisplayId);
    dropdownDisplay.textContent = option;
    var dropdownList = dropdownDisplay.nextElementSibling;
    dropdownList.classList.remove('open');
}




// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
    if (!event.target.matches('.eclipse-display') && !event.target.matches('.fa')) {
        var dropdowns = document.getElementsByClassName("eclipse-list");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            openDropdown.style.display = "none";
        }
    }

    if (event.target.classList.contains('modal')) {
        event.target.style.display = "none";
    }
};



window.onclick = function (event) {
    if (!event.target.matches('.eclipse-display')) {
        var dropdowns = document.getElementsByClassName("eclipse-list");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('open')) {
                openDropdown.classList.remove('open');
            }
        }
    }
}

function toggleDropdown(dropdownId) {
    var dropdown = document.getElementById(dropdownId);
    dropdown.style.display = (dropdown.style.display === 'none' ? 'block' : 'none');
}
// Function to display the modal
function showModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "block";
}

// Function to close the modal
function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "none";
}

