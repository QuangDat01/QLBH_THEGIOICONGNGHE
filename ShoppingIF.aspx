<%@ Page Title="" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="ShoppingIF.aspx.cs" Inherits="QLBH.FontEnd.ShoppingIF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/ShoppingIF.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Giỏ hàng của bạn</h1>
    <div id="cartContainer"></div>
    <div class="action-buttons">
        <button class="btn" onclick="checkout()">Thanh toán</button>
        <button class="btn" onclick="continueShopping()">Tiếp tục mua hàng</button> <!-- Đã bỏ lớp btn-secondary -->
    </div>

    <div class="checkout-form" id="checkoutForm" style="display: none;">
        <h2>Thông tin thanh toán</h2>
        <div class="summary" id="checkoutSummary"></div>
        <div class="form-group">
            <label for="name">Họ và tên:</label>
            <input type="text" id="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" required>
        </div>
        <div class="form-group">
            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" required>
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại:</label>
            <input type="tel" id="phone" required>
        </div>
        <button class="btn" onclick="submitOrder()">Xác nhận thanh toán</button>
    </div>

    <div class="invoice" id="invoice" style="display: none;">
        <h2>Hóa Đơn</h2>
        <div id="invoiceDetails"></div>
    </div>

    <script src="JS/ShoppingIF.js"></script>
</asp:Content>
