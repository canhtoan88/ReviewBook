<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Viết bài</title>
</head>
<body onload="thongbao()">
	<form class="form-horizontal" action="Writing" method="post" enctype="multipart/form-data">
		<input type="hidden" id="url3" name="url3" required/>
		<div class="form-group">
			<label class="control-label col-sm-3">Tiêu đề bài viết:</label>
		    <div class="col-sm-9 col-xs-9">
		        <input type="text" name="tieude" class="form-control" required/>
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3">Hình ảnh đại diện:</label>
			<div class="col-sm-9 col-xs-9">
				<input type="file" name="image" accept="image/*" onchange="previewFile()" required/><br />
				<img src="" height="200" alt="Hình ảnh xem trước ..." style="margin-bottom: 10px"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3">Thể loại bài viết:</label>
			<div class="col-sm-9 col-xs-9">
				<select class="form-control" name="matheloai" required>
					<option>Chọn thể loại...</option>
					<option value="1">Kỹ năng sống</option>
					<option value="2">Kinh doanh</option>
					<option value="3">Văn học</option>
					<option value="4">Tiểu thuyết</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3">Nội dung vắn tắt:</label>
			<div class="col-sm-9 col-xs-9">
				<input type="text" name="noidungvantat" class="form-control" required/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3">Nội dung bài viết:</label>
			<div class="col-sm-9 col-xs-9">
				<textarea name="noidungbaiviet" id="editor" required></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3"></label>
			<div class="col-sm-9 col-xs-9">
				<center>
					<c:if test="${manguoidung != 0}">
						<button type="submit" class="btn btn-success">Gửi <span class="glyphicon glyphicon-send"></span></button>
					</c:if>
					<c:if test="${manguoidung == 0}">
						<button type="submit" class="btn btn-success">Đăng <span class="glyphicon glyphicon-send"></span></button>
					</c:if>
					<a target="_blank" type="button" class="btn btn-success" onclick="send()">Xem trước nội dung</a>
					<button type="reset" class="btn btn-success">Viết lại</button>
				</center>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function () {
        	$("#url3").val(window.location.href);
		});
	</script>
	
	<c:if test="${guibaithanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Gửi thành công! Bài viết đang chờ duyệt!!")
			}
		</script>
		<%
			session.removeAttribute("guibaithanhcong");
		%>
	</c:if>
	<c:if test="${dangbaithanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Bài viết đã được đăng thành công!!")
			}
		</script>
		<%
			session.removeAttribute("dangbaithanhcong");
		%>
	</c:if>
	
	<script type="text/javascript" src="assets/js/ckeditor-standard/ckeditor.js"></script>
	
  	<script type="text/javascript">
	    config                	= {};
	    config.entities_latin 	= false;
	    config.uiColor        	= '#AADC6E';
	    config.height			= 400;
	    CKEDITOR.replace('editor', config);
  	</script>
  	
  	<script type="text/javascript">
  		function send(form) {
			var data = CKEDITOR.instances.editor.getData();
			document.write(data);
		}
  	</script>
  	
	<script>
   		function previewFile(){
	       var preview = document.querySelector('img'); //selects the query named img
	       var file    = document.querySelector('input[type=file]').files[0]; //sames as here
	       var reader  = new FileReader();
	       reader.onloadend = function () {
	           preview.src = reader.result;
	       }
	       if (file) {
	           reader.readAsDataURL(file); //reads the data as a URL
	       } else {
	           preview.src = "";
       		}
  		}
  		previewFile();  //calls the function named previewFile()
  	</script>
  	
</body>
</html>