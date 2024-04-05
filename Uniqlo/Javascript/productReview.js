$(document).ready(function () {
    $('.stars').click(function () {
        let stars = $(this).data('value');
        $('#star').val(stars);
        for (let i = 0; i < 5; i++) {
            if (i < stars) {
                $($('.stars')[i]).html('star');
            } else {
                $($('.stars')[i]).html('star_border');
            }
        }
    });

    $('.submit').click(function (e) {
        e.preventDefault();
        if ($('#star').val() == '') {
            alert('please choose stars');
            return false;
        }
        if ($('#textarea1').val() == '') {
            alert('please Write a review');
            return false;
        }

        if ($('#textarea1').val() != '' && $('#star').val() != '') {
            $('.review_form').submit();
        }



    });
});