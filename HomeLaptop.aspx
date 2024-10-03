<%@ Page Title="Laptop" Language="C#" MasterPageFile="~/FontEnd/HomePageMaster.Master" AutoEventWireup="true" CodeBehind="HomeLaptop.aspx.cs" Inherits="QLBH.FontEnd.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <!-- Container hiển thị sản phẩm -->
    <div id="product-container" class="product-container"></div>


        <!-- Sản phẩm sẽ được thêm vào đây bằng JavaScript -->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="JS/ProductLoader.js"></script>

</asp:Content>
