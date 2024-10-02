<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Mobile.aspx.cs" Inherits="QLBH.Admin.Mobile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
     <div class="card bg-primary text-white" style="padding-bottom: 10px; padding-top: 10px; text-align: center;">
         <div class="card-body">
             <h4 runat="server" id="AdminHeaderItem">Mobile Management</h4>
         </div>
     </div>
     <hr />
     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#MobileModal" onclick="clearTextBox();">Add New Mobiles</button>
     <br />
     <br />
     <table class="table table-bordered table-hover">
         <thead>
             <tr>
                 <th>MobileID</th>
                 <th>MobileName</th>
                 <th>MobilePrice</th>
                 <th>MobileQuantity</th>
                 <th>MobileDescription</th>
                 <th>MobileImage</th>
                 <%--<th>MobileDetail</th>--%>
                 <%--<th>CategoryyID</th>--%>
                 <th>CategoryyName</th>
                 <th>Action</th>
             </tr>
         </thead>
         <tbody class="tbody">
         </tbody>
     </table>
 </div>

 <!-- Modal -->
 <div class="modal fade" id="MobileModal" tabindex="-1" role="dialog" aria-labelledby="MobileModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
                 <h4 class="modal-title" id="MobileModalLabel">Add Mobile</h4>
             </div>
             <div class="modal-body">
                 <div class="form-group">
                     <label for="MobileID">ID</label>
                     <input type="text" class="form-control" id="MobileID" placeholder="MobileID" disabled="disabled" />
                 </div>
                 <div class="form-group">
                     <label for="MobileName">MobileName</label>
                     <input type="text" class="form-control" id="MobileName" placeholder="MobileName" />
                 </div>
                 <div class="form-group">
                     <label for="MobilePrice">MobilePrice</label>
                     <input type="text" class="form-control" id="MobilePrice" placeholder="MobilePrice" />
                 </div>
                 <div class="form-group">
                     <label for="MobileQuantity">MobileQuantity</label>
                     <input type="text" class="form-control" id="MobileQuantity" placeholder="MobileQuantity" />
                 </div>
                 <div class="form-group">
                     <label for="MobileDescription">MobileDescription</label>
                     <input type="text" class="form-control" id="MobileDescription" placeholder="MobileDescription" />
                 </div>

                 <div class="form-group" style="margin-bottom: 20px;">
                     <label for="MobileImage">MobileImage</label>
                     <div class="form-inline" style="display: flex; align-items: center;">
                         <input type="text" id="MobileImage" style="flex: 1; margin-right: 10px; box-sizing: border-box;" />
                         <input type="button" class="btn btn-primary" style="width: auto; flex-shrink: 0;" value="Browse Image" onclick="BrowseServer('MobileImage');" />
                     </div>
                 </div>

                 <div class="form-group">
                     <label for="MobileDetail">MobileDetail</label>
                     <textarea class="form-control" id="MobileDetail" placeholder="MobileDetail"></textarea>
                     <script>CKEDITOR.replace('MobileDetail');</script>
                 </div>
                 <div class="form-group">
                     <label for="CategoryyID">CategoryyID</label>
                     <select class="form-control" id="CategoryyID">
                         <option value="" disabled selected>Chọn CategoryyID</option>
                         <option value="1">iPhone</option>
                         <option value="2">SamSung</option>
                         <option value="3">Oppo</option>
                         <option value="4">XiaoMi</option>
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
    <script src="JS/Mobile.js"></script>
 <script src="../ckeditor/ckeditor.js"></script>
 <script src="../ckfinder/ckfinder.js"></script>
 <script>
     $(function() {
         CKEDITOR.replace('MobileDetail', {
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
