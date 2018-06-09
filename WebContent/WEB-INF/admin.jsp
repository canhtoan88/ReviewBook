<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="icon" type="image/png" href="assets/img/books.png"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
	<link href="assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
    <link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'/>
	<title>Quản trị hệ thống</title>
</head>
<body>
	<div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="images/sidebar.jpg">
			<div class="logo">
				<a href="Admin" class="simple-text">${name}</a>
				<a href="Admin" class="simple-text" style="font-size: 12px">Adminstrator</a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="active">
						<a href="Admin">
							<i class="material-icons">dashboard</i>
							<p>HOME</p>
						</a>
					</li>
					<li>
						<a href="AdminAccounts">
							<i class="material-icons">person</i>
							<p>Quản lý tài khoản</p>
						</a>
					</li>
					<li>
						<a href="AdminPosts"> 
							<i class="material-icons">content_paste</i>
							<p>Quản lý bài viết</p>
						</a>
					</li>
					<li>
						<a href="AdminComments"> 
							<i class="material-icons">library_books</i>
							<p>Quản lý bình luận</p>
						</a>
					</li>
					<li>
                        <a href="AdminAccesses">
                            <i class="material-icons">bubble_chart</i>
                            <p>Quản lý truy cập</p>
                        </a>
                    </li>
					<li>
						<a href="AdminNotification"> 
							<i class="material-icons text-gray">notifications</i>
							<p>Thông báo</p>
						</a>
					</li>
					<li class="active-pro">
						<a href="AdminWriting"> 
							<i class="material-icons">unarchive</i>
							<p>Viết bài mới</p>
						</a>
					</li>
					<li>
						<a>
							<form action="Logout" method="post">
								<i class="material-icons">logout</i>
								<button type="submit" class="btn btn-primary">Đăng xuất</button> 
							</form>
						</a>
					</li>
				</ul>
			</div>
		</div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Quản trị hệ thống</a>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
                                    <i class="material-icons">store</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Tài khoản</p>
                                    <h3 class="title"><a href="AdminAccounts">${dulieutonghop.getSoluongtaikhoan()}</a></h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">warning</i>
                                        <a href="#">${dulieutonghop.getTaikhoanmoi()} tài khoản mới</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="material-icons">content_copy</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Bài viết</p>
                                    <h3 class="title"><a href="AdminPosts">${dulieutonghop.getSoluongbaiviet()}</a></h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">warning</i>
                                        <a href="#">${dulieutonghop.getBaivietmoi()} bài viết mới</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
                                    <i class="material-icons">info_outline</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Bình luận</p>
                                    <h3 class="title"><a href="AdminComments">${dulieutonghop.getSoluongbinhluan()}</a></h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">warning</i>
                                        <a href="#">${dulieutonghop.getBinhluanmoi()} bình luận mới</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
                                    <i class="fa fa-twitter"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">Lượt truy cập</p>
                                    <h3 class="title"><a href="AdminAccesses">${dulieutonghop.getSoluongtruycap()}</a></h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons text-danger">warning</i>
                                        <a href="#">${dulieutonghop.getTruycapmoi()} lượt mới truy cập</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
			                <div class="fresh-table">
			                    <div class="toolbar">
			                        <button class="btn btn-default" disabled="disabled">Danh sách tài khoản admin: ${soluongadmin}</button>
			                        <a href="#formAddAdmin"><button class="btn btn-default" id="addAdmin">+ Thêm</button></a>
			                    </div>
			                    <table id="fresh-table" class="table">
			                        <thead>
				                        <tr>
				                            <th data-field="id" data-sortable="true">ID</th>
				                        	<th data-field="name" data-sortable="true">Name</th>
				                        	<th data-field="salary" data-sortable="true">Username</th>
				                        	<th data-field="country" data-sortable="true">Number phone</th>
				                        	<th data-field="city" data-sortable="true">Email</th>
				                        	<th data-field="actions">Actions</th>
				                        </tr>
			                        </thead>
			                        <tbody>
			                        <c:forEach items="${thongtinadmin}" var="thongtin">
			                            <tr>
			                            	<td>${thongtin.getId()}</td>
			                            	<td>${thongtin.getHoTen()}</td>
			                            	<td>${thongtin.getTenDangNhap()}</td>
			                            	<td>${thongtin.getSoDienThoai()}</td>
			                            	<td>${thongtin.getEmail()}</td>
			                            	<td>
												<a href="AddAdmin?id=${thongtin.getId()}"><input type='submit' class="btn btn-danger" value='Delete'/></a>
			                            	</td>
			                            </tr>
			                        </c:forEach>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
                    </div>
                    <br />
                    <div class="row">
                    	<div class="col-md-10 col-md-offset-1">
	                    	<!-- form thêm tài khoản admin -->
				            <form id="formAddAdmin" hidden action="AddAdmin" method="post" class="form-horizontal animate">
				            	<legend> Thông tin tài khoản </legend>
				            	<div class="form-group" class='col-md-8 col-md-offset-2'>
									<label class="col-md-4 control-label">Tên đăng nhập</label>
									<div class="col-md-4  inputGroupContainer">
										<input name="tendangnhap" placeholder="Enter username" class="form-control" type="text" required/>
									</div>
								</div>
								<div class="form-group" class='col-md-8 col-md-offset-2'>
									<label class="col-md-4 control-label">Mật khẩu</label>
									<div class="col-md-4  inputGroupContainer">
										<input name="matkhau" placeholder="Enter password" class="form-control" type="text" required/>
									</div>
								</div>
								<div class="form-group" class='col-md-8 col-md-offset-2'>
									<label class="col-md-4 control-label">Họ và Tên</label>
									<div class="col-md-4  inputGroupContainer">
										<input name="hoten" placeholder="Enter fullname" class="form-control" type="text" required/>
									</div>
								</div>
								<div class="form-group" class='col-md-8 col-md-offset-2'>
									<label class="col-md-4 control-label">Số điện thoại</label>
									<div class="col-md-4  inputGroupContainer">
										<input name="sodienthoai" placeholder="Enter numberphone" class="form-control" type="tel" minlength="10" maxlength="11" required/>
									</div>
								</div>
								<div class="form-group" class='col-md-8 col-md-offset-2'>
									<label class="col-md-4 control-label">Email</label>
									<div class="col-md-4  inputGroupContainer">
										<input name="email" placeholder="Enter email" class="form-control" type="email" required/>
									</div>
								</div>
								<div class="form-group" class='col-md-8 col-md-offset-2'>
									<label class="col-md-4 control-label"></label>
									<div class="col-md-2 col-md-offset-1  inputGroupContainer">
										<button type="submit" class="btn btn-success"> Thêm <span class="glyphicon glyphicon-send"></span>
									</button>
									</div>
								</div>
				            </form>
				    	</div>
                    </div>
                </div>
            </div>
            <jsp:include page="admin_footer.jsp"/>
        </div>
    </div>
	
	<script src="assets/js/jquery-3.3.1.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/material.min.js" type="text/javascript"></script>
	<!--  PerfectScrollbar Library -->
	<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
	<!-- Material Dashboard javascript methods -->
	<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
	<script type="text/javascript" src="assets/js/bootstrap-table.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#addAdmin").click(function(){
				$("#formAddAdmin").show();
			});
		});
	</script>
	
	<script type="text/javascript">
        var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;
            
        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar",
    
                showRefresh: true,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                striped: true,
                pageSize: 8,
                pageList: [8,10,25,50,100],
                
                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..." 
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });
            
                        
            
            $(window).resize(function () {
                $table.bootstrapTable('resetView');
            });
    
            
            window.operateEvents = {
                'click .like': function (e, value, row, index) {
                    alert('You click like icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);
                },
                'click .edit': function (e, value, row, index) {
                    alert('You click edit icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);    
                },
                'click .remove': function (e, value, row, index) {
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
            
                }
            };
            
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });
            
    
        function operateFormatter(value, row, index) {
            return [
                '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
                    '<i class="fa fa-heart"></i>',
                '</a>',
                '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        }
    </script>
	
</body>
</html>