<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<title>Thông tin</title>
</head>
<body onload="thongbao()">
	<div class="modal-dialog">
    
      <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thông tin tài khoản</h4>
            </div>
            <div class="modal-body">
                <form action="EditProfile" method='post' class="form-horizontal" id='thongtin-form'>
                	<input type="hidden" id="url2" name="url2" required/>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Tên đăng nhập:</label>
                        <div class="col-sm-5">
                            <label class="control-label col-sm-6"><i>${username}</i></label>
                        </div>
                        <div class="col-sm-3">
                        	<label><a href="Logout"><i><span style="color: orange">Đăng xuất</span></i></a></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Họ và Tên:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id='hoten' name='hoten' value='${thongtinnguoidung.getHoTen()}'/>
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
                            <c:if test="${thongtinnguoidung.isGioiTinh()==true}">
                                <select class="form-control" id="gioitinh" name="gioitinh" required style="margin: 7px 0">
                                    <option value="1">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </c:if>
                            <c:if test="${thongtinnguoidung.isGioiTinh()==false}">
                                <select class="form-control" id="gioitinh" name="gioitinh" required style="margin: 7px 0">
                                    <option value="0">Nữ</option>
                                    <option value="1">Nam</option>
                                </select>
                            </c:if>
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
                            <input type="text" class="form-control" id='email' name='email' value='${thongtinnguoidung.getEmail()}'/>
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
                            <input type="password" class="form-control" id='matkhau' name='matkhau' value='${thongtinnguoidung.getMatKhau()}'/>
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
                            <label class="control-label"><a href="PostsManage"><i>${thongtinnguoidung.getSoLuongBaiViet()}</i></a></label>
                        </div>
                        <div class="col-sm-3">
                        	<a href="Writing" class="btn btn-primary">Viết bài</a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
      
    </div>
    
    <script type="text/javascript">
		/* document.getElementById("url").innerHTML = window.location.href; */
		$(document).ready(function () {
        	$("#url2").val(window.location.href);
		});
	</script>
	
    <script type="text/javascript">
	    $(document).ready(function(){
	        $("#hoten").attr('disabled','disabled');
	        $("#email").attr('disabled','disabled');
	        $("#matkhau").attr('disabled','disabled');
	        $("#gioitinh").attr('disabled','disabled');
	        $("#idhoten").attr('disabled','disabled');
	        $("#idemail").attr('disabled','disabled');
	        $("#idmatkhau").attr('disabled','disabled');
	        $("#idgioitinh").attr('disabled','disabled');
	        
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
		        $("#email").attr('disabled','disabled');
		        $("#matkhau").attr('disabled','disabled');
		        $("#gioitinh").attr('disabled','disabled');
		        $("#idemail").attr('disabled','disabled');
		        $("#idmatkhau").attr('disabled','disabled');
		        $("#idgioitinh").attr('disabled','disabled');
		        $("#savegioitinh").hide();
		        $("#savemk").hide();
		        $("#saveemail").hide();
		        $("#csmatkhau").show();
		        $("#csgioitinh").show();
		        $("#csemail").show();
	            $("#cshoten").hide();
	            $("#savehoten").show();
	        });
	        $("#csgioitinh").click(function(){
	            $("#gioitinh").removeAttr('disabled');
	            $("#idgioitinh").removeAttr('disabled');
	            $("#hoten").attr('disabled','disabled');
		        $("#email").attr('disabled','disabled');
		        $("#matkhau").attr('disabled','disabled');
		        $("#idhoten").attr('disabled','disabled');
		        $("#idemail").attr('disabled','disabled');
		        $("#idmatkhau").attr('disabled','disabled');
		        $("#savehoten").hide();
		        $("#savemk").hide();
		        $("#saveemail").hide();
		        $("#csmatkhau").show();
		        $("#csemail").show();
		        $("#cshoten").show();
	            $("#csgioitinh").hide();
	            $("#savegioitinh").show();
	        });
	        $("#csemail").click(function(){
	            $("#email").removeAttr('disabled');
	            $("#idemail").removeAttr('disabled');
	            $("#hoten").attr('disabled','disabled');
		        $("#matkhau").attr('disabled','disabled');
		        $("#gioitinh").attr('disabled','disabled');
		        $("#idhoten").attr('disabled','disabled');
		        $("#idmatkhau").attr('disabled','disabled');
		        $("#idgioitinh").attr('disabled','disabled');
		        $("#savehoten").hide();
		        $("#savegioitinh").hide();
		        $("#savemk").hide();
		        $("#csmatkhau").show();
		        $("#csgioitinh").show();
		        $("#cshoten").show();
	            $("#csemail").hide();
	            $("#saveemail").show();
	        });
	        $("#csmatkhau").click(function(){
	            $("#matkhau").removeAttr('disabled');
	            $("#idmatkhau").removeAttr('disabled');
	            $("#hoten").attr('disabled','disabled');
		        $("#email").attr('disabled','disabled');
		        $("#gioitinh").attr('disabled','disabled');
		        $("#idhoten").attr('disabled','disabled');
		        $("#idemail").attr('disabled','disabled');
		        $("#idgioitinh").attr('disabled','disabled');
		        $("#savehoten").hide();
		        $("#savegioitinh").hide();
		        $("#saveemail").hide();
		        $("#csgioitinh").show();
		        $("#cshoten").show();
		        $("#csemail").show();
	            $("#csmatkhau").hide();
	            $("#savemk").show();
	        });
	    });
    </script>
    	
	<c:if test="${dangnhapthanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Đăng nhập thành công!")
			}
		</script>
		<%
			session.removeAttribute("dangnhapthanhcong");
		%>
	</c:if>	
	<c:if test="${dangkythanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Đăng ký tài khoản thành công!")
			}
		</script>
		<%
			session.removeAttribute("dangkythanhcong");
		%>
	</c:if>
	<c:if test="${chinhsuathanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Thông tin đã được lưu thành công!!")
			}
		</script>
		<%
			session.removeAttribute("chinhsuathanhcong");
		%>
	</c:if>
	<c:if test="${laymatkhauthanhcong != null}">
		<script type="text/javascript">
			function thongbao() {
				alert("Lấy lại mật khẩu thành công!! Mật khẩu là 123. Vui lòng đổi lại mật khẩu trong phần thông tin!")
			}
		</script>
		<%
			session.removeAttribute("laymatkhauthanhcong");
		%>
	</c:if>
</body>
</html>