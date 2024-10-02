<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="QLBH.Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container">
      <div class="card bg-primary text-white" style="padding-bottom:10px; padding-top:10px; text-align:center;">
          <div class="card-body">
              <h4 runat="server" id="AdminHeaderItem">Category Management</h4>
          </div>
      </div>
      <hr /> 
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="clearTextBox();">Add New Category</button>
      <br /><br />
      <table class="table table-bordered table-hover">
         <thead>
             <tr>
                 <th>CategoryID</th>
                 <th>CategoryName</th>                   
                 <th>Action</th>
             </tr>
         </thead>
         <tbody class="tbody">
         </tbody>
      </table>
   </div>

   <!-- Modal -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                   <h4 class="modal-title" id="myModalLabel">Add Category</h4>
               </div>
               <div class="modal-body">
                   <div class="form-group">
                       <label for="CategoryID">ID</label>
                       <input type="text" class="form-control" id="CategoryID" placeholder="CategoryID" disabled="disabled" />
                   </div>
                   <div class="form-group">
                       <label for="CategoryName">CategoryName</label>
                       <input type="text" class="form-control" id="CategoryName" placeholder="CategoryName" />
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

    <script src="JS/Category.js"></script>
</asp:Content>
