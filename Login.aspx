<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLBH.Admin.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .modal-content {
            border-radius: 5px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
            text-align: center;
        }

        .modal-title {
            font-weight: bold;
            font-size: 20px;
            color: #333;
        }

        .modal-body {
            padding: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .user-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #007bff;
            margin-bottom: 15px;
        }

        .form-control {
            border-radius: 4px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
        }

            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, .5);
            }

        .modal-footer {
            border-top: none;
            text-align: right;
        }

        #dvMessage {
            margin-top: 10px;
        }

        .modal-dialog {
            max-width: 350px;
            margin: auto;
        }

        .btn-primary {
            background-color: black;
            border: none;
            color: white;
            padding: 5px 10px;
            transition: none;
        }

            .btn-primary:hover {
                background-color: transparent;
                border: 1px solid;
                color: black;
                transform: none;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="ModalTitle">Đăng Nhập</h4>
                </div>
                <div class="modal-body">
                    <img src="../Uploads/_thumbs/Images/hack.jpg" alt="User Avatar" class="user-avatar" />
                    <label for="txtUsername">Tài Khoản</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Nhập tài khoản" required="true" />
                    <label for="txtPassword">Mật khẩu</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Nhập mật khẩu" required="true" />
                    <div class="checkbox">
                        <asp:CheckBox ID="chkRememberMe" Text="Ghi nhớ tôi" runat="server" />
                    </div>
                    <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                        <strong>Error!</strong>
                        <asp:Label ID="lblMessage" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnLogin" Text="Đăng nhập" runat="server" OnClick="ValidateUser" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
