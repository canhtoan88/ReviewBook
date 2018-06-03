<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Topic Menu</title>
</head>
<body>
	<ul class="nav navbar-nav">
	  	<li><a href="Home">Trang chủ</a></li>
	  	<c:if test="${matheloai == 1}">
		   	<li class="active"><a href="Topic?matheloai=1">Kỹ năng sống</a></li>
		   	<li><a href="Topic?matheloai=2">Kinh doanh</a></li>
		   	<li><a href="Topic?matheloai=3">Văn học</a></li>
		   	<li><a href="Topic?matheloai=4">Tiểu thuyết</a></li>
	  	</c:if>
	  	<c:if test="${matheloai == 2}">
		   	<li><a href="Topic?matheloai=1">Kỹ năng sống</a></li>
		   	<li class="active"><a href="Topic?matheloai=2">Kinh doanh</a></li>
		   	<li><a href="Topic?matheloai=3">Văn học</a></li>
		   	<li><a href="Topic?matheloai=4">Tiểu thuyết</a></li>
	  	</c:if>
	  	<c:if test="${matheloai == 3}">
		   	<li><a href="Topic?matheloai=1">Kỹ năng sống</a></li>
		   	<li><a href="Topic?matheloai=2">Kinh doanh</a></li>
		   	<li class="active"><a href="Topic?matheloai=3">Văn học</a></li>
		   	<li><a href="Topic?matheloai=4">Tiểu thuyết</a></li>
	  	</c:if>
	  	<c:if test="${matheloai == 4}">
		   	<li><a href="Topic?matheloai=1">Kỹ năng sống</a></li>
		   	<li><a href="Topic?matheloai=2">Kinh doanh</a></li>
		   	<li><a href="Topic?matheloai=3">Văn học</a></li>
		   	<li class="active"><a href="Topic?matheloai=4">Tiểu thuyết</a></li>
	  	</c:if>
	</ul>
</body>
</html>