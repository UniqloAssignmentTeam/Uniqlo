function toggleDropdown() {
    document.getElementById('dropdownList').classList.toggle('open');
    document.querySelector('.dropdown-container').classList.toggle('open');
}

function selectOption(option) {
    document.getElementById('dropdownDisplay').textContent = option;
    document.getElementById('dropdownList').classList.remove('open');
    // Do something with the selected option value here, like storing it or submitting.
}

// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
    if (!event.target.matches('.dropdown-display')) {
        var dropdowns = document.getElementsByClassName("dropdown-list");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('open')) {
                openDropdown.classList.remove('open');
            }
        }
    }
}


