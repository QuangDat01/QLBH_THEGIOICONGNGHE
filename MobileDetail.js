$(document).ready(function () {
    // Lấy ID sản phẩm từ URL
    const urlParams = new URLSearchParams(window.location.search);
    const mobileId = urlParams.get('id'); // Lấy ID sản phẩm từ query string

    // Tải thông tin sản phẩm
    if (mobileId) {
        loadMobileDetails(mobileId);
    }
});

// Hàm tải thông tin sản phẩm từ Mobile.aspx
function loadMobileDetails(mobileId) {
    $.ajax({
        type: "POST",
        url: "../Admin/Mobile.aspx/GetbyID", // Đường dẫn tới WebMethod
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ ID: mobileId }), // Chuyển đổi ID sản phẩm thành JSON
        success: function (response) {
            console.log(response); // Xem toàn bộ phản hồi từ server
            if (response.d) {
                // Hiển thị thông tin sản phẩm lên trang
                $('#mobile-name').text(response.d.MobileName);
                $('#mobile-image').attr('src', response.d.MobileImage);
                $('#mobile-price').text(formatPrice(response.d.MobilePrice));
                $('#mobile-description').text(response.d.MobileDescription);
                $('#mobile-id').val(response.d.MobileID); // Lưu ID sản phẩm vào trường ẩn
                $('#mobile-detail').html(response.d.MobileDetail); // Hiển thị chi tiết sản phẩm
                updateCartCount(); // Cập nhật số lượng giỏ hàng mỗi khi tải sản phẩm
            } else {
                alert("Không tìm thấy sản phẩm.");
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ'; // Trả về giá mặc định nếu giá không hợp lệ
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}
