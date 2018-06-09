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
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
  	<script type="text/javascript" src="assets/js/jquery-3.3.1.js"></script>
	<title>Review Sách</title>
</head>
<body>

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
    			<ul class="nav navbar-nav">
			      	<li class="active"><a href="Home">Trang chủ</a></li>
			      	<li><a href="Topic?matheloai=1">Kỹ năng sống</a></li>
			      	<li><a href="Topic?matheloai=2">Kinh doanh</a></li>
			      	<li><a href="Topic?matheloai=3">Văn học</a></li>
			      	<li><a href="Topic?matheloai=4">Tiểu thuyết</a></li>
		    	</ul>
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
	<div class="container" style="margin-top: 60px">
		<c:forEach items="${baivietmoinhat}" var="moinhat">
			<div class="card-box col-md-3 col-sm-6">
	            <div class="card">                            
	                <div class="header">
	                    <img src="${moinhat.getDuongDanHinhAnh()}"/>
	                    <div class="filter"></div>
	                    
	                    <div class="actions">
	                    	<a href="Reading?mabaiviet=${moinhat.getMaBaiViet()}&matheloai=${moinhat.getMaTheLoai()}"><button class="btn btn-round btn-fill btn-neutral btn-modern">
	                            Đọc bài viết
	                        </button></a>
	                    </div>
	                </div>
	                
	                <div class="content">
	                    <h6 class="category"><span class="badge">
	                    	<c:if test="${moinhat.getMaTheLoai() == 1}">Kỹ năng sống</c:if>
	                    	<c:if test="${moinhat.getMaTheLoai() == 2}">Kinh doanh</c:if>
	                    	<c:if test="${moinhat.getMaTheLoai() == 3}">Văn học</c:if>
	                    	<c:if test="${moinhat.getMaTheLoai() == 4}">Tiểu thuyết</c:if>
	                    </span></h6>
	                    <div class="cardnct">
	                    	<h4 class="title"><a href="Reading?mabaiviet=${moinhat.getMaBaiViet()}&matheloai=${moinhat.getMaTheLoai()}">${moinhat.getTieuDe()}</a></h4>
	                    	<p class="description">${moinhat.getNoiDungVanTat()}</p>
	                    </div>
	                    <hr/><i>Thời gian: <fmt:formatDate value="${moinhat.getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i>
	                </div>                                           
	            </div>
	         </div>
         </c:forEach>
	</div>
	<!-- End new post -->

	<!-- Start body -->
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
				<c:forEach items="${dsbaiviettieptheo}" var="tieptheo">
					<button class="ctaccordion">
						<c:if test="${tieptheo.getMaTheLoai() == 1}">KỸ NĂNG SỐNG</c:if>
						<c:if test="${tieptheo.getMaTheLoai() == 2}">KINH DOANH</c:if>
						<c:if test="${tieptheo.getMaTheLoai() == 3}">VĂN HỌC</c:if>
						<c:if test="${tieptheo.getMaTheLoai() == 4}">TIỂU THUYẾT</c:if>
					</button>
					<div class="ctpanel">
					  	<div class="col-sm-6">
					  		<div class="col-xs-12" style="margin-top: 10px">
	                            <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(0).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(0).getMaTheLoai()}" title="">
	                                <img src="${tieptheo.getHomePosts().get(0).getDuongDanHinhAnh()}" alt="" style="width: 100%; max-width: 300px"/>
	                                <h4>${tieptheo.getHomePosts().get(0).getTieuDe()}</h4>
	                            </a>
	                            <i><fmt:formatDate value="${tieptheo.getHomePosts().get(0).getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i>
	                            <p>${tieptheo.getHomePosts().get(0).getNoiDungVanTat()}</p>
	                        </div>
					  	</div>
	
					  	<div class="col-sm-6">
					  		<div class="col-xs-12 cdstyle" style="margin-top: 10px">
	                            <div class="col-xs-4" style="padding-left: 0">
	                               <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(1).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(1).getMaTheLoai()}" title=""><img style="width: 100%;max-width: 100px" src="${tieptheo.getHomePosts().get(1).getDuongDanHinhAnh()}" alt="${tieptheo.getHomePosts().get(1).getTieuDe()}"/></a>
	                            </div>
	                            <div class="col-xs-8">
	                               <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(1).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(1).getMaTheLoai()}" title=""><span style="font-size: 17px">${tieptheo.getHomePosts().get(1).getTieuDe()}</span></a>
	                               <p><i><fmt:formatDate value="${tieptheo.getHomePosts().get(1).getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i></p>
	                            </div>
	                        </div>
	                        <div class="col-xs-12 cdstyle" style="margin-top: 10px">
	                            <div class="col-xs-4" style="padding-left: 0">
	                               <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(2).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(2).getMaTheLoai()}" title=""><img style="width: 100%;max-width: 100px" src="${tieptheo.getHomePosts().get(2).getDuongDanHinhAnh()}" alt="${tieptheo.getHomePosts().get(2).getTieuDe()}"/></a>
	                            </div>
	                            <div class="col-xs-8">
	                               <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(2).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(2).getMaTheLoai()}" title=""><span style="font-size: 17px">${tieptheo.getHomePosts().get(2).getTieuDe()}</span></a>
	                               <p><i><fmt:formatDate value="${tieptheo.getHomePosts().get(2).getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i></p>
	                            </div>
	                        </div>
	                        <div class="col-xs-12 cdstyle" style="margin-top: 10px">
	                            <div class="col-xs-4" style="padding-left: 0">
	                               <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(3).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(3).getMaTheLoai()}" title=""><img style="width: 100%;max-width: 100px" src="${tieptheo.getHomePosts().get(3).getDuongDanHinhAnh()}" alt="${tieptheo.getHomePosts().get(3).getTieuDe()}"/></a>
	                            </div>
	                            <div class="col-xs-8">
	                               <a href="Reading?mabaiviet=${tieptheo.getHomePosts().get(3).getMaBaiViet()}&matheloai=${tieptheo.getHomePosts().get(3).getMaTheLoai()}" title=""><span style="font-size: 17px">${tieptheo.getHomePosts().get(3).getTieuDe()}</span></a>
	                               <p><i><fmt:formatDate value="${tieptheo.getHomePosts().get(3).getThoiGianDangBai()}" pattern="dd-MM-yyyy"/></i></p>
	                            </div>
	                        </div>
					  	</div>
	                    <div class="col-xs-12 text-center" style="margin-top: 10px">
	                        <a href="Topic?matheloai=${tieptheo.getMaTheLoai()}" title="Xem nhiều hơn"><button type="button" class="btn" style="background-color: #00b900; color: #ffff1a; margin-bottom: 5px">Xem nhiều hơn</button></a>
	                    </div>
					</div>
                </c:forEach>
			</div>
			<div class="col-sm-3">
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
		<jsp:include page="signup.jsp" flush="true"/>
	</div>
	<!-- End sign up box -->
	
	<!-- Start view profile -->
	<div class="modal fade" id="profile" role="dialog">
		<jsp:include page="profile.jsp"/>
	</div>
	<!-- End view profile -->

	<!-- Start Scroll to top -->
	<button onclick="topFunction()" id="scrolltop" title="Lên đầu trang">Top</button>
	<!-- End Scroll to top -->
	
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="assets/js/hipster-cards.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="assets/js/bootstrap3-typeahead.js"></script>
	<script type="text/javascript" src="assets/js/autocomplete.js"></script>
	<script type="text/javascript" src="assets/js/accordion.js"></script>
	
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
</body>
</html>