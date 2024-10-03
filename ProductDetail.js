$(document).ready(function () {
    // Lấy ID sản phẩm từ URL
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id'); // Lấy ID sản phẩm từ query string

    // Tải thông tin sản phẩm
    if (productId) {
        loadProductDetails(productId);
    }
});

// Hàm tải thông tin sản phẩm từ Product.aspx
function loadProductDetails(productId) {
    $.ajax({
        type: "POST",
        url: "../Admin/Product.aspx/GetbyID", // Đường dẫn tới WebMethod
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ ID: productId }), // Chuyển đổi ID sản phẩm thành JSON
        success: function (response) {
            console.log(response); // Xem toàn bộ phản hồi từ server
            if (response.d) {
                // Hiển thị thông tin sản phẩm lên trang
                $('#product-name').text(response.d.ProductName);
                $('#product-image').attr('src', response.d.ProductImage);
                $('#product-description').text(response.d.ProductDescription);
                $('#product-price').text(formatPrice(response.d.ProductPrice));

                // Cập nhật nội dung trường Detail
                $('#product-detail').html(response.d.Detail); // Sử dụng html() để hiển thị chi tiết sản phẩm
            } else {
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Hàm formatPrice để định dạng giá tiền
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ'; // Trả về giá mặc định nếu giá không hợp lệ
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}
