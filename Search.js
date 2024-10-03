function performSearch() {
    const query = $('#search-input').val();

    if (query.trim() === '') {
        $('#search-results').hide();
        return;
    }

    $.ajax({
        type: "POST",
        url: "../Admin/Product.aspx/SearchProducts",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ query: query }),
        success: function (response) {
            const results = response.d;
            $('#search-results').empty();

            if (results && results.length > 0) {
                results.forEach(product => {
                    $('#search-results').append(`<li>${product.ProductName}</li>`);
                });
                $('#search-results').show();
            } else {
                $('#search-results').append('<li>Không tìm thấy sản phẩm.</li>');
                $('#search-results').show();
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Hàm tìm kiếm cho bảng Mobile
function performMobileSearch() {
    const query = $('#search-input').val();

    if (query.trim() === '') {
        $('#search-results').hide();
        return;
    }

    $.ajax({
        type: "POST",
        url: "../Admin/Mobile.aspx/SearchMobiles",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ query: query }),
        success: function (response) {
            const results = response.d;
            $('#search-results').empty();

            if (results && results.length > 0) {
                results.forEach(mobile => {
                    $('#search-results').append(`<li>${mobile.MobileName}</li>`);
                });
                $('#search-results').show();
            } else {
                $('#search-results').append('<li>Không tìm thấy sản phẩm.</li>');
                $('#search-results').show();
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
