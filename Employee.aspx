<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="QLBH.Admin.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="card bg-primary text-white" style="padding-bottom:10px; padding-top:10px; text-align:center;">
            <div class="card-body">
                             <h4 runat="server" id="AdminHeaderItem">Employee Management</h4>
            </div>
        </div>
        <hr />
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#employeeModal" onclick="clearTextBox();">Add New Employee</button>
        <br /><br />
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>EmployeeID</th>
                    <th>EmployeeName</th>
                    <th>EmployeeAddress</th>
                    <th>EmployeeCountry</th>
                    <th>EmployeeBirthday</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="tbody">
            </tbody>
        </table>
    </div>

    <!-- Employee Modal -->
    <div class="modal fade" id="employeeModal" tabindex="-1" role="dialog" aria-labelledby="employeeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="employeeModalLabel">Add Employee</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="EmployeeID">ID</label>
                        <input type="text" class="form-control" id="EmployeeID" placeholder="EmployeeID" disabled="disabled" />
                    </div>
                    <div class="form-group">
                        <label for="EmployeeName">EmployeeName</label>
                        <input type="text" class="form-control" id="EmployeeName" placeholder="EmployeeName" />
                    </div>
                    <div class="form-group">
                        <label for="EmployeeAddress">Address</label>
                        <input type="text" class="form-control" id="EmployeeAddress" placeholder="EmployeeAddress" />
                    </div>
                    <div class="form-group">
                        <label for="EmployeeCountry">Country</label>
                        <input type="text" class="form-control" id="EmployeeCountry" placeholder="EmployeeCountry" />
                    </div>
                    <div class="form-group">
                        <label for="EmployeeBirthday">Birthday</label>
                        <input type="date" class="form-control" id="EmployeeBirthday" placeholder="EmployeeBirthday" />
                    </div>
                </div>
               <div class="modal-footer">
               <button type="button" class="btn btn-primary" id="btnAdd" onclick="Add();">Add</button>
               <button type="button" class="btn btn-primary" id="btnUpdate" style="display:none;" onclick="Update();">Update</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
             </div>
        </div>
    </div>
    <script src="JS/Employee.js"></script>
</asp:Content>
