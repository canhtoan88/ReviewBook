<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" type="image/png" href="assets/img/books.png"/>
  	<link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/hipster-cards.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/datatables.min.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/comments.css"/>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
  	<script type="text/javascript" src="assets/js/jquery-3.3.1.js"></script>
	<title>Kết quả tìm kiếm</title>
</head>
<body onload="thongbaotimkiem()">
	<!-- Start header -->
	<div class="container">
		<h1 class="text-center"><b><span style="color: blue">REVIEW</span> - <span style="color: green">SÁCH</span></b></h1>
		<p class="text-center">Nơi dừng chân cho "Mọt"</p>
	</div>
	<!-- End header -->

	<!-- Start menu -->
	<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="95">
        <div class="col-sm-1"></div>
  		<div class="col-sm-11 container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="Home"><span style="color:blue">REVIEW</span> - <span style="color:green">SÁCH</span></a>
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-1">
    				<span class="sr-only">Toggle navigation</span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    			</button>
    		</div>
    		<div class="collapse navbar-collapse" id="collapse-1">
    			<jsp:include page="menu.jsp"/>
		    	<jsp:include page="foundmenu.jsp"/>
		    	<div class="center-block">
		    		<c:if test="${username == null}">
			    		<button onclick="document.getElementById('signin').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px 0;">Đăng nhập</button>
			    		<button onclick="document.getElementById('signup').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px">Đăng ký</button>
				    </c:if>
				    <c:if test="${username != null}">
			    		<button class="btn btn-warning" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#profile" style="margin: 7.7px">Xin chào <i>${username}</i></button>
			    	</c:if>
		    	</div>
    		</div>
  		</div>
	</nav>
	<!-- End menu -->

	<!-- Start new post -->
	
	<!-- End new post -->

	<!-- Start body -->
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
				<c:if test="${soluongketqua == 0}">
					<h2>Không có kết quả nào được tìm thấy với <i style="color: green">'${noidungtimkiem}'</i></h2>
				</c:if>
				<c:if test="${soluongketqua != 0}">
					<h2>Có ${soluongketqua} kết quả được tìm thấy với <i style="color: green">'${noidungtimkiem}'</i></h2>
					<c:forEach items="${thongtintimkiem}" var="timkiem">
						<div class="row">
				            <div class="col-sm-4">
				                <a href="Reading?mabaiviet=${timkiem.getMaBaiViet()}&matheloai=${timkiem.getMaTheLoai()}" title="${timkiem.getTieuDe()}"><img class="center-block" src="${timkiem.getDuongDanHinhAnh()}" alt="" style="width: 100%; max-width: 150px"/></a>
				            </div>
				            <div class="col-sm-8">
				                <a href="Reading?mabaiviet=${timkiem.getMaBaiViet()}&matheloai=${timkiem.getMaTheLoai()}" title=""><h4>${timkiem.getTieuDe()}</h4></a>
				                <p><i><fmt:formatDate value="${timkiem.getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i></p>
				                <p>${timkiem.getNoiDungVanTat()}</p>
				            </div>
				        </div>
				        <hr />
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<jsp:include page="highlight.jsp"/>
			</div>
		</div>
    </div>
	<!-- End body -->

	<!-- Start footer -->
		<jsp:include page="footer.jsp"/>
    <!-- End footer -->
    
    <!-- Start sign in box -->
	<div id="signin" class="ctmodal" data-spy="affix" data-offset-top="-1">
		<jsp:include page="login.jsp"/>
	</div>
	<!-- End sign in box -->
	<!-- Start sign up box -->
	<div id="signup" class="ctmodal"  data-spy="affix" data-offset-top="-1">
		<jsp:include page="signup.jsp"/>
	</div>
	<!-- End sign up box -->
	
	<!-- Start view profile -->
	<div class="modal fade" id="profile" role="dialog">
		<jsp:include page="profile.jsp"/>
	</div>
	<!-- End view profile -->

	<!-- Start Scroll to top -->
	<button onclick="topFunction()" id="scrolltop" title="Go to top">Top</button>
	<!-- End Scroll to top -->
	
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="assets/js/hipster-cards.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="assets/js/bootstrap3-typeahead.js"></script>
	<script type="text/javascript" src="assets/js/autocomplete.js"></script>
	<script type="text/javascript" src="assets/js/accordion.js"></script>
	<script type="text/javascript" src="assets/js/datatables.min.js"></script>
	<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};
	
	function scrollFunction() {
	    if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
	        document.getElementById("scrolltop").style.display = "block"
	    } else {
	        document.getElementById("scrolltop").style.display = "none";
	    }
	}
	
	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	    document.body.scrollTop = 0;
	    document.documentElement.scrollTop = 0;
	}
	</script>
	
	<c:if test="${timkiemrong != null}">
		<script type="text/javascript">
			function thongbaotimkiem() {
				alert("Vui lòng nhập nội dung vào khung tìm kiếm!")
			}
		</script>
		<%
			session.removeAttribute("timkiemrong");
		%>
	</c:if>	
</body>
</html>