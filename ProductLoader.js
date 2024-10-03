$(document).ready(function () {
    loadProducts(); // Tải sản phẩm khi trang web được tải
});

// Hàm formatPrice để định dạng giá tiền
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ'; // Trả về giá mặc định nếu giá không hợp lệ
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}

// Hàm loadProducts lấy dữ liệu từ Admin/Product.aspx
function loadProducts() {
    var container = $('.product-container');
    container.html('<p>Đang tải dữ liệu...</p>');

    $.ajax({
        type: "POST",
        url: "../Admin/Product.aspx/GetAllProductsWithCategory", // Đường dẫn tới WebMethod
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: '{}',
        success: function (response) {
            if (response.d && response.d.length > 0) {
                displayProducts(response.d); // Gọi hàm hiển thị sản phẩm
            } else {
                container.html('<p>Không có sản phẩm nào.</p>');
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Hàm hiển thị sản phẩm theo dạng lưới ngang
function displayProducts(products) {
    var container = $('#product-container');
    container.empty();

    $.each(products, function (index, product) {
        var productHTML = `
            <div class="product" onclick="window.location.href='ProductDetail.aspx?id=${product.ProductID}'">
                <img src="${product.ProductImage}" alt="${product.ProductName}">
                <h3>${product.ProductName}</h3>
                <p class="product-description">${truncateDescription(product.ProductDescription)}</p>
                <p class="product-price">${formatPrice(product.ProductPrice)}</p>
            </div>
        `;
        container.append(productHTML);
    });
}

// Hàm để giới hạn mô tả sản phẩm hiển thị 100 ký tự
function truncateDescription(description) {
    if (description.length > 100) {
        return description.substring(0, 100) + "...";
    }
    return description;
}
