$(document).ready(function () {
    $('.dropdown-toggle').on('click', function (e) {
        e.preventDefault();
        $(this).siblings('.dropdown-menu').toggle();
    });
});
