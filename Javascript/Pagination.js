function changePage(page) {
    var links = document.querySelectorAll('.page-link');
    links.forEach(function (link) {
        link.classList.remove('active');
    });

    if (page === 'prev') {
        var currentPage = document.querySelector('.active');
        var prevPage = currentPage.previousElementSibling;
        if (prevPage && prevPage.textContent !== '«') {
            prevPage.classList.add('active');
        } else {
            document.querySelector('.page-link:nth-child(2)').classList.add('active');
        }
    } else if (page === 'next') {
        var currentPage = document.querySelector('.active');
        var nextPage = currentPage.nextElementSibling;
        if (nextPage && nextPage.textContent !== '»') {
            nextPage.classList.add('active');
        } else {
            document.querySelector('.page-link:last-child').previousElementSibling.classList.add('active');
        }
    } else {
        document.querySelector('.page-link:nth-child(' + (page + 1) + ')').classList.add('active');
    }
}
