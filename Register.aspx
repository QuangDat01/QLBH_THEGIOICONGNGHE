<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QLBH.Admin.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card bg-primary text-white" style="padding-bottom: 10px; padding-top: 10px; text-align: center;">
            <div class="card-body">
                <h4 runat="server" id="AdminHeaderItem">User Management</h4>
            </div>
        </div>
        <hr />
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#UserModal" onclick="clearTextBox();">Add New User</button>
        <br />
        <br />

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>UserID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="tbody">
                <!-- Dữ liệu sẽ được nạp bằng JavaScript từ backend -->
            </tbody>
        </table>
    </div>

    <!-- Modal for Adding/Editing User -->
    <div class="modal fade" id="UserModal" tabindex="-1" role="dialog" aria-labelledby="UserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="UserModalLabel">Add User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="UserID">ID</label>
                        <input type="text" class="form-control" id="UserID" placeholder="UserID" disabled="disabled" />
                    </div>
                    <div class="form-group">
                        <label for="UserName">Username</label>
                        <input type="text" class="form-control" id="UserName" placeholder="Username" />
                    </div>
                    <div class="form-group">
                        <label for="Password">Password</label>
                        <input type="password" class="form-control password-input" id="Password" placeholder="Password" />
                    </div>


                    <div class="form-group">
                        <label for="Email">Email</label>
                        <input type="email" class="form-control" id="Email" placeholder="Email" onblur="validateEmail()" />
                        <span class="text-danger" id="Emailerr" style="display: none;"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnAdd" onclick="Add();">Add</button>
                    <button type="button" class="btn btn-primary" id="btnUpdate" style="display: none;" onclick="Update();">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
   
    <script src="JS/User.js"></script>
</asp:Content>
