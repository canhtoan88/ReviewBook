<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Thông tin</title>
</head>
<body>
	<div class="modal-dialog">
    
      <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thông tin tài khoản</h4>
            </div>
            <div class="modal-body">
                <form action="thongtin" method='post' class="form-horizontal" id='thongtin-form'>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Tên đăng nhập:</label>
                        <div class="col-sm-5">
                            <label class="control-label col-sm-6"><i>tendangnhap</i></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Họ và Tên:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='hoten' name='hoten' value='${thongtin.getHoTen()}'/>
                            <input type="text" id='idhoten' name='name' value='hoten'/>
                        </div>
                        <div class="col-sm-3">
                            <input type='submit' class="btn btn-primary" id='savehoten' value='Lưu'/>
                            <label id='cshoten'><a><i>Chỉnh sửa</i></a></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Giới tính:</label>
                        <div class="col-sm-5">
                            <%-- <c:if test="${thongtin.getGioiTinh()}"> --%>
                                <select class="form-control" id="gioitinh" name="gioitinh" required style="margin: 7px 0">
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ">Nữ</option>
                                </select>
                            <%-- </c:if>
                            <c:if test="${thongtin.getGioiTinh()==false}">
                                <select class="form-control" name="gender" required style="margin: 7px 0">
                                    <option value="Nữ">Nữ</option>
                                    <option value="Nam">Nam</option>
                                </select>
                            </c:if> --%>
                            <input type="text" id='idgioitinh' name='name' value='gioitinh'/>
                        </div>
                        <div class="col-sm-3">
                            <input type='submit' class="btn btn-primary" id='savegioitinh' value='Lưu'/>
                            <label id='csgioitinh'><a><i>Chỉnh sửa</i></a></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4">Email:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='email' name='email' value='${thongtin.getEmail()}'/>
                            <input type='text' id='idemail' name='name' value='email'/>
                        </div>
                        <div class="col-sm-3">
                            <input type='submit' class="btn btn-primary" id='saveemail' value='Lưu'/>
                            <label id='csemail'><a><i>Chỉnh sửa</i></a></label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="control-label col-sm-4">Mật khẩu:</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id='matkhau' name='matkhau' value='${thongtin.getMatKhau()}'/>
                            <input type='text' id='idmatkhau' name='name' value='matkhau'/>
                        </div>
                        <div class="col-sm-3">
                            <input type='submit' class="btn btn-primary" id='savemk' value='Lưu'/>
                            <label id='csmatkhau'><a><i>Chỉnh sửa</i></a></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Số lượng bài viết:</label>
                        <div class="col-sm-5">
                            <label class="control-label"><a data-toggle="modal" data-target="#listposts"><i>Số lượng bài viết</i></a></label>
                        </div>
                        <div class="col-sm-3">
                        	<a href="writing.jsp" class="btn btn-primary">Viết bài</a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
      
    </div>
    
    <!-- Start view list posts -->
	<div class="modal fade" id="listposts" role="dialog">
		<jsp:include page="postsmanage.jsp"/>
	</div>
	<!-- End view list posts -->
    
    <script type="text/javascript">
	    $(document).ready(function(){
	        $("#hoten").attr('disabled','disabled');
	        $("#email").attr('disabled','disabled');
	        $("#matkhau").attr('disabled','disabled');
	        $("#gioitinh").attr('disabled','disabled');
	        $("#savehoten").hide();
	        $("#savegioitinh").hide();
	        $("#savemk").hide();
	        $("#saveemail").hide();
	        
	        $("#idhoten").hide();
	        $("#idgioitinh").hide();
	        $("#idmatkhau").hide();
	        $("#idemail").hide();
	        
	        $("#cshoten").click(function(){
	            $("#hoten").removeAttr('disabled');
	            $("#idhoten").removeAttr('disabled');
	            $("#cshoten").hide();
	            $("#savehoten").show();
	        });
	        $("#csgioitinh").click(function(){
	            $("#gioitinh").removeAttr('disabled');
	            $("#idgioitinh").removeAttr('disabled');
	            $("#csgioitinh").hide();
	            $("#savegioitinh").show();
	        });
	        $("#csemail").click(function(){
	            $("#email").removeAttr('disabled');
	            $("#idemail").removeAttr('disabled');
	            $("#csemail").hide();
	            $("#saveemail").show();
	        });
	        $("#csmatkhau").click(function(){
	            $("#matkhau").removeAttr('disabled');
	            $("#idmatkhau").removeAttr('disabled');
	            $("#csmatkhau").hide();
	            $("#savemk").show();
	        });
	    });
    </script>
    
</body>
</html>