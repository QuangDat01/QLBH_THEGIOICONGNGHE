$(function () {
    loadData();
});

function loadData() {
    $.ajax({
        type: "POST",
        url: "Category.aspx/GetAll",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: '{}',
        success: function (response) {
            var html = '';
            $.each(response.d, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.CategoryID + '</td>';
                html += '<td>' + item.CategoryName + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.CategoryID + ')">Edit</a> | <a href="#" onclick="return Delete(' + item.CategoryID + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
//function loadData1() {
//    $.ajax({
//        type: "POST",
//        url: "Category.aspx/GetAll",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        data: '{}',
//        success: function (response) {
//            var html = '';
//            var xmlDoc = $.parseXML(response.d);
//            var xml = $(xmlDoc);
//            var category = xml.find("Table");
//            $.each(category, function () {
//                var id = $(this).find('CategoryID').text();
//                var categoryName = $(this).find('CategoryName').text();
//                html += '<tr>';
//                html += '<td>' + id + '</td>';
//                html += '<td>' + categoryName + '</td>';
//                html += '<td><a href="#" onclick="return getbyID(' + id + ')">Edit</a> | <a href="#" onclick="return Delete(' + id + ')">Delete</a></td>';
//                html += '</tr>';
//            });
//            $('.tbody').html(html);
//        },
//        error: function (errormessage) {
//            alert("Error: " + errormessage.responseText);
//        }
//    });
//}
// Add Data Function
function Add() {
    var cat = {
        CategoryName: $('#CategoryName').val()
    };
    $.ajax({
        url: "Category.aspx/Add",
        data: JSON.stringify(cat),
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
// function for clearing the textboxes
function clearTextBox() {
    $('#CategoryID').val("");
    $('#CategoryName').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#CategoryName').css('border-color', 'lightgrey');
}
// Function for getting the Data Based upon Category ID
//function getbyID1(ID) {
//    $('#CategoryName').css('border-color', 'lightgrey');
//    $.ajax({
//        type: "POST",
//        url: "Category.aspx/GetbyID",
//        data: '{ ID: ' + ID + '}',
//        contentType: "application/json;charset=utf-8",
//        dataType: "json",
//        success: function (response) {
//            var xmlDoc = $.parseXML(response.d);
//            var xml = $(xmlDoc);
//            var category = xml.find("Table");
//            var id = $(category).find('CategoryID').text();
//            var categoryName = $(category).find('CategoryName').text();

//            $('#CategoryID').val(id);
//            $('#CategoryName').val(categoryName);
//            $('#myModal').modal('show');
//            $('#btnUpdate').show();
//            $('#btnAdd').hide();
//        },
//        error: function (errormessage) {
//            alert(errormessage.responseText);
//        }
//    });
//    return false;
//}
function getbyID(ID) {
    $('CategoryName').css('border-color', 'lightgrey');
    $.ajax({
        url: "Category.aspx/GetbyID",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        data: '{ ID: ' + ID + '}',
        success: function (result) {
            $('#CategoryID').val(result.d.CategoryID);
            $('#CategoryName').val(result.d.CategoryName);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}
// Funtion Validate
function validate() {
    var isValid = true;
    var categoryName = $('#CategoryName').val();

    if (categoryName.trim() == '') {
        $('#CategoryName').css('border-color', 'red');
        isValid = false;
    } else {
        $('#CategoryName').css('border-color', 'lightgrey');
    }

    return isValid;
}
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var cat = {
        CategoryID: $('#CategoryID').val(),
        CategoryName: $('#CategoryName').val()
    };
    $.ajax({
        type: "POST",
        url: "Category.aspx/UpdateCategory",
        data: JSON.stringify(cat),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#CategoryID').val("");
            $('#CategoryName').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Funtion Delete
function Delete(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            type: "POST",
            url: "Category.aspx/Delete",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: '{ID: ' + ID + '}',
            success: function (result) {
                loadData();
            },
            error: function (erromessage) {
                alert(erromessage.responseText);
            }
        });
    }
}