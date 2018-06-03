<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="form-group">
		<label class="control-label col-sm-3">Tiêu đề bài viết:</label>
	    <div class="col-sm-9 col-xs-9">
	        <input type="text" name="tieude" class="form-control" required value="${thongtinchinhsua.getTieuDe()}"/>
	    </div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-3">Hình ảnh đại diện:</label>
		<div class="col-sm-9 col-xs-9">
			<input disabled type="file" name="image" accept="image/*" onchange="previewFile()" required/><br />
			<img src="${thongtinchinhsua.getDuongDanHinhAnh()}" height="200" alt="Hình ảnh xem trước ..." style="margin-bottom: 10px"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-3">Thể loại bài viết:</label>
		<div class="col-sm-9 col-xs-9">
			<select disabled class="form-control" name="matheloai" required>
				<option>${thongtinchinhsua.getTentheloai()}</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-3">Nội dung vắn tắt:</label>
		<div class="col-sm-9 col-xs-9">
			<input type="text" name="noidungvantat" class="form-control" required value="${thongtinchinhsua.getNoiDungVanTat()}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-3">Nội dung bài viết:</label>
		<div class="col-sm-9 col-xs-9">
			<textarea name="noidungbaiviet" id="editor" required>${thongtinchinhsua.getNoidungbaiviet()}</textarea>
		</div>
	</div>
	<script type="text/javascript" src="assets/js/ckeditor-standard/ckeditor.js"></script>
	
  	<script type="text/javascript">
	    config                	= {};
	    config.entities_latin 	= false;
	    config.uiColor        	= '#AADC6E';
	    config.height			= 400;
	    CKEDITOR.replace('editor', config);
  	</script>
</body>
</html>