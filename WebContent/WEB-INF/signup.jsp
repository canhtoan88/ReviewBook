<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Đăng ký</title>
</head>
<body>
	<form onSubmit="return kiemtramatkhau(this)" class="ctmodal-content-signup animate" action="Signup" method="post" accept-charset="utf-8">
		<div class="imgcontainer">
			<span onclick="document.getElementById('signup').style.display='none'" class="close" title="Thoát">&times;</span>
			<img src="assets/img/signup.png" alt="Avatar"/>
		</div>
		<div class="ctcontainer">
			<label for="name"><b>Họ và Tên</b></label>
     			<input class="form-control" type="text" placeholder="Họ và Tên" name="hoten" minlength="8" required/>

			<label for="uname"><b>Tên đăng nhập</b></label>
     			<input class="form-control" type="text" placeholder="Tên đăng nhập" name="tendangnhap" minlength="6" required/>

     			<label for="gender"><b>Giới tính</b></label>
     			<select class="form-control" name="gioitinh" required style="margin: 7px 0">
     				<option value="">Giới tính</option>
     				<option value="1">Nam</option>
     				<option value="0">Nữ</option>
     			</select>

     			<label for="email"><b>Email</b></label>
     			<input class="form-control" type="email" placeholder="Email" name="email" minlength="16" required"/>

     			<label for="psw"><b>Mật khẩu</b></label>
     			<input class="form-control" type="password" placeholder="Mật khẩu" name="matkhau" minlength="6" required/>

     			<label for="psw"><b>Xác nhận mật khẩu</b></label>
     			<input class="form-control" type="password" placeholder="Mật khẩu" name="nhaplaimatkhau" required/>
				<input type="hidden" name="url4" value="" id="url4"/>
       
     			<button class="btn btn-danger btn-block btn-ct" type="submit">Đăng Ký</button>
		</div>
	</form>
	
	<script type="text/javascript">
		/* document.getElementById("url").innerHTML = window.location.href; */
		$(document).ready(function () {
        	$("#url4").val(window.location.href);
		});
	</script>
	
    <script type="text/javascript">
	    function kiemtramatkhau(form) {
	        matkhau = form.matkhau.value;
	        nhaplaimatkhau = form.nhaplaimatkhau.value;
	
	        if (matkhau != nhaplaimatkhau) {
	            alert ("\nMật khẩu nhập lại không đúng, xin vui lòng nhập lại!")
	            return false;
	        }
	        else return true;
	    }
    </script>
</body>
</html>







