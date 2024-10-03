<%@ Page Title="Trang Chủ" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="QLBH.FontEnd.HomePage1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Mobile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Banner và hình ảnh tĩnh của bạn -->
<div class="big-banner">
    <a aria-label="slide" data-cate="0" data-place="7828" href="https://www.apple.com/iphone-16/" onclick="jQuery.ajax({ url: '/bannertracking?bid=94305&amp;r=' + (new Date).getTime(), async: true, cache: false });">
        <img width="1555" height="260" src="//cdnv2.tgdd.vn/mwg-static/tgdd/Banner/0e/60/0e60f6334f7e5260e55f84305ef97923.jpg" alt="iPhone 16">
    </a>
</div>

<div class="image-container">
    <img src="../Uploads/_thumbs/Images/800%20x%20300/Tựu%20trường.jpg" class="image" />
    <img src="../Uploads/_thumbs/Images/800%20x%20300/Nhả%20vía.jpg" class="image" />
    <img src="../Uploads/_thumbs/Images/800%20x%20300/Tốt%20nghiệp.jpg" class="image" />
</div>

    <%--<%-- Mobile --%>
    <div id="mobile-container" class="mobile-container"></div>

    <%-- Laptop --%>
    <div id="product-container" class="product-container"></div>

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script src="JS/MobileLoader.js"></script>
    <script src="JS/ProductLoader.js"></script>
</asp:Content>
