<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<title>Quản lý hệ thống</title>
</head>
<body>
	<br /><br /><br />
	<center>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<form action="Admin" method="post">
				<input type="text" class="form-control" name="username" placeholder="Tên tài khoản"/><br />
				<input type="password" class="form-control" name="password" placeholder="Mật khẩu"/><br />
				<input type="submit" class="btn btn-warning" value="Đăng nhập"/>
			</form>
		</div>
	</center>
</body>
</html>