<%@ Page Title="" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="ProductRepair.aspx.cs" Inherits="QLBH.FontEnd.ProductRepair" %>
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
      <img src="../Uploads/_thumbs/Images/LaptopRepair/Repair4.jpg" class="image" />
      <img src="../Uploads/_thumbs/Images/LaptopRepair/Repair5.jpg" class="image" />
      <img src="../Uploads/_thumbs/Images/LaptopRepair/Repair6.jpg" class="image" />             
  </div>

  <div class="repair-container">
      <% 
          string[,] products = {
              {"Sửa chữa bản lề Laptop", "600.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/BanLe.jpg"},
              {"Thay bàn phím ROG FX 706", "900.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/bp-laptop-rog-fx706.jpg"},
              {"Thay bàn phím Dell Latitude", " 1.500.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/BP_dell_latitude.jpg"},
              {"Thay pin Dell Latitude", "1.999.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/dell-latitude-e5420.jpg"},
              {"Thay bàn phím Dell inspiron 5332", "1.600.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/key-dell-342.jpg"},
              {"Thay loa Laptop", "700.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/Loa-linh-kien-Laptop.jpg"},
              {"Thay pin Dell", "500.000 - 3.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/ma-pin-41U3196.jpg"},
              {"Thay pin Các loại", "300.000 - 2.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/MA-PIN-M5Y1K.jpg"},
              {"Vệ sinh Macbook", "500.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/macbook-pro-2019-01VS.jpg"},   
              {"Thay pin Laptop Gamming", "1.000.000 - 3.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/PinLT.jpg"},
              {"Nâng RAM 4, 8, 16, 32", "500.000 - 3.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/RAM.jpg"},         
              {"Lỗi IC nguồn Asus Rog Strix", "5.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/sua-main-loi-ic-nguon-asus-rog-strix-g15-2021-01.jpg"},
              {"Lỗi IC nguồn Asus Rog Zenphyus", "5.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/sua-main-loi-ic-nguon-asus-rog-zephyrus-g14-2021.jpg"},               
              {"Thay màn hình Dell Inspiron", "2.000.000 - 3.500.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/sua-main-loi-ic-nguon-dell-precision-7520.jpg"},
              {"Lỗi Main nguồn Lenovo ThinkPad", "3.500.000 - 4.500.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/sua-main-loi-ic-nguon-lenovo-thinkpad-t440s-2013.jpg"},
              {"Thay màn hình HP Envy X360", "6.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/thay-man-hinh-laptop-hp-envy-x360-convertible-13-ar0000.jpg"},
              {"Quạt tản nhiệt MSI", "500.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/thay-quat-tan-nhiet-laptop-msi-katana-gf66-11ue-gpu-1.jpg"},
              {"Thay vỏ Acer Nitro V", "2.500.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/ThayMHnitroV.jpg"},
              {"Vệ sinh Asus, Acer, HP ...", "300.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/VS_ASus100K.jpg"},
              {"Thay, Sửa Main Laptop", "1.900.000 - 3.000.000 vnđ", "../Uploads/_thumbs/Images/LaptopRepair/thay-main-laptop.jpg"},
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
