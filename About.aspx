<%@ Page Title="Giới Thiệu" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="QLBH.FontEnd.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Định dạng CSS cho trang giới thiệu */
        .about-container {
            margin: 0 auto;
            padding: 30px;
            max-width: 1000px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .about-title {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }
        .about-section {
            font-size: 18px;
            line-height: 1.8;
            color: #34495e;
            margin-bottom: 25px;
        }
        .about-section h2 {
            font-size: 24px;
            color: #16a085;
            margin-bottom: 10px;
        }
        .about-section p {
            margin-bottom: 15px;
        }
        .about-highlight {
            color: #e74c3c;
            font-weight: bold;
        }
        .about-values {
            font-size: 20px;
            color: #2980b9;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .about-mission {
            font-size: 22px;
            color: #8e44ad;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-container">
        <!-- Tiêu đề -->
        <h1 class="about-title">Giới Thiệu Về Thế Giới Công Nghệ</h1>

        <!-- Phần giới thiệu ngắn -->
        <div class="about-section">
            <p>
                **Thế Giới Công Nghệ** tự hào là một trong những công ty dẫn đầu trong lĩnh vực cung cấp các sản phẩm công nghệ tiên tiến tại Việt Nam. Được thành lập với sứ mệnh đem lại những giải pháp công nghệ toàn diện cho người tiêu dùng, chúng tôi luôn cam kết mang đến những sản phẩm chất lượng và dịch vụ hoàn hảo nhất.
            </p>
            <p>
                Với sự dẫn dắt của CEO **Trần Quang Đạt**, **Thế Giới Công Nghệ** không ngừng đổi mới và phát triển để trở thành đối tác tin cậy của khách hàng trong thời đại công nghệ số.
            </p>
        </div>

        <!-- Giá trị cốt lõi -->
        <div class="about-section">
            <h2>Giá Trị Cốt Lõi</h2>
            <p>
                Thành công của **Thế Giới Công Nghệ** được xây dựng trên nền tảng của ba giá trị cốt lõi:
            </p>
            <ul>
                <li><strong>Tin cậy:</strong> Chúng tôi luôn cam kết cung cấp sản phẩm chính hãng và đảm bảo chất lượng.</li>
                <li><strong>Đổi mới:</strong> Không ngừng sáng tạo và cải tiến để mang đến những giải pháp công nghệ mới nhất.</li>
                <li><strong>Khách hàng là trung tâm:</strong> Mọi hoạt động của chúng tôi đều hướng đến việc mang lại trải nghiệm tốt nhất cho khách hàng.</li>
            </ul>
        </div>

        <!-- Sứ mệnh và Tầm nhìn -->
        <div class="about-section">
            <h2>Sứ Mệnh và Tầm Nhìn</h2>
            <p>
                Sứ mệnh của **Thế Giới Công Nghệ** là mang đến các sản phẩm và giải pháp công nghệ tiên tiến, giúp nâng cao chất lượng cuộc sống của người tiêu dùng. Chúng tôi hiểu rằng công nghệ không chỉ là công cụ hỗ trợ mà còn là người bạn đồng hành giúp mọi người kết nối, làm việc và tận hưởng cuộc sống.
            </p>
            <p>
                Tầm nhìn của chúng tôi là trở thành một trong những công ty hàng đầu trong lĩnh vực công nghệ tại khu vực, với mục tiêu không chỉ cung cấp sản phẩm mà còn đem lại những trải nghiệm vượt trội cho khách hàng.
            </p>
        </div>

        <!-- Đội ngũ nhân viên -->
        <div class="about-section">
            <h2>Đội Ngũ Nhân Viên</h2>
            <p>
                Yếu tố con người là cốt lõi của sự phát triển tại **Thế Giới Công Nghệ**. Chúng tôi tự hào sở hữu một đội ngũ chuyên viên tư vấn và kỹ thuật có trình độ chuyên môn cao, luôn sẵn sàng đáp ứng mọi nhu cầu của khách hàng. Mỗi thành viên trong đội ngũ đều được đào tạo chuyên sâu và có sự đam mê với công nghệ, giúp mang lại giá trị tối ưu cho khách hàng.
            </p>
        </div>

        <!-- Danh mục sản phẩm -->
        <div class="about-section">
            <h2>Danh Mục Sản Phẩm</h2>
            <p>
                **Thế Giới Công Nghệ** cung cấp đa dạng các sản phẩm công nghệ cao cấp từ những thương hiệu hàng đầu thế giới như Apple, Samsung, Dell, Sony, và nhiều thương hiệu khác. Các dòng sản phẩm chính bao gồm:
            </p>
            <ul>
                <li>Điện thoại thông minh</li>
                <li>Laptop và máy tính bảng</li>
                <li>Thiết bị đeo thông minh</li>
                <li>Phụ kiện công nghệ</li>
            </ul>
            <p>
                Chúng tôi không chỉ đơn thuần cung cấp sản phẩm, mà còn đảm bảo rằng mỗi sản phẩm được kiểm tra kỹ lưỡng trước khi đến tay khách hàng, nhằm đảm bảo chất lượng và hiệu suất tốt nhất.
            </p>
        </div>

        <!-- Dịch vụ khách hàng -->
        <div class="about-section">
            <h2>Dịch Vụ Khách Hàng</h2>
            <p>
                Dịch vụ khách hàng của **Thế Giới Công Nghệ** luôn được đánh giá cao nhờ sự tận tâm và chuyên nghiệp. Chúng tôi cung cấp chính sách hậu mãi, bảo hành, và đổi trả linh hoạt, giúp khách hàng hoàn toàn yên tâm khi mua sắm tại cửa hàng. 
            </p>
            <p>
                Đội ngũ chăm sóc khách hàng của chúng tôi luôn sẵn sàng lắng nghe và giải đáp mọi thắc mắc, đảm bảo mang lại trải nghiệm mua sắm tuyệt vời nhất.
            </p>
        </div>

        <!-- Tầm nhìn tương lai -->
        <div class="about-section">
            <h2>Tầm Nhìn Tương Lai</h2>
            <p>
                **Thế Giới Công Nghệ** không ngừng mở rộng và phát triển để đáp ứng nhu cầu ngày càng cao của thị trường công nghệ. Trong tương lai, chúng tôi đặt mục tiêu mở rộng hệ thống cửa hàng trên toàn quốc và xây dựng một nền tảng thương mại điện tử mạnh mẽ, giúp khách hàng dễ dàng tiếp cận với các sản phẩm và dịch vụ chất lượng từ xa.
            </p>
        </div>

        <!-- CEO -->
        <div class="about-section">
            <h2>Ông Trần Quang Đạt - CEO Thế Giới Công Nghệ</h2>
            <p>
                Với tầm nhìn chiến lược và đam mê công nghệ, **Ông Trần Quang Đạt** đã xây dựng nên **Thế Giới Công Nghệ** từ một doanh nghiệp nhỏ trở thành một trong những thương hiệu lớn trong ngành công nghệ tại Việt Nam. Ông luôn tin rằng thành công không chỉ đến từ sản phẩm chất lượng, mà còn từ sự tận tâm và cam kết mang lại giá trị thực sự cho khách hàng.
            </p>
        </div>

        <!-- Lời kết -->
        <div class="about-section">
            <p>
                **Thế Giới Công Nghệ** luôn sẵn sàng đồng hành cùng bạn trên hành trình khám phá công nghệ hiện đại. Hãy đến với chúng tôi để trải nghiệm những sản phẩm và dịch vụ tuyệt vời nhất.
            </p>
        </div>
    </div>
</asp:Content>
