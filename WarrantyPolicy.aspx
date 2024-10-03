<%@ Page Title="Chính Sách Bảo Hành Sản Phẩm" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="WarrantyPolicy.aspx.cs" Inherits="QLBH.FontEnd.WarrantyPolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .warranty-container {
            margin: 0 auto;
            padding: 30px;
            max-width: 1000px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .warranty-title {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }
        .warranty-section {
            font-size: 18px;
            line-height: 1.8;
            color: #34495e;
            margin-bottom: 25px;
        }
        .warranty-section h2 {
            font-size: 24px;
            color: #16a085;
            margin-bottom: 10px;
        }
        .warranty-section p {
            margin-bottom: 15px;
        }
        .warranty-section ul {
            margin-left: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="warranty-container">
        <h1 class="warranty-title">Chính Sách Bảo Hành Sản Phẩm</h1>

        <div class="warranty-section">
            <h2>Giới Thiệu</h2>
            <p>
                Tại **Thế Giới Công Nghệ**, chúng tôi cam kết mang đến cho khách hàng những sản phẩm công nghệ chất lượng cao và chính sách bảo hành rõ ràng, minh bạch. Chính sách bảo hành của chúng tôi nhằm đảm bảo quyền lợi của khách hàng và duy trì lòng tin với thương hiệu.
            </p>
        </div>

        <div class="warranty-section">
            <h2>Thời Gian Bảo Hành</h2>
            <p>
                Mỗi sản phẩm được bán ra đều được bảo hành trong thời gian cụ thể, thông thường là:
            </p>
            <ul>
                <li>Điện thoại: 6 tháng</li>
                <li>Máy tính bảng: 12 tháng</li>
                <li>Laptop: 12 tháng</li>
                <li>Phụ kiện: 6 tháng</li>
            </ul>
        </div>

        <div class="warranty-section">
            <h2>Điều Kiện Bảo Hành</h2>
            <p>
                Sản phẩm sẽ được bảo hành khi đáp ứng các điều kiện sau:
            </p>
            <ul>
                <li>Vẫn trong thời gian bảo hành ghi trên hóa đơn.</li>
                <li>Sản phẩm còn nguyên tem, nhãn mác và không có dấu hiệu bị can thiệp hoặc sửa chữa từ bên ngoài.</li>
                <li>Không có dấu hiệu hư hỏng do lỗi của người sử dụng như rơi vỡ, ngâm nước.</li>
            </ul>
        </div>

        <div class="warranty-section">
            <h2>Cách Thức Yêu Cầu Bảo Hành</h2>
            <p>
                Để yêu cầu bảo hành, khách hàng cần thực hiện theo các bước sau:
            </p>
            <ul>
                <li>Đem sản phẩm cùng hóa đơn mua hàng đến cửa hàng của **Thế Giới Công Nghệ**.</li>
                <li>Điền vào mẫu yêu cầu bảo hành được cung cấp tại cửa hàng.</li>
                <li>Nhân viên sẽ kiểm tra sản phẩm và thông báo tình trạng bảo hành cho khách hàng.</li>
            </ul>
        </div>

        <div class="warranty-section">
            <h2>Liên Hệ Hỗ Trợ</h2>
            <p>
                Nếu có bất kỳ thắc mắc nào về chính sách bảo hành, quý khách hàng vui lòng liên hệ với chúng tôi qua:
            </p>
            <ul>
                <li>Email: support@thegioicongnghe.vn</li>
                <li>Hotline: 1900 - 8888</li>
                <li>Địa chỉ: 22/103 Đường Lý Sơn, Ngọc Thụy, Long Biên, TP.Hà Nội</li>
            </ul>
        </div>

        <div class="warranty-section">
            <p>
                Chúng tôi luôn sẵn sàng hỗ trợ và tư vấn để quý khách có những trải nghiệm tốt nhất khi sử dụng sản phẩm của **Thế Giới Công Nghệ**. Cảm ơn bạn đã tin tưởng và chọn lựa chúng tôi!
            </p>
        </div>
    </div>
</asp:Content>
