$(document).ready(function () {
    loadCart();
});

function loadCart() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    if (cart.length === 0) {
        $('#cartContainer').html('<p>Giỏ hàng của bạn đang trống.</p>');
        return;
    }

    let totalAmount = 0;
    let totalQuantity = 0;

    const html = `
        <table>
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Giảm giá (%)</th>
                    <th>Tổng</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                ${cart.map((item, index) => {
        const price = item.price || 0;
        const quantity = item.quantity || 1;
        const discount = item.discount || 0;
        const itemTotal = price * quantity;
        const discountAmount = (discount / 100) * itemTotal;
        const totalAfterDiscount = itemTotal - discountAmount;
        totalAmount += totalAfterDiscount;
        totalQuantity += quantity;
        return `
                    <tr>
                        <td><img src="${item.image}" alt="${item.name}" /></td>
                        <td>${item.name}</td>
                        <td>${formatPrice(price)}</td>
                        <td>${quantity}</td>
                        <td>
                            <input type="number" value="${discount}" min="0" onchange="updateDiscount(${index}, this.value)" />
                        </td>
                        <td>${formatPrice(totalAfterDiscount)}</td>
                        <td><button class="btn-delete" onclick="removeFromCart(${index})">Xóa <i class="fa-solid fa-trash"></i></button></td>
                    </tr>
                `;
    }).join('')}
            </tbody>
        </table>
        <h3>Tổng tiền: ${formatPrice(totalAmount)}</h3>
        <h3>Tổng số lượng: ${totalQuantity}</h3>
    `;
    $('#cartContainer').html(html);
}

function formatPrice(price) {
    return price.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
}

function removeFromCart(index) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    cart.splice(index, 1);
    localStorage.setItem('cart', JSON.stringify(cart));
    loadCart();
}

function updateDiscount(index, discount) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    cart[index].discount = Math.max(0, discount); // Đảm bảo giảm giá không âm
    localStorage.setItem('cart', JSON.stringify(cart));
    loadCart(); // Tải lại giỏ hàng để cập nhật giá trị
}

function checkout() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    if (cart.length === 0) {
        alert("Giỏ hàng của bạn đang trống. Không thể thanh toán.");
        return;
    }

    const summaryHtml = `
        <table>
            <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                    <th>Tổng</th>
                </tr>
            </thead>
            <tbody>
                ${cart.map(item => {
        const price = item.price || 0;
        const quantity = item.quantity || 1;
        const itemTotal = price * quantity;
        return `
                    <tr>
                        <td><img src="${item.image}" alt="${item.name}" style="max-width: 50px; max-height: 50px;" /></td>
                        <td>${item.name}</td>
                        <td>${quantity}</td>
                        <td>${formatPrice(price)}</td>
                        <td>${formatPrice(itemTotal)}</td>
                    </tr>
                `;
    }).join('')}
            </tbody>
        </table>
    `;
    $('#checkoutSummary').html(summaryHtml);
    $('#checkoutForm').show();
}

function submitOrder() {
    const name = $('#name').val().trim();
    const address = $('#address').val().trim();
    const phone = $('#phone').val().trim();

    if (!name || !address || !phone) {
        alert("Vui lòng nhập đầy đủ thông tin.");
        return;
    }

    const invoiceHtml = `
        <h3>Tình trạng: Thông tin đơn hàng của bạn đã thanh toán thành công</h3>
        <p>Tên khách hàng: ${name}</p>
        <p>Địa chỉ: ${address}</p>
        <p>Số điện thoại: ${phone}</p>
        <div>${$('#checkoutSummary').html()}</div>
    `;
    $('#invoiceDetails').html(invoiceHtml);
    $('#invoice').show();
    localStorage.removeItem('cart');
    $('#cartContainer').html('<p>Giỏ hàng của bạn đã được thanh toán. Cảm ơn bạn!</p>');
    $('#checkoutForm').hide();
}

function continueShopping() {
    window.location.href = "HomePage.aspx"; // Thay thế bằng URL trang mua sắm của bạn
}
