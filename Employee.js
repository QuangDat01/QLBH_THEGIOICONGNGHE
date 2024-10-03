$(function () {
    loadData();
});

function loadData() {
    $.ajax({
        type: "POST",
        url: "Employee.aspx/GetAllEmployees",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: '{}',
        success: function (response) {
            console.log(response);

            var html = '';
            var employees = response.d;

            $.each(employees, function (key, item) {
                // Use the formatDate function to format the birthday
                var formattedBirthday = formatDate(item.EmployeeBirthday);

                html += '<tr>';
                html += '<td>' + item.EmployeeID + '</td>';
                html += '<td>' + item.EmployeeName + '</td>';
                html += '<td>' + item.EmployeeAddress + '</td>';
                html += '<td>' + item.EmployeeCountry + '</td>';
                html += '<td>' + formattedBirthday + '</td>'; // Use the formatted date
                html += '<td><a href="#" onclick="getbyID(' + item.EmployeeID + '); return false;">Edit</a> | <a href="#" onclick="Delete(' + item.EmployeeID + '); return false;">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Function to format the date
function formatDate(dateString) {
    var formattedDate = '';

    // Lấy ngày hiện tại
    var currentDate = new Date();

    // Xử lý nếu ngày ở định dạng Unix timestamp ("/Date(...)")
    if (dateString && dateString.indexOf('/Date(') == 0) {
        var timestamp = parseInt(dateString.replace('/Date(', '').replace(')/', ''), 10);
        var date = new Date(timestamp);

        // Kiểm tra nếu ngày nhập vào lớn hơn ngày hiện tại
        if (date > currentDate) {
            alert("Date of birth cannot be greater than current date!");
            return ''; // Ngăn không cho tiếp tục nếu điều kiện không hợp lệ
        }

        // Format ngày
        formattedDate =
            ('0' + date.getDate()).slice(-2) + '-' +
            ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
            date.getFullYear();
    } else {
        // Xử lý nếu ngày ở định dạng "yyyy-mm-dd"
        var parts = dateString.split('-');
        if (parts.length == 3) {
            var date = new Date(parts[0], parts[1] - 1, parts[2]);

            // Kiểm tra nếu ngày nhập vào lớn hơn ngày hiện tại
            if (date > currentDate) {
                alert("Date of birth cannot be greater than current date!");
                return ''; // Ngăn không cho tiếp tục nếu điều kiện không hợp lệ
            }
            // Format ngày
            formattedDate =
                ('0' + parts[2]).slice(-2) + '-' +
                ('0' + parts[1]).slice(-2) + '-' +
                parts[0];
        } else {
            formattedDate = dateString;
        }
    }

    return formattedDate;
}
// clearEmployee
function clearTextBox() {
    $('#EmployeeID').val('');
    $('#EmployeeName').val('');
    $('#EmployeeAddress').val('');
    $('#EmployeeCountry').val('');
    $('#EmployeeBirthday').val('');
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#EmployeeName').css('border-color', 'lightgrey');
    $('#EmployeeAddress').css('border-color', 'lightgrey');
    $('#EmployeeCountry').css('border-color', 'lightgrey');
    $('#EmployeeBirthday').css('border-color', 'lightgrey');
}
// GETBYID
function getbyID(ID) {
    $('#EmployeeName').css('border-color', 'lightgrey');
    $('#EmployeeAddress').css('border-color', 'lightgrey');
    $('#EmployeeCountry').css('border-color', 'lightgrey');

    $.ajax({
        url: "Employee.aspx/GetbyID",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ ID: ID }),
        success: function (result) {
            if (result.d) {
                $('#EmployeeID').val(result.d.EmployeeID);
                $('#EmployeeName').val(result.d.EmployeeName);
                $('#EmployeeAddress').val(result.d.EmployeeAddress);
                $('#EmployeeCountry').val(result.d.EmployeeCountry);
                $('#EmployeeBirthday').val(result.d.EmployeeBirthday);
                $('#employeeModal').modal('show');
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
function Add() { 
    alert($('#EmployeeBirthday').val());

    //var employee = {
    //    EmployeeName: $('#EmployeeName').val(),
    //    EmployeeAddress: $('#EmployeeAddress').val(),
    //    EmployeeCountry: $('#EmployeeCountry').val(),
    //    EmployeeBirthday: $('#EmployeeBirthday').val() 
    //};
    //$.ajax({
    //    url: "Employee.aspx/Add",
    //    data: JSON.stringify(employee),
    //    type: "POST",
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: function (result) {
    //        loadData();
    //        $('#employeeModal').modal('hide');
    //    },
    //    error: function (errormessage) {
    //        alert("Lỗi: " + errormessage.responseText);
    //    }
    //});
}
// Funtion Validate
function validate() {
    var isValid = true;
    var employeeName = $('#EmployeeName').val().trim();
    var employeeAddress = $('#EmployeeAddress').val().trim();
    var employeeCountry = $('#EmployeeCountry').val().trim();
    var employeeBirthday = $('#EmployeeBirthday').val().trim();

    if (employeeName == '') {
        $('#EmployeeName').css('border-color', 'red');
        isValid = false;
    } else {
        $('#EmployeeName').css('border-color', 'lightgrey');
    }

    if (employeeAddress == '') {
        $('#EmployeeAddress').css('border-color', 'red');
        isValid = false;
    } else {
        $('#EmployeeAddress').css('border-color', 'lightgrey');
    }

    if (employeeCountry == '') {
        $('#EmployeeCountry').css('border-color', 'red');
        isValid = false;
    } else {
        $('#EmployeeCountry').css('border-color', 'lightgrey');
    }

    if (employeeBirthday == '') {
        $('#EmployeeBirthday').css('border-color', 'red');
        isValid = false;
    } else {
        $('#EmployeeBirthday').css('border-color', 'lightgrey');
    }

    return isValid;
}

function Update() {
    var isValid = validate();
    if (!isValid) {
        return false;
    }

    var employee = {
        EmployeeID: $('#EmployeeID').val(),
        EmployeeName: $('#EmployeeName').val(),
        EmployeeAddress: $('#EmployeeAddress').val(),
        EmployeeCountry: $('#EmployeeCountry').val(),
        EmployeeBirthday: $('#EmployeeBirthday').val()
    };

    $.ajax({
        type: "POST",
        url: "Employee.aspx/Update", 
        data: JSON.stringify(employee),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#employeeModal').modal('hide');
            clearEmployeeTextBox();
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}
// Function Delete
function Delete(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            type: "POST",
            url: "Employee.aspx/Delete",
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