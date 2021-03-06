<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Đăng nhập</title>
</head>
<body onload="thongbao()">
	<form class="ctmodal-content-signin animate" action="Login" method="post" accept-charset="utf-8">
		<div class="imgcontainer">
			<span onclick="document.getElementById('signin').style.display='none'" class="close" title="Thoát">&times;</span>
			<img src="assets/img/avatar.png" alt="Avatar" class="avatar"/>
		</div>
		<div class="ctcontainer">
			<label for="uname"><b>Tên đăng nhập</b></label>
     		<input class="form-control" type="text" placeholder="Tên đăng nhập" name="username" value="${username_holder}" required/>

     		<label for="psw"><b>Mật khẩu</b></label>
     		<input class="form-control" type="password" placeholder="Mật khẩu" name="password" value="${password_holder}" required/>
       			
   			<input type="hidden" id="url" name="url" required/>
     		<button class="btn btn-primary btn-block btn-ct" type="submit">Đăng nhập</button>
     		<label>
     			<c:if test="${checked != null}">
       				<input type="checkbox" checked="checked" name="remember"/> Nhớ mật khẩu
       			</c:if>
       			<c:if test="${checked == null}">
       				<input type="checkbox" name="remember"/> Nhớ mật khẩu
       			</c:if>
     		</label>
		</div>
		<div class="ctcontainer" style="background-color:#f1f1f1">
			<button onclick="document.getElementById('signup').style.display='block'; document.getElementById('signin').style.display='none'" type="button" class="cancel" id="taotaikhoan">Tạo tài khoản</button>
     		<span class="psw"><a href="GetPassword">Quên mật khẩu?</a></span>
   		</div>
	</form>
	<script type="text/javascript">
		/* document.getElementById("url").innerHTML = window.location.href; */
		$(document).ready(function () {
        	$("#url").val(window.location.href);
		});
	</script>

	<c:if test="${dangxuatthanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Đã đăng xuất!")
			}
		</script>
		<%
			session.removeAttribute("dangxuatthanhcong");
		%>
	</c:if>
</body>
</html>