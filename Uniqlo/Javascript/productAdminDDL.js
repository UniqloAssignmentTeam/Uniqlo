function toggleDropdown(dropdownListId, dropdownDisplayId) {
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
