$(function () {
    loadData(); // Load data when the page is first loaded
});

// Function to load the user list
function loadData() {
    $.ajax({
        type: "POST",
        url: "Register.aspx/GetAll",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var html = '';
            $.each(response.d, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.UserID + '</td>';
                html += '<td>' + item.UserName + '</td>';
                html += '<td><input type="password" class="password-input" value="' + item.Password + '" readonly style="border: none; background: none; width: auto;" /></td>'; // Keep password as input field
                html += '<td>' + item.Email + '</td>';
                html += '<td><a href="#" onclick="return getbyID(' + item.UserID + ')">Edit</a> | <a href="#" onclick="return Delete(' + item.UserID + ')">Delete</a></td>';
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
        }
    });
}

// Function to validate email
function validateEmail(callback) {
    const emailInput = document.getElementById('Email');
    const emailValue = emailInput.value;

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Simple email regex

    if (!emailPattern.test(emailValue)) {
        alert('Email không hợp lệ'); // Invalid email format
        callback(false);
        return;
    }

    // Check for duplicate email
    $.ajax({
        url: "Register.aspx/CheckEmailExists",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ Email: emailValue }),
        success: function (result) {
            if (result.d) {
                alert('Email đã tồn tại'); // Email already exists
                callback(false);
            } else {
                callback(true); // Valid email
            }
        },
        error: function (errormessage) {
            alert("Error: " + errormessage.responseText);
            callback(false);
        }
    });
}

// Function to add a new user
function Add() {
    validateEmail(function (isValid) {
        if (!isValid) return; // Stop if the email is invalid or duplicate

        var user = {
            UserName: $('#UserName').val(),
            Password: $('#Password').val(),
            Email: $('#Email').val()
        };

        $.ajax({
            url: "Register.aspx/Add",
            data: JSON.stringify(user),
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                loadData(); // Reload the list after adding
                $('#UserModal').modal('hide'); // Close modal
                clearTextBox(); // Clear input fields
            },
            error: function (errormessage) {
                alert("Error: " + errormessage.responseText);
            }
        });
    });
}

// Function to clear input fields
function clearTextBox() {
    $('#UserID').val("");
    $('#UserName').val("");
    $('#Password').val("");
    $('#Email').val("");
    $('#btnUpdate').hide(); // Hide Update button
    $('#btnAdd').show(); // Show Add button
}

// Function to get user info by ID
function getbyID(ID) {
    $.ajax({
        url: "Register.aspx/GetbyID",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        data: '{ ID: ' + ID + '}',
        success: function (result) {
            $('#UserID').val(result.d.UserID);
            $('#UserName').val(result.d.UserName);
            $('#Password').val(result.d.Password); // Get password
            $('#Email').val(result.d.Email);
            $('#UserModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

// Function to update user information
function Update() {
    validateEmail(function (isValid) {
        if (!isValid) return; // Stop if the email is invalid or duplicate

        var user = {
            UserID: $('#UserID').val(),
            UserName: $('#UserName').val(),
            Password: $('#Password').val(),
            Email: $('#Email').val()
        };

        $.ajax({
            url: "Register.aspx/Update",
            data: JSON.stringify(user),
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                loadData(); // Reload the list after updating
                $('#UserModal').modal('hide'); // Close modal
                clearTextBox(); // Clear input fields
            },
            error: function (errormessage) {
                alert("Error: " + errormessage.responseText);
            }
        });
    });
}

// Function to delete a user
function Delete(ID) {
    var ans = confirm("Are you sure you want to delete this user?");
    if (ans) {
        $.ajax({
            url: "Register.aspx/Delete",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            data: '{ ID: ' + ID + '}',
            success: function (result) {
                loadData(); // Reload the list after deletion
            },
            error: function (errormessage) {
                alert("Error: " + errormessage.responseText);
            }
        });
    }
    return false;
}
