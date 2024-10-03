$(function () {
    loadData();
    loadCategories(); // Ensure categories are loaded when the page loads
});

// Hàm formatPrice để định dạng giá tiền
function formatPrice(price) {
    if (isNaN(price) || price === null || price === undefined) {
        return '0 VNĐ'; // Trả về giá mặc định nếu giá không hợp lệ
    }
    var intPrice = parseInt(price, 10);
    return intPrice.toLocaleString('vi-VN') + ' VNĐ';
}

// Function loadData()
function loadData() {
    $.ajax({
        type: "POST",
        url: "Mobile.aspx/GetAllMobileWithCatMobile",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: '{}',
        success: function (response) {
            console.log(response.d); // Kiểm tra dữ liệu trả về
            var html = '';
            $.each(response.d, function (key, item) {
                var formattedPrice = formatPrice(item.MobilePrice);
                html += '<tr>';
                html += '<td>' + item.MobileID + '</td>';
                html += '<td>' + item.MobileName + '</td>';
                html += '<td>' + formattedPrice + '</td>';
                html += '<td>' + item.MobileQuantity + '</td>';
                html += '<td>' + item.MobileDescription + '</td>';
                html += '<td style="text-align: center;"><img src="' + item.MobileImage + '" alt="Mobile Image" width="135" height="100" style="display: block; margin: auto;" /></td>';
                html += '<td style="text-align: center;">' + item.CategoryyName + '</td>';
                //html += '<td>' + item.Detail + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.MobileID + ')">Edit</a> | <a href="#" onclick="return Delete(' + item.MobileID + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Function Add
function Add() {
    var mob = {
        MobileName: $('#MobileName').val(),
        MobilePrice: $('#MobilePrice').val(),
        MobileQuantity: $('#MobileQuantity').val(),
        MobileDescription: $('#MobileDescription').val(),
        MobileImage: $('#MobileImage').val(),
        MobileDetail: CKEDITOR.instances['MobileDetail'].getData(), // Lấy dữ liệu từ CKEditor
        CategoryyID: $('#CategoryyID').val()
    };
    $.ajax({
        url: "Mobile.aspx/Add",
        data: JSON.stringify(mob),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function () {
            
                loadData(); // Gọi lại loadData để cập nhật dữ liệu mới
                $('#MobileModal').modal('hide');
            },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
// Function clearTextBox
function clearTextBox() {
    $('#MobileID').val('');
    $('#MobileName').val('');
    $('#MobilePrice').val('');
    $('#MobileQuantity').val('');
    $('#MobileDescription').val('');
    $('#MobileImage').val('');
    CKEDITOR.instances['MobileDetail'].setData('');
    $('#CategoryyID').val('');
}
// Function getbyID
function getbyID(ID) {
    $.ajax({
        url: "Mobile.aspx/GetbyID",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ ID: ID }),
        success: function (result) {
            if (result.d) {
                console.log("Mobile:", result.d.MobileDetail); // kiểm tra giá trị của MobileDetail trên console
                $('#MobileID').val(result.d.MobileID);
                $('#MobileName').val(result.d.MobileName);
                $('#MobilePrice').val(result.d.MobilePrice);
                $('#MobileQuantity').val(result.d.MobileQuantity);
                $('#MobileDescription').val(result.d.MobileDescription);
                $('#MobileImage').val(result.d.MobileImage);
                $('#MobileImagePreview').attr('src', result.d.MobileImage ? result.d.MobileImage : '');

                // Cập nhật dữ liệu MobileDetail trong CKEditor
                CKEDITOR.instances['MobileDetail'].setData(result.d.MobileDetail);

                $('#CategoryyID').val(result.d.CategoryyID);
                $('#MobileModal').modal('show');
                $('#btnUpdate').show();
                $('#btnAdd').hide();
            } else {
                alert('No data found for the provided ID.');
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });

    return false;
}

// Function validate
function validate() {
    var isValid = true;
    var mobileName = $('#MobileName').val().trim();
    var mobilePrice = $('#MobilePrice').val().trim();
    var mobileQuantity = $('#MobileQuantity').val().trim();
    var mobileDescription = $('#MobileDescription').val().trim();
	var mobileDetail = CKEDITOR.instances['MobileDetail'].getData().trim(); // Retrieve Detail from CKEditor
    var categoryyID = $('#CategoryyID').val().trim();

    if (mobileName == '') {
        $('#MobileName').css('border-color', 'red');
        isValid = false;
    } else {
        $('#MobileName').css('border-color', 'lightgrey');
    }

    if (mobilePrice == '' || isNaN(mobilePrice) || parseFloat(mobilePrice) <= 0) {
        $('#MobilePrice').css('border-color', 'red');
        isValid = false;
    } else {
        $('#MobilePrice').css('border-color', 'lightgrey');
    }

    if (mobileQuantity == '' || isNaN(mobileQuantity) || parseInt(mobileQuantity) < 0) {
        $('#MobileQuantity').css('border-color', 'red');
        isValid = false;
    } else {
        $('#MobileQuantity').css('border-color', 'lightgrey');
    }

    if (mobileDescription == '') {
        $('#MobileDescription').css('border-color', 'red');
        isValid = false;
    } else {
        $('#MobileDescription').css('border-color', 'lightgrey');
    }
    if (categoryyID == '' || isNaN(categoryyID) || parseInt(categoryyID) <= 0) {
        $('#CategoryyID').css('border-color', 'red');
        isValid = false;
    } else {
        $('#CategoryyID').css('border-color', 'lightgrey');
    }

    if (mobileDetail === '') {
        alert("Detail cannot be empty.");
        isValid = false;
    }
    return isValid;
}
// Function Update
function Update() {  
    var mobile = {
        MobileID: $('#MobileID').val(),
        MobileName: $('#MobileName').val(),
        MobilePrice: $('#MobilePrice').val(),
        MobileQuantity: $('#MobileQuantity').val(),
        MobileDescription: $('#MobileDescription').val(),
        MobileImage: $('#MobileImage').val(),
        MobileDetail: CKEDITOR.instances['MobileDetail'].getData(),
        CategoryyID: $('#CategoryyID').val()
    };

    $.ajax({
        type: "POST",
        url: "Mobile.aspx/Update",
        data: JSON.stringify(mobile),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#MobileModal').modal('hide');            
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Function Delete
function Delete(ID) {
    var ans = confirm("Bạn có chắc chắn muốn xóa bản ghi này không?");
    if (ans) {
        $.ajax({
            type: "POST",
            url: "Mobile.aspx/Delete",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: JSON.stringify({ ID: ID }),
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert("Error: " + errormessage.responseText);
            }
        });
    }
}

// Function loadCategories
function loadCategories() {
    $.ajax({
        type: "POST",
        url: "Mobile.aspx/GetAllCat_Mobile",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var html = '<option value="" disabled selected>Chọn CategoryyID</option>';
            $.each(response.d, function (key, item) {
                html += '<option value="' + item.CategoryyID + '">' + item.CategoryyName + '</option>';
            });
            $('#CategoryyID').html(html);
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
