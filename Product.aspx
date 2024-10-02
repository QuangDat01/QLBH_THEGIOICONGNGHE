<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="QLBH.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card bg-primary text-white" style="padding-bottom: 10px; padding-top: 10px; text-align: center;">
            <div class="card-body">
                <h4 runat="server" id="AdminHeaderItem">Product Management</h4>
            </div>
        </div>
        <hr />
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#productModal" onclick="clearTextBox();">Add New Product</button>
        <br />
        <br />
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ProductID</th>
                    <th>ProductName</th>
                    <th>ProductPrice</th>
                    <th>ProductQuantity</th>
                    <th>ProductDescription</th>
                    <th>ProductImage</th>
                    <%--<th>Detail</th>--%>
                    <%--<th>CategoryID</th>--%>
                    <th>CategoryName</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody class="tbody">
            </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="productModalLabel">Add Product</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="ProductID">ID</label>
                        <input type="text" class="form-control" id="ProductID" placeholder="ProductID" disabled="disabled" />
                    </div>
                    <div class="form-group">
                        <label for="ProductName">ProductName</label>
                        <input type="text" class="form-control" id="ProductName" placeholder="ProductName" />
                    </div>
                    <div class="form-group">
                        <label for="ProductPrice">ProductPrice</label>
                        <input type="text" class="form-control" id="ProductPrice" placeholder="ProductPrice" />
                    </div>
                    <div class="form-group">
                        <label for="ProductQuantity">ProductQuantity</label>
                        <input type="text" class="form-control" id="ProductQuantity" placeholder="ProductQuantity" />
                    </div>
                    <div class="form-group">
                        <label for="ProductDescription">ProductDescription</label>
                        <input type="text" class="form-control" id="ProductDescription" placeholder="ProductDescription" />
                    </div>

                    <div class="form-group" style="margin-bottom: 20px;">
                        <label for="ProductImage">Product Image</label>
                        <div class="form-inline" style="display: flex; align-items: center;">
                            <input type="text" id="ProductImage" style="flex: 1; margin-right: 10px; box-sizing: border-box;" />
                            <input type="button" class="btn btn-primary" style="width: auto; flex-shrink: 0;" value="Browse Image" onclick="BrowseServer('ProductImage');" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="Detail">Detail</label>
                        <textarea class="form-control" id="Detail" placeholder="Detail"></textarea>
                        <script>CKEDITOR.replace('Detail');</script>
                    </div>

                    <div class="form-group">
                        <label for="CategoryID">CategoryID</label>
                        <select class="form-control" id="CategoryID">
                            <option value="" disabled selected>Chọn CategoryID</option>
                            <option value="1">Acer</option>
                            <option value="2">Asus</option>
                            <option value="3">Dell</option>
                            <option value="4">Lenovo</option>
                            <option value="5">HP</option>
                            <option value="6">MSI</option>
                            <option value="7">MAC</option>
                        </select>
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
    <script src="JS/Product.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <script src="../ckfinder/ckfinder.js"></script>
    <script>
        $(function () {
            CKEDITOR.replace('Detail', {
                customConfig: '../ckeditor/config.js',
                extraAllowedContent: 'span',
            });
        });
        function BrowseServer(inputTextID) {
            var finder = new CKFinder();
            finder.selectActionFunction = function (fileUr) {
                document.getElementById(inputTextID).value = fileUr;
            };
            finder.popup();
        }
    </script>


</asp:Content>
