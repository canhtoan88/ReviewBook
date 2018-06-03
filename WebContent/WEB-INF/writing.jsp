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
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
  	<script type="text/javascript" src="assets/js/jquery-3.3.1.js"></script>
	<title>Viết bài</title>
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
    			<jsp:include page="menu.jsp"/>
		    	<jsp:include page="foundmenu.jsp"/>
		    	<div class="center-block">
			    	<button class="btn btn-warning" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#profile" style="margin: 7.7px">Xin chào <i>${username}</i></button>
		    	</div>
    		</div>
  		</div>
	</nav>
	<!-- End menu -->
	
	<!-- Start body -->
	<div class="container">
		<jsp:include page="editor.jsp" />
	</div>
	<!-- End body -->
	
	<!-- Start view profile -->
	<div class="modal fade" id="profile" role="dialog">
		<jsp:include page="profile.jsp"/>
	</div>
	<!-- End view profile -->
	
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
    
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="assets/js/hipster-cards.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="assets/js/bootstrap3-typeahead.js"></script>
	<script type="text/javascript" src="assets/js/autocomplete.js"></script>
	
</body>
</html>