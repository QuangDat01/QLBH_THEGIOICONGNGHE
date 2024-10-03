<%@ Page Title="Hỗ Trợ Kỹ Thuật" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="TechnicalSupport.aspx.cs" Inherits="QLBH.FontEnd.TechnicalSupport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .support-container {
            margin: 0 auto;
            padding: 30px;
            max-width: 1000px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .support-title {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }
        .support-section {
            font-size: 18px;
            line-height: 1.8;
            color: #34495e;
            margin-bottom: 25px;
        }
        .support-section h2 {
            font-size: 24px;
            color: #16a085;
            margin-bottom: 10px;
        }
        .support-section p {
            margin-bottom: 15px;
        }
        .support-section ul {
            margin-left: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="support-container">
        <h1 class="support-title">Hỗ Trợ Kỹ Thuật</h1>

        <div class="support-section">
            <h2>Giới Thiệu</h2>
            <p>
                Tại **Thế Giới Công Nghệ**, chúng tôi cung cấp dịch vụ hỗ trợ kỹ thuật chuyên nghiệp để giúp khách hàng giải quyết các vấn đề liên quan đến sản phẩm công nghệ của mình. Đội ngũ kỹ thuật viên của chúng tôi luôn sẵn sàng hỗ trợ bạn trong suốt quá trình sử dụng sản phẩm.
            </p>
        </div>

        <div class="support-section">
            <h2>Phương Thức Hỗ Trợ</h2>
            <p>
                Chúng tôi cung cấp nhiều phương thức hỗ trợ khác nhau để đáp ứng nhu cầu của khách hàng:
            </p>
            <ul>
                <li>Hỗ trợ qua điện thoại: Gọi đến hotline hỗ trợ của chúng tôi để được tư vấn trực tiếp.</li>
                <li>Hỗ trợ qua email: Gửi yêu cầu hỗ trợ qua email và chúng tôi sẽ phản hồi sớm nhất có thể.</li>
                <li>Hỗ trợ trực tiếp tại cửa hàng: Đến cửa hàng của chúng tôi để nhận sự hỗ trợ kỹ thuật trực tiếp.</li>
            </ul>
        </div>

        <div class="support-section">
            <h2>Thông Tin Liên Hệ</h2>
            <p>
                Để nhận được hỗ trợ nhanh chóng, quý khách hàng vui lòng liên hệ với chúng tôi qua các thông tin sau:
            </p>
            <ul>
                <li>Email: support@thegioicongnghe.vn</li>
                <li>Hotline: 1900 - 8888</li>
                <li>Địa chỉ: 22/103 Đường Lý Sơn, Ngọc Thụy, Long Biên, TP.Hà Nội</li>
            </ul>
        </div>

        <div class="support-section">
            <h2>Câu Hỏi Thường Gặp</h2>
            <p>
                Dưới đây là một số câu hỏi thường gặp mà chúng tôi nhận được từ khách hàng:
            </p>
            <ul>
                <li><strong>Q:</strong> Tôi làm mất hóa đơn, liệu tôi có thể yêu cầu bảo hành không?</li>
                <li><strong>A:</strong> Hóa đơn là yêu cầu cần thiết để yêu cầu bảo hành. Tuy nhiên, bạn có thể cung cấp thông tin khác để chúng tôi xác thực.</li>
                <li><strong>Q:</strong> Sản phẩm của tôi bị lỗi, tôi phải làm gì?</li>
                <li><strong>A:</strong> Vui lòng liên hệ với chúng tôi qua hotline hoặc email để nhận được hướng dẫn cụ thể.</li>
            </ul>
        </div>

        <div class="support-section">
            <p>
                Chúng tôi luôn sẵn sàng hỗ trợ bạn và mong muốn mang đến cho bạn trải nghiệm tốt nhất khi sử dụng sản phẩm của **Thế Giới Công Nghệ**!
            </p>
        </div>
    </div>
</asp:Content>
