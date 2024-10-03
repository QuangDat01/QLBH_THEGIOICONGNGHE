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

function loadData() {
	$.ajax({
		type: "POST",
		url: "Product.aspx/GetAllProductsWithCategory", // Đường dẫn đến Product.aspx
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: '{}',
		success: function (response) {
			var html = '';			
				$.each(response.d, function (key, item) {
					var formattedPrice = formatPrice(item.ProductPrice);
					html += '<tr>';
					html += '<td>' + item.ProductID + '</td>';
					html += '<td>' + item.ProductName + '</td>';
					html += '<td>' + formattedPrice + '</td>';
					html += '<td>' + item.ProductQuantity + '</td>';
					html += '<td>' + item.ProductDescription + '</td>';
					html += '<td style="text-align: center;"><img src="' + item.ProductImage + '" alt="Product Image" width="135" height="100" style="display: block; margin: auto;" /></td>';
					html += '<td style="text-align: center;">' + item.CategoryName + '</td>'; // Hiển thị CategoryName
					//html += '<td>' + item.Detail + '</td>';
					html += '<td><a href="#" onclick="return getbyID(' + item.ProductID + ')">Edit</a> | <a href="#" onclick="return Delete(' + item.ProductID + ')">Delete</a></td>';
					html += '</tr>';
				});
			
			$('.tbody').html(html); // Cập nhật nội dung bảng
		},
		error: function (errormessage) {
			alert("Error: " + errormessage.responseText);
		}
	});
}

function Add() {
	var pro = {
		ProductName: $('#ProductName').val(),
		ProductPrice: $('#ProductPrice').val(),
		ProductQuantity: $('#ProductQuantity').val(),
		ProductDescription: $('#ProductDescription').val(),
		ProductImage: $('#ProductImage').val(),
		Detail: CKEDITOR.instances['Detail'].getData(), // Get data from CKEditor
		CategoryID: $('#CategoryID').val()
	};

	$.ajax({
		url: "Product.aspx/Add",
		data: JSON.stringify(pro),
		type: "POST",
		contentType: "application/json;charset=utf-8",
		dataType: "json",
		success: function () {
			loadData();
			$('#productModal').modal('hide');
		},
		error: function (errormessage) {
			alert(errormessage.responseText);
		}
	});
}

// Function clearTextBox
function clearTextBox() {
	$('#ProductID').val('');
	$('#ProductName').val('');
	$('#ProductPrice').val('');
	$('#ProductQuantity').val('');
	$('#ProductDescription').val('');
	$('#ProductImage').val('');
	CKEDITOR.instances['Detail'].setData('');
	$('#CategoryID').val('');

}

// Function getbyID
function getbyID(ID) {
	$.ajax({
		url: "Product.aspx/GetbyID",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		data: JSON.stringify({ ID: ID }),
		success: function (result) {
			if (result.d) {
				console.log("Detail:", result.d.Detail); // Kiểm tra giá trị của Detail trên console
				$('#ProductID').val(result.d.ProductID);
				$('#ProductName').val(result.d.ProductName);
				$('#ProductPrice').val(result.d.ProductPrice);
				$('#ProductQuantity').val(result.d.ProductQuantity);
				$('#ProductDescription').val(result.d.ProductDescription);
				$('#ProductImage').val(result.d.ProductImage);
				$('#ProductImagePreview').attr('src', result.d.ProductImage ? result.d.ProductImage : '');

				// Cập nhật dữ liệu Detail trong CKEditor
				CKEDITOR.instances['Detail'].setData(result.d.Detail);

				$('#CategoryID').val(result.d.CategoryID);
				$('#productModal').modal('show');
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
	var productName = $('#ProductName').val().trim();
	var productPrice = $('#ProductPrice').val().trim();
	var productQuantity = $('#ProductQuantity').val().trim();
	var productDescription = $('#ProductDescription').val().trim();
	var detail = CKEDITOR.instances['Detail'].getData().trim(); // Retrieve Detail from CKEditor
	var categoryID = $('#CategoryID').val().trim();

	if (productName === '') {
		$('#ProductName').css('border-color', 'red');
		isValid = false;
	} else {
		$('#ProductName').css('border-color', 'lightgrey');
	}

	if (productPrice === '' || isNaN(productPrice) || parseFloat(productPrice) <= 0) {
		$('#ProductPrice').css('border-color', 'red');
		isValid = false;
	} else {
		$('#ProductPrice').css('border-color', 'lightgrey');
	}

	if (productQuantity === '' || isNaN(productQuantity) || parseInt(productQuantity) < 0) {
		$('#ProductQuantity').css('border-color', 'red');
		isValid = false;
	} else {
		$('#ProductQuantity').css('border-color', 'lightgrey');
	}

	if (productDescription === '') {
		$('#ProductDescription').css('border-color', 'red');
		isValid = false;
	} else {
		$('#ProductDescription').css('border-color', 'lightgrey');
	}

	if (categoryID === '' || isNaN(categoryID) || parseInt(categoryID) <= 0) {
		$('#CategoryID').css('border-color', 'red');
		isValid = false;
	} else {
		$('#CategoryID').css('border-color', 'lightgrey');
	}

	if (detail === '') { // Validate Detail field
		alert("Detail cannot be empty.");
		isValid = false;
	}

	return isValid;
}

function Update() {
	var product = {
		ProductID: $('#ProductID').val(),
		ProductName: $('#ProductName').val(),
		ProductPrice: $('#ProductPrice').val(),
		ProductQuantity: $('#ProductQuantity').val(),
		ProductDescription: $('#ProductDescription').val(),
		ProductImage: $('#ProductImage').val(),
		Detail: CKEDITOR.instances['Detail'].getData(), // Get data from CKEditor
		CategoryID: $('#CategoryID').val()
	};

	$.ajax({
		type: "POST",
		url: "Product.aspx/Update",
		data: JSON.stringify(product),
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function () {
			loadData();
			$('#productModal').modal('hide');
		},
		error: function (errormessage) {
			alert("Error: " + errormessage.responseText);
		}
	});
}

//function Delete(ID) {
function Delete(ID) {
	var ans = confirm("Bạn có chắc chắn muốn xóa bản ghi này không?");
	if (ans) {
		$.ajax({
			type: "POST",
			url: "Product.aspx/Delete",
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
		url: "Product.aspx/GetAllCategories",
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (response) {
			var html = '<option value="" disabled selected>Chọn CategoryID</option>';
			$.each(response.d, function (key, item) {
				html += '<option value="' + item.CategoryID + '">' + item.CategoryName + '</option>';
			});
			$('#CategoryID').html(html);
		},
		error: function (errormessage) {
			alert("Error: " + errormessage.responseText);
		}
	});
}