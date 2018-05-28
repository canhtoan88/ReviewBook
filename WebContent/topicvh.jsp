<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" type="image/png" href="assets/img/books.png"/>
  	<link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/hipster-cards.css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/datatables.min.css"/>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<title>Văn học</title>
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
      			<a class="navbar-brand" href="index.jsp"><span style="color:blue">REVIEW</span> - <span style="color:green">SÁCH</span></a>
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse-1">
    				<span class="sr-only">Toggle navigation</span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    				<span class="icon-bar"></span>
    			</button>
    		</div>
    		<div class="collapse navbar-collapse" id="collapse-1">
    			<ul class="nav navbar-nav">
			      	<li><a href="index.jsp">Trang chủ</a></li>
			      	<li><a href="topickns.jsp">Kỹ năng sống</a></li>
			      	<li><a href="topickd.jsp">Kinh doanh</a></li>
			      	<li class="active"><a href="topicvh.jsp">Văn học</a></li>
			      	<li><a href="topictt.jsp">Tiểu thuyết</a></li>
		    	</ul>
		    	<form autocomplete="off" class="navbar-form navbar-left" action="found.jsp">
		      		<div class="input-group autocomplete">
		        		<input type="text" class="typeahead form-control" placeholder="Tìm kiếm" name="search"/>
		        		<div class="input-group-btn">
				          	<button class="btn btn-default" type="submit" style="height: 34px">
				            	<i class="glyphicon glyphicon-search"></i>
				          	</button>
		       		 	</div>
		      		</div>
		    	</form>
		    	<div class="center-block">
		    		<button onclick="document.getElementById('signin').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px 0;">Đăng nhập</button>
		    		<button onclick="document.getElementById('signup').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px">Đăng ký</button>
		    		<button class="btn btn-warning" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin: 7.7px">Xin chào <i>Toàn</i></button>
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
            <div class="col-sm-4">
                <a href="" title=""><img class="center-block" src="assets/img/chuyen-con-meo-day-hai-au-bay.jpg" alt="" style="width: 100%; max-width: 150px"/></a>
            </div>

            <div class="col-sm-8">
                <a href="" title=""><h4>Chuyện con mèo dạy hải âu bay</h4></a>
                <p><i>23/5/2018</i></p>
                <p>Nội dung vắn tắt</p>
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-sm-4">
                <a href="" title=""><img class="center-block" src="assets/img/chuyen-con-meo-day-hai-au-bay.jpg" alt="" style="width: 100%; max-width: 150px"/></a>
            </div>

            <div class="col-sm-8">
                <a href="" title=""><h4>Chuyện con mèo dạy hải âu bay</h4></a>
                <p><i>23/5/2018</i></p>
                <p>Nội dung vắn tắt</p>
            </div>
        </div>
    </div>
	<!-- End body -->

	<!-- Start footer -->
	<footer id="footer" class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-wrapper">
                    <div class="col-md-6 col-sm-6 con-xs-12">
                        <div class="footer-brand">
                            <img src="assets/img/HOME.png" alt="logo" />
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="copyright">
                            <p>Made with <i class="fa fa-heart"></i> by <a target="_blank" href="https://www.facebook.com/CanhToan.888"> Cảnh Toàn </a> - <a target="_blank" href="https://www.facebook.com/profile.php?id=100004717664150"> Nhật Trường </a>2018. All rights reserved.</p>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </footer>
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
	
  	<script type="text/javascript" src="assets/js/jquery-3.3.1.js"></script>
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
</body>
</html>