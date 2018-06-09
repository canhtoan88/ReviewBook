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
  	<link rel="stylesheet" type="text/css" href="assets/css/comments.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/hipster-cards.css"/>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
  	<script type="text/javascript" src="assets/js/jquery-3.3.1.js"></script>
	<title>${thongtinbaiviet.getTieuDe()}</title>
</head>
<body onload="thongbao()">
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
    			<jsp:include page="topicmenu.jsp"/>
		    	<jsp:include page="foundmenu.jsp"/>
		    	<div class="center-block">
		    		<c:if test="${username == null}">
			    		<button onclick="document.getElementById('signin').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px 0;">Đăng nhập</button>
			    		<button onclick="document.getElementById('signup').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px">Đăng ký</button>
				    </c:if>
				    <c:if test="${username != null}">
			    		<button class="btn btn-warning" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin: 7.7px">Xin chào <i>${username}</i></button>
			    	</c:if>
		    	</div>
    		</div>
  		</div>
	</nav>
	<!-- End menu -->
	
	<!-- Start body -->
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-12 col-xs-12">
				<h1 class="modal-title"><b>${thongtinbaiviet.getTieuDe()}</b></h1>
                <p><i><fmt:formatDate value="${thongtinbaiviet.getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i></p>
                <div style="font-size: 17px">
                    ${thongtinbaiviet.getNoiDungBaiViet()}
                </div>
                <br />
                <div class="vl"></div>
                <p id="commentArea" style="color: green; font-size: 16px; margin-top: 16px"><b>BÌNH LUẬN (${soluongbinhluan})</b></p>
                <c:forEach items="${thongtinbinhluan}" var="binhluan">
	                <div class="containerct">
					  	<p id="comment${binhluan.getMaBinhLuan()}">
					  		<span style="color: orange;">${binhluan.getHoTen()}</span>
					  		<i><fmt:formatDate value="${binhluan.getThoiGianBinhLuan()}" pattern="dd-MM-yyyy"/></i>
						  	<c:if test="${binhluan.getMaNguoiDung() == manguoidung}">
						  		<c:if test="${binhluan.getMaBinhLuan() != editmabinhluan}">
						  			<sup>
						  				<a href="Comment?mabinhluan=${binhluan.getMaBinhLuan()}&mabaiviet=${thongtinbaiviet.getMaBaiViet()}&matheloai=${matheloai}">Xóa</a> ||
						  				<a href="EditComment?mabinhluan=${binhluan.getMaBinhLuan()}&mabaiviet=${thongtinbaiviet.getMaBaiViet()}&matheloai=${matheloai}">Chỉnh sửa</a>
						  			</sup>
						  		</c:if>
								<c:if test="${binhluan.getMaBinhLuan() == editmabinhluan}">
									<form id="editcomment" action="EditComment?mabinhluan=${binhluan.getMaBinhLuan()}&mabaiviet=${thongtinbaiviet.getMaBaiViet()}&matheloai=${matheloai}" method="post">
									    <div class="form-group">
									    	<textarea class="form-control" name="noidungbinhluan" rows="5" minlength="10" maxlength="300" autofocus>${noidungbinhluan}</textarea>
									    	<span style="float: right"><input class="btn btn-success" style="margin: 10px 0" type="submit" value="Lưu"/></span>
									    	<span style="float: right"><a href="" class="btn btn-success" style="margin: 10px 0" type="button">Hủy</a></span>
									  	</div>
									</form>
						    	</c:if>
						  	</c:if>
					  	</p>
					  <p style="padding: 0 20px">&emsp;&emsp;${binhluan.getNoiDungBinhLuan()}</p>
					</div>
				</c:forEach>
				<c:if test="${manguoidung != null && manguoidung != 0}">
					<c:if test="${editmabinhluan == null}">
						<form id="comment" action="Comment?mabaiviet=${thongtinbaiviet.getMaBaiViet()}&matheloai=${matheloai}" method="post">
						    <div class="form-group">
						    	<textarea class="form-control" name="noidungbinhluan" rows="5" placeholder="Nhập nội dung bình luận ..." maxlength="300"></textarea>
						    	<span style="float: right"><input class="btn btn-success" style="margin: 10px 0" type="submit" value="Đăng bình luận"/></span>
						  	</div>
						</form>
					</c:if>
				</c:if>
				<c:if test="${manguoidung == null || manguoidung == 0}">
					<p style="margin-bottom: 16px">Hãy<button  class="btn btn-link" onclick="document.getElementById('signin').style.display='block'"><i>đăng nhập</i></button>để bình luận cho bài viết này!! Hoặc<button class="btn btn-link" onclick="document.getElementById('signup').style.display='block'"><i>đăng ký</i></button>nếu chưa có tài khoản.</p>
				</c:if>
                <div class="col-xs-12 col-sm-12 ">
                    <h5 style="padding: 9px 0;border-bottom: 1px solid #222"><b class="cthightlight">Cùng chủ đề</b></h5>
                </div>
                
                <c:forEach items="${baivietcungchude}" var="baiviet">
	               	<div class="col-md-3 col-sm-6 col-xs-12 ccdstyle" style="margin-top: 10px; text-align: center;">
	               		<a href="Reading?mabaiviet=${baiviet.getMaBaiViet()}&matheloai=${baiviet.getMaTheLoai()}" title="${baiviet.getTieuDe()}"><img style="width: 100%; max-width: 150px" src="${baiviet.getDuongDanHinhAnh()}" alt="${baiviet.getTieuDe()}"/></a><br />
	               		<a href="Reading?mabaiviet=${baiviet.getMaBaiViet()}&matheloai=${baiviet.getMaTheLoai()}" title=""><span style="font-size: 17px">${baiviet.getTieuDe()}</span></a>
	               	</div>
               	</c:forEach>
                
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
	<div class="modal fade" id="myModal" role="dialog">
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
	
	<c:if test="${binhluanthanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Đã bình luận cho bài viết này!!")
			}
		</script>
		<%
			session.removeAttribute("binhluanthanhcong");
		%>
	</c:if>
	<c:if test="${xoabinhluanthanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Đã xóa bình luận!!")
			}
		</script>
		<%
			session.removeAttribute("xoabinhluanthanhcong");
		%>
	</c:if>
	<c:if test="${chinhsuabinhluan != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Đã chỉnh sửa bình luận!!")
			}
		</script>
		<%
			session.removeAttribute("chinhsuabinhluan");
		%>
	</c:if>
	<c:if test="${editmabinhluan != null}">
		<%
			session.removeAttribute("editmabinhluan");
			session.removeAttribute("noidungbinhluan");
		%>
	</c:if>
</body>
</html>