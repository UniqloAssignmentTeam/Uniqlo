
//Category
function toggleDropdown2() {
    document.getElementById('dropdownList2').classList.toggle('open');
    document.querySelector('.dropdown-container2').classList.toggle('open');
}
function selectOption2(option) {

    // Do something with the selected option value here, like storing it or submitting.
    document.getElementById('dropdownDisplay2').textContent = option;
    document.getElementById('dropdownList2').classList.remove('open');


}
window.onclick = function (event) {

    if (!event.target.matches('.dropdown-display2')) {
        var dropdowns = document.getElementsByClassName("dropdown-list2");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('open')) {
                openDropdown.classList.remove('open');
            }
        }
    }

}
