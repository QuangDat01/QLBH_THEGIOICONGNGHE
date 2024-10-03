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
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Hàm thêm sản phẩm vào giỏ hàng
function addCart() {
    const mobileId = $('#mobile-id').val(); // Lấy ID sản phẩm
    const mobileName = $('#mobile-name').text(); // Lấy tên sản phẩm
    const mobilePriceText = $('#mobile-price').text(); // Lấy giá định dạng
    const mobilePrice = parseInt(mobilePriceText.replace(/\./g, '').replace(' VNĐ', '')); // Chuyển đổi giá về số

    const mobileImage = $('#mobile-image').attr('src'); // Lấy hình ảnh sản phẩm

    // Kiểm tra xem mobileId có hợp lệ không
    if (!mobileId) {
        alert("Thông tin sản phẩm không hợp lệ.");
        return;
    }

    // Tạo một đối tượng đại diện cho sản phẩm trong giỏ hàng
    const cartItem = {
        id: mobileId,
        name: mobileName,
        price: mobilePrice,
        image: mobileImage,
        quantity: 1,
    };

    // Lấy giỏ hàng từ localStorage hoặc tạo một giỏ hàng mới
    let cart = JSON.parse(localStorage.getItem('cart')) || [];

    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    const existingItemIndex = cart.findIndex(item => item.id === mobileId);

    if (existingItemIndex > -1) {
        // Nếu đã có, tăng số lượng lên 1
        cart[existingItemIndex].quantity += 1; // Tăng số lượng lên 1        
    } else {
        // Nếu chưa có, thêm sản phẩm mới vào giỏ hàng
        cart.push(cartItem);
    }

    localStorage.setItem('cart', JSON.stringify(cart)); // Lưu giỏ hàng trở lại localStorage

    updateCartTotal(); // Cập nhật tổng giá trị giỏ hàng

    // Cập nhật show-cart trong modal
    updateShowCart(cart);

    // Mở modal giỏ hàng ngay sau khi thêm sản phẩm
    openModal(); // Gọi hàm mở modal giỏ hàng

    // Cập nhật giao diện giỏ hàng
    updateCartCount();
}

// Hàm mở modal giỏ hàng
function openModal() {
    document.getElementById("myCartModal").style.display = "block";
}

// Hàm đóng modal giỏ hàng
function closeModal() {
    document.getElementById("myCartModal").style.display = "none";
}




// Hàm cập nhật hiển thị giỏ hàng trong modal
function updateShowCart(cart) {
    const showCart = $('.show-cart');
    showCart.empty(); // Xóa nội dung hiện tại

    cart.forEach(item => {
        const row = `
            <tr>
                <td class="text-center"><img src="${item.image}" alt="${item.name}" width="50" height="50"></td>
                <td class="text-center">${item.name}</td>
                <td class="text-center">${formatPrice(item.price)}</td>
                <td class="text-center">
                    <button class="btn btn-light" onclick="decreaseQuantity('${item.id}')">-</button>
                    <span class="quantity">${item.quantity}</span>
                    <button class="btn btn-light" onclick="increaseQuantity('${item.id}')">+</button>
                </td>
                <td class="text-center"><button class="btn btn-danger" onclick="removeFromCart('${item.name}')">Xóa</button></td>
            </tr>
        `;
        showCart.append(row); // Thêm hàng vào bảng
    });
}

// Hàm xóa sản phẩm khỏi giỏ hàng
function removeFromCart(name) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    cart = cart.filter(item => item.name !== name); // Lọc sản phẩm ra khỏi giỏ hàng
    localStorage.setItem('cart', JSON.stringify(cart)); // Lưu lại giỏ hàng
    updateShowCart(cart); // Cập nhật lại hiển thị giỏ hàng
    updateCartCount(); // Cập nhật số lượng sản phẩm
    updateCartTotal(); // Cập nhật tổng giá trị giỏ hàng
}

// Hàm cập nhật số lượng trong giỏ hàng
function updateCartCount() {
    // Lấy giỏ hàng từ localStorage
    let cart = JSON.parse(localStorage.getItem('cart')) || []; // Nếu không có giỏ hàng thì khởi tạo rỗng
    // Cập nhật số lượng sản phẩm trong giỏ hàng
    $('#cart-count').text(cart.length > 0 ? cart.length : 0); // Đảm bảo không có giá trị âm hoặc không hợp lệ
}

// Hàm cập nhật tổng giá trị trong giỏ hàng
function updateCartTotal() {
    let cart = JSON.parse(localStorage.getItem('cart')) || []; // Lấy giỏ hàng từ localStorage
    let total = 0;

    // Tính tổng giá trị giỏ hàng
    cart.forEach(item => {
        total += item.price * item.quantity; // Tính tổng theo số lượng của từng sản phẩm
    });

    $('#subtotals').text(formatPrice(total)); // Cập nhật tổng giá
}

// Hàm formatPrice để định dạng giá tiền
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ'; // Trả về giá mặc định nếu giá không hợp lệ
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}
// Hàm tăng số lượng sản phẩm
function increaseQuantity(id) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const itemIndex = cart.findIndex(item => item.id === id);

    if (itemIndex > -1) {
        cart[itemIndex].quantity += 1; // Tăng số lượng lên 1
        localStorage.setItem('cart', JSON.stringify(cart)); // Lưu giỏ hàng
        updateShowCart(cart); // Cập nhật hiển thị giỏ hàng
        updateCartTotal(); // Cập nhật tổng giá trị giỏ hàng
        updateCartCount(); // Cập nhật số lượng sản phẩm
    }
}

// Hàm giảm số lượng sản phẩm
function decreaseQuantity(id) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const itemIndex = cart.findIndex(item => item.id === id);

    if (itemIndex > -1) {
        if (cart[itemIndex].quantity > 1) {
            cart[itemIndex].quantity -= 1; // Giảm số lượng xuống 1
        } else {
            cart = cart.filter(item => item.id !== id); // Xóa sản phẩm nếu số lượng = 1
        }
        localStorage.setItem('cart', JSON.stringify(cart)); // Lưu giỏ hàng
        updateShowCart(cart); // Cập nhật hiển thị giỏ hàng
        updateCartTotal(); // Cập nhật tổng giá trị giỏ hàng
        updateCartCount(); // Cập nhật số lượng sản phẩm
    }
}
