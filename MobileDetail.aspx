<%@ Page Title="" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="MobileDetail.aspx.cs" Inherits="QLBH.FontEnd.MobileDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chi tiết di động</title>
    <link href="CSS/MobileDetail.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="mobile-detail-container">
        <h1 id="mobile-name"></h1>
       <div class="mobile-detail-content">
    <div class="image-offer-container">
        <img id="mobile-image" src="#" alt="Hình ảnh di động" width="300" height="300" />
    </div>
    <div class="offer-detail">
        <div class="title">
            <i class="fa fa-gift"></i>
            Thông tin Khuyến mãi và bảo hành
        </div>
        <div class="content-offer">
            <p class="private-offer specialOfferGroup">
                <i class="fa fa-check"></i>
                <span class="kmai">
                    <a href="WarrantyPolicy.aspx">1 đổi 1 VIP 6 tháng: Đổi máy mới tương đương khi có lỗi từ NSX trong 6 tháng</a>
                </span>
            </p>
            <p class="private-offer specialOfferGroup">
                <i class="fa fa-check"></i>
                <span class="kmai">Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C</span>
            </p>
            <p class="private-offer specialOfferGroup">
                <i class="fa fa-check"></i>
                <span class="kmai">
                    <a href="#">Thẻ Gold Member - ƯU ĐÃI GIÁ TRỊ trị giá 1.290.000 đ</a>
                </span>
            </p>
            <p class="private-offer specialOfferGroup">
                <i class="fa fa-check"></i>
                <span class="kmai">
                    <a href="TechnicalSupport.aspx">Bảo vệ sản phẩm toàn diện với dịch vụ bảo hành mở rộng</a>
                </span>
            </p>
            <p class="private-offer specialOfferGroup">
                <i class="fa fa-check"></i>
                <span class="kmai">Giá sản phẩm đã bao gồm VAT</span>
            </p>
        </div>
    </div>
</div>

        <p id="mobile-description">Mô tả sản phẩm sẽ hiển thị ở đây.</p>
        <p id="mobile-price">Giá di động sẽ hiển thị ở đây.</p>

        <input type="hidden" id="mobile-id" /> <!-- Trường ẩn cho ID sản phẩm -->

        <a class="addcart" onclick="addCart()"><i class="fa-solid fa-cart-plus"></i> thêm vào giỏ</a>

        <div id="mobile-detail">Chi tiết di động sẽ hiển thị ở đây.</div>
    </div>

    <span id="cart-count">0</span> <!-- Phần tử hiển thị số lượng sản phẩm trong giỏ hàng -->
    <p id="cart-total">0 VNĐ</p> <!-- Phần tử hiển thị tổng giá trị giỏ hàng -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="JS/CartMobile.js"></script>
</asp:Content>
