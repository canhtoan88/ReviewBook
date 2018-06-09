<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Bài viết nổi bật</title>
</head>
<body>
    <div class="col-xs-12 cthightlight mt-xs-2">
        <h5>Bài viết nổi bật</h5>
    </div>
    <c:forEach items="${baivietnoibat}" var="baiviet">
		<div style="border-left: 1px solid #222" class="col-xs-12 nbstyle">
	        <div class="col-xs-4 col-sm-4" style="padding-left: 0; margin-top: 10px">
	           <a href="Reading?mabaiviet=${baiviet.getMaBaiViet()}&matheloai=${baiviet.getMaTheLoai()}" title="${baiviet.getTieuDe()}"><img style="width: 100%; max-width: 100px" src="${baiviet.getDuongDanHinhAnh()}" alt="${baiviet.getTieuDe()}"/></a>
	        </div>
	        <div class="col-xs-8 col-sm-8" style="margin-top: 10px">
	           <a href="Reading?mabaiviet=${baiviet.getMaBaiViet()}&matheloai=${baiviet.getMaTheLoai()}" title=""><span style="font-size: 17px">${baiviet.getTieuDe()}</span></a><br />
	           <i><fmt:formatDate value="${baiviet.getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i><br />
	           <span style="color: purple;"><i>Lượt xem: ${baiviet.getLuotXem()}</i></span>
	        </div>
	    </div>
    </c:forEach>
</body>
</html>