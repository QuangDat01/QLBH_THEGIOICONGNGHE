<%@ Page Title="" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="MobileRepair.aspx.cs" Inherits="QLBH.FontEnd.MobileRepair" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .repair-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0;
        }

        .mobile {
            width: 18%; /* Điều chỉnh kích thước mỗi sản phẩm */
            margin-bottom: 20px; /* Khoảng cách giữa các hàng */
            padding: 10px; /* Khoảng cách bên trong sản phẩm */
            text-align: center; /* Căn giữa nội dung */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Đổ bóng cho sản phẩm */
            border-radius: 5px; /* Bo góc cho sản phẩm */
            transition: transform 0.2s; /* Hiệu ứng chuyển động */
        }

        .mobile:hover {
            transform: translateY(-5px); /* Hiệu ứng di chuyển lên khi hover */
        }

        .image {
            width: 100%; /* Đảm bảo hình ảnh có chiều rộng đầy đủ */
            height: auto; /* Tự động điều chỉnh chiều cao */
        }

        .btn-primary {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: white;
            background-color: firebrick; /* Màu nền cho nút */
            padding: 10px 15px; /* Padding cho nút */
            border-radius: 5px; /* Bo góc cho nút */
        }

        .images {
            width: 275px; /* Kích thước chiều rộng cố định */
            height: auto; /* Kích thước chiều cao cố định */
            object-fit: cover; /* Cắt và căn chỉnh hình ảnh cho phù hợp */
        }

        .price {
            font-weight: bold; /* Để giá nổi bật hơn */
            color: firebrick; /* Màu sắc của giá */
        }

        .repair-description {
            margin-top: 5px; /* Khoảng cách giữa mô tả và giá */
            font-size: 20px; /* Kích thước chữ mô tả */
            color: gray; /* Màu chữ mô tả */
        }
        .content-price{
            font: 18px;
            color: red;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="image-container">
        <img src="../Uploads/_thumbs/Images/Repair1.jpg" class="image" />
        <img src="../Uploads/_thumbs/Images/Repair2.jpg" class="image" />
        <img src="../Uploads/_thumbs/Images/Repair3.jpg" class="image" />        
    </div>

    <div class="repair-container">
        <% 
            string[,] products = {
                {"Sàng Main các đời iPhone từ 6 - 15", "~1.000.000 vnđ", "../Uploads/_thumbs/Images/main.jpg"},
                {"Cụm Camera sau IPhone 12 PRO", "900.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/Camsau_12pro.jpg"},
                {"iPhone Hao Nguồn", " ~1.500.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/iPhoneHaoNguon.jpg"},
                {"Thay màn iPhone 13 Pro & Pro Max", "~1.999.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/13-pro_man.jpg"},
                {"Thay màn iPhone 14 Pro & Pro Max", "~2.999.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/14pro.jpg"},
                {"Cáp sạc các đời iPhone từ 6 - 15", "~1.999.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/cap-sac-iphone-xr.jpg"},
                {"Chân sạc các đời iPhone từ 6 - 15", "~2.999.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/chan_sac.jpg"},
                {"Loa ngoài iPhone 11 PRM", "800.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/ear_speaker_for_apple_iphone_11_pro_max.jpg"},
                {"Ép kính màn hình 13, 13 Pro, 13 PRM", "~2.000.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/ep_kinh.jpg"},
                {"Thay kính lưng iPhone 12 Pro & Pro Max", "1.000.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/KinhLungIP12PRM.jpg"},
                {"Thay pin dung lượng cao", "500.000 - 1.000.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/PIN_pisen.jpg"},
                {"Thay pin dung lượng cao", "1.000.000 - 2.000.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/PIN_pisen.jpg"},
                {"Thay pin dung lượng cao", "2.000.000 - 3.000.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/PIN_pisen.jpg"},               
                {"Thay màn hình chuẩn hãng", "2.000.000 - 3.500.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/MH-IP11,12,13%20thường-SR.jpg"},
                {"Thay màn hình chuẩn hãng", "3.500.000 - 4.500.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/MH-IP11,12,13%20thường-SR.jpg"},
                {"Thay IC màn hình", "~999.999 vnđ", "../Uploads/_thumbs/Images/MobileRepair/Sua-loi-hien-thi-tren-dien-thoai-iphone-14.jpg"},
                {"Cụm chân sạc iPhone 13 Pro & Pro Max", "500.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/thay-cum-chan-sac-iphone-13-mini.jpg"},
                {"Thay vỏ iPhone 14 chuẩn hãng", "4.500.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/thay-vo-iphone-14-pro-max.jpg"},
                {"Thay màn Xiaomi K50", "1.500.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/thaymanK50.jpg"},
                {"Thay vỏ SamSung Galaxy S", "1.900.000 vnđ", "../Uploads/_thumbs/Images/MobileRepair/thay-vo-samsung-galaxy-s10-plus.jpg"},
            };

            for (int i = 0; i < products.GetLength(0); i++)
            {
        %>
        <div class="mobile">
            <img src="<%= products[i, 2] %>" class="images" />
            <h3 class="tieude"><%= products[i, 0] %></h3>
            <div class="thongso">
                <p class="repair-description">Giá: <span class="price"><%= products[i, 1] %></span></p>
            </div>
            <div>
                <p class="content-price">Giá bao gồm cả công thay thế</p>
            </div>
        </div>
        <% 
                // Mỗi 5 sản phẩm sẽ tạo một hàng mới
                if ((i + 1) % 5 == 0)
                {
                    Response.Write("<div style='flex-basis: 100%; height: 0;'></div>"); // Tạo một hàng mới
                }
            }
        %>
    </div>
</asp:Content>
