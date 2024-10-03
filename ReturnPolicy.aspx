<%@ Page Title="Chính Sách Đổi Trả Sản Phẩm" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="ReturnPolicy.aspx.cs" Inherits="QLBH.FontEnd.ReturnPolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .return-container {
            margin: 0 auto;
            padding: 30px;
            max-width: 1000px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .return-title {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }
        .return-section {
            font-size: 18px;
            line-height: 1.8;
            color: #34495e;
            margin-bottom: 25px;
        }
        .return-section h2 {
            font-size: 24px;
            color: #16a085;
            margin-bottom: 10px;
        }
        .return-section p {
            margin-bottom: 15px;
        }
        .return-section ul {
            margin-left: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="return-container">
        <h1 class="return-title">Chính Sách Đổi Trả Sản Phẩm</h1>

        <div class="return-section">
            <h2>Giới Thiệu</h2>
            <p>
                Tại **Thế Giới Công Nghệ**, chúng tôi cam kết cung cấp cho khách hàng những sản phẩm công nghệ chất lượng. Nếu bạn không hài lòng với sản phẩm đã mua, chúng tôi có chính sách đổi trả rõ ràng để đảm bảo quyền lợi của bạn.
            </p>
        </div>

        <div class="return-section">
            <h2>Thời Gian Đổi Trả</h2>
            <p>
                Khách hàng có quyền đổi trả sản phẩm trong vòng 30 ngày kể từ ngày mua hàng. Sản phẩm phải còn nguyên tem, nhãn mác và không có dấu hiệu đã sử dụng.
            </p>
        </div>

        <div class="return-section">
            <h2>Điều Kiện Đổi Trả</h2>
            <p>
                Sản phẩm sẽ được chấp nhận đổi trả khi đáp ứng các điều kiện sau:
            </p>
            <ul>
                <li>Sản phẩm còn nguyên vẹn, chưa sử dụng.</li>
                <li>Có hóa đơn mua hàng và chứng minh nguồn gốc sản phẩm.</li>
                <li>Không thuộc danh sách các sản phẩm không được đổi trả.</li>
            </ul>
        </div>

        <div class="return-section">
            <h2>Cách Thức Đổi Trả</h2>
            <p>
                Để thực hiện đổi trả, khách hàng cần thực hiện theo các bước sau:
            </p>
            <ul>
                <li>Đem sản phẩm đến cửa hàng **Thế Giới Công Nghệ** cùng với hóa đơn mua hàng.</li>
                <li>Điền vào mẫu đơn yêu cầu đổi trả sản phẩm.</li>
                <li>Nhân viên sẽ kiểm tra và xác nhận tình trạng sản phẩm trước khi tiến hành đổi trả.</li>
            </ul>
        </div>

        <div class="return-section">
            <h2>Liên Hệ Hỗ Trợ</h2>
            <p>
                Nếu có bất kỳ thắc mắc nào về chính sách đổi trả, quý khách hàng vui lòng liên hệ với chúng tôi qua:
            </p>
            <ul>
                <li>Email: support@thegioicongnghe.vn</li>
                <li>Hotline: 1900 - 8888</li>
                <li>Địa chỉ: 22/103 Đường Lý Sơn, Ngọc Thụy, Long Biên, TP.Hà Nội</li>
            </ul>
        </div>

        <div class="return-section">
            <p>
                Chúng tôi luôn sẵn sàng hỗ trợ bạn và mong muốn mang đến cho bạn trải nghiệm tốt nhất khi sử dụng sản phẩm của **Thế Giới Công Nghệ**!
            </p>
        </div>
    </div>
</asp:Content>
