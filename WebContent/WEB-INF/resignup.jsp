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
	<title>Đăng ký tài khoản</title>
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
		    		<button onclick="document.getElementById('signin').style.display='block'" class="btn btn-primary" type="button" style="margin: 7.7px 0;">Đăng nhập</button>
		    	</div>
    		</div>
  		</div>
	</nav>
	<!-- End menu -->
	<center><div class="alert alert-danger"><i>*Đăng ký tài khoản thất bại, có thể tên đăng nhập đã tồn tại!</i></div></center>
	<!-- Start sign up box -->
	<jsp:include page="signup.jsp" flush="true"/>
	<!-- End sign up box -->
	
	<!-- Start footer -->
		<jsp:include page="footer.jsp"/>
    <!-- End footer -->
    
    <!-- Start sign in box -->
	<div id="signin" class="ctmodal" data-spy="affix" data-offset-top="-1">
		<jsp:include page="login.jsp"/>
	</div>
	<!-- End sign in box -->
    
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="assets/js/hipster-cards.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="assets/js/bootstrap3-typeahead.js"></script>
	<script type="text/javascript" src="assets/js/autocomplete.js"></script>
	
	<script type="text/javascript">
	    $(document).ready(function(){
	        $("#taotaikhoan").attr('disabled','disabled');
	    });
    </script>
	
</body>
</html>