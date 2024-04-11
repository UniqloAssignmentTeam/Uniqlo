// Toggle dropdown visibility
function toggleDropdown2() {
    var eclipseList = document.getElementById("eclipseList");
    var isDisplayed = window.getComputedStyle(eclipseList).display !== "none";
    eclipseList.style.display = isDisplayed ? "none" : "block";
}

// Show modal
function showModal(modalId) {
    // Implementation to show modal
}

// Close modal
function closeModal(modalId) {
    // Implementation to close modal
}

// Close dropdowns or modals if the user clicks outside of them
window.onclick = function (event) {
    var eclipseList = document.getElementById("eclipseList");
    if (!event.target.matches('.eclipse-display') && !event.target.matches('.fa')) {
        eclipseList.style.display = "none";
    }

    if (event.target.matches('.modal')) {
        // Close the modal
    }
};
