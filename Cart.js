$(document).ready(function () {
    loadCart(); // Tải giỏ hàng từ Local Storage
});

let cart = [];

// Hàm thêm sản phẩm vào giỏ hàng
function addItemToCart(name, price, image) {
    const existingItem = cart.find(item => item.name === name);

    if (existingItem) {
        existingItem.quantity++; // Tăng số lượng nếu sản phẩm đã có
    } else {
        cart.push({ name, price, image, quantity: 1 }); // Thêm sản phẩm mới
    }

    updateCart(); // Cập nhật giỏ hàng
}
function loadCart() {
    const storedCart = localStorage.getItem('cart');
    if (storedCart) {
        cart = JSON.parse(storedCart); // Chuyển đổi chuỗi JSON thành mảng
        updateCart(); // Cập nhật giỏ hàng hiển thị
    }
}
// Cập nhật giỏ hàng
function updateCart() {
    const cartTableBody = $('.show-cart');
    cartTableBody.empty(); // Xóa nội dung cũ
    let totalPrice = 0;

    cart.forEach(item => {
        const itemPrice = item.price * item.quantity;
        totalPrice += itemPrice;

        const row = `
    <tr>
        <td class="text-center"><img src="${item.image}" width="50" height="50" /></td>
        <td class="text-center">${item.name}</td>
        <td class="text-center">${formatPrice(item.price)}</td>
        <td class="text-center">
            <button class="btn btn-light" onclick="changeQuantity('${item.name}', -1)">-</button>
            <span class="quantity">${item.quantity}</span>
            <button class="btn btn-light" onclick="changeQuantity('${item.name}', 1)">+</button>
        </td>
        <td class="text-center"><button class="btn btn-danger" onclick="removeItem('${item.name}')">Xóa</button></td>
    </tr>
`;
        cartTableBody.append(row);
    });

    $('#subtotals').text(formatPrice(totalPrice)); // Cập nhật tổng giá

    // Lưu giỏ hàng vào Local Storage
    localStorage.setItem('cart', JSON.stringify(cart));
}

// Hàm xóa sản phẩm khỏi giỏ hàng
function removeItem(name) {
    cart = cart.filter(item => item.name !== name); // Lọc bỏ sản phẩm
    updateCart(); // Cập nhật giỏ hàng
}

// Hàm định dạng giá tiền
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ';
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}

// Hàm mở modal giỏ hàng
function openModal() {
    document.getElementById("myCartModal").style.display = "block";
}

// Hàm đóng modal giỏ hàng
function closeModal() {
    document.getElementById("myCartModal").style.display = "none";
}

// Hàm thêm sản phẩm vào giỏ hàng khi nhấn nút
function addToCart() {
    const name = $('#product-name').text();
    const price = parseInt($('#product-price').text().replace(/\D/g, ''), 10); // Lấy giá sản phẩm
    const image = $('#product-image').attr('src');

    if (!isNaN(price) && name && image) {
        addItemToCart(name, price, image); // Thêm vào giỏ hàng
        openModal(); // Mở modal giỏ hàng
    } else {
        alert("Thông tin sản phẩm không hợp lệ.");
    }
}

function changeQuantity(name, change) {
    const item = cart.find(item => item.name === name);
    if (item) {
        item.quantity += change; // tăng hoặc giảm số lượng 
        if (item.quantity <= 0) {
            removeItem(name); // Xóa sản phẩm nếu số lượng <= 0
        } else {
            updateCart(); // Cập nhật giỏ hàng
        }
    }
}
