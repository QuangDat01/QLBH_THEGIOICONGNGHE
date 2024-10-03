<%@ Page Title="" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="QLBH.FontEnd.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" type="text/css" href="CSS/ProductDetail.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-detail-container">
        <h1 id="product-name"></h1>
        <div class="image-offer-container">
            <img id="product-image" src="#" alt="Hình ảnh sản phẩm" width="400" height="300" />
            <div class="offer-detail">
                <div class="title">
                    <i class="fa fa-gift"></i>
                    Thông tin Khuyến mãi và bảo hành
                </div>
                <div class="content-offer">
                    <p class="private-offer specialOfferGroup">
                        <i class="fa fa-check"></i>
                        <span class="kmai">
                            <a href="WarrantyPolicy.aspx">Bảo hành tại cửa hàng 12 tháng: Đổi máy mới tương đương khi có lỗi từ NSX trong 6 tháng </a>
                        </span>
                    </p>
                    <p class="private-offer specialOfferGroup">
                        <i class="fa fa-check"></i>
                        <span class="kmai">Hộp, Sách hướng dẫn, Cây lấy sim, Cáp Type C </span>
                    </p>
                    <p class="private-offer specialOfferGroup">
                        <i class="fa fa-check"></i>
                        <span class="kmai">
                            <a href="#">Thẻ Gold Member - ƯU ĐÃI GIÁ TRỊ trị giá 1.290.000 đ </a>
                        </span>
                    </p>
                    <p class="private-offer specialOfferGroup">
                        <i class="fa fa-check"></i>
                        <span class="kmai">
                            <a href="TechnicalSupport.aspx">Bảo vệ sản phẩm toàn diện với dịch vụ bảo hành mở rộng </a>
                        </span>
                    </p>
                    <p class="private-offer specialOfferGroup">
                        <i class="fa fa-check"></i>
                        <span class="kmai">Giá sản phẩm đã bao gồm VAT </span>
                    </p>
                </div>
            </div>
        </div>

        <p id="product-description">Mô tả sản phẩm sẽ hiển thị ở đây.</p>
        <p id="product-price">Giá sản phẩm sẽ hiển thị ở đây.</p>

        <a class="add-to-cart" onclick="addToCart()"><i class="fa-solid fa-cart-plus"></i> Thêm vào giỏ</a>

        <div class="img">
            <img src="../Uploads/_thumbs/Images/SaleDetail.jpg" width="350" height="300" />
            <img src="../Uploads/_thumbs/Images/SaleDetail1.jpg" width="350" height="200" />
            <img src="../Uploads/_thumbs/Images/SaleDetail2.jpg" width="350" height="200" />
        </div>
            <p class="P">Mô tả sản phẩm</p>
        <div id="product-detail"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="JS/ProductDetail.js"></script>
    <script src="JS/Cart.js"></script>
</asp:Content>
