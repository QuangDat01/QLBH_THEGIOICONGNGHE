$(document).ready(function () {
    loadMobileProducts(); // Tải sản phẩm di động khi trang web được tải
});

// Hàm formatPrice để định dạng giá tiền
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ'; // Trả về giá mặc định nếu giá không hợp lệ
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}

// Hàm loadMobileProducts lấy dữ liệu từ Admin/Mobile.aspx
function loadMobileProducts() {
    var container = $('.mobile-container'); // Thay đổi ở đây
    container.html('<p>Đang tải dữ liệu...</p>'); // Thông báo tải dữ liệu

    $.ajax({
        type: "POST",
        url: "../Admin/Mobile.aspx/GetAllMobileWithCatMobile", // Đường dẫn tới WebMethod
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: '{}',
        success: function (response) {
            if (response.d && response.d.length > 0) {
                displayMobileProducts(response.d); // Gọi hàm hiển thị sản phẩm di động
            } else {
                container.html('<p>Không có sản phẩm nào.</p>'); // Thông báo không có sản phẩm
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText); // Hiển thị lỗi
        }
    });
}

// Hàm hiển thị sản phẩm di động theo dạng lưới ngang
function displayMobileProducts(mobiles) {
    var container = $('.mobile-container'); // Thay đổi ở đây
    container.empty(); // Xóa sạch các sản phẩm cũ

    $.each(mobiles, function (index, mobile) {
        var mobileHTML = `
            <div onclick="window.location.href='MobileDetail.aspx?id=${mobile.MobileID}'">
                <img class="Mobile-img" src="${mobile.MobileImage}" alt="${mobile.MobileName}">
                <h3>${mobile.MobileName}</h3>
                <p class="mobile-description">${truncateDescription(mobile.MobileDescription)}</p>
                <p class="mobile-price">${formatPrice(mobile.MobilePrice)}</p>
            </div>
        `;
        container.append(mobileHTML); // Thêm sản phẩm vào container
    });
}

// Hàm để giới hạn mô tả sản phẩm hiển thị 100 ký tự
function truncateDescription(description) {
    if (description.length > 100) {
        return description.substring(0, 100) + "...";
    }
    return description;
}
