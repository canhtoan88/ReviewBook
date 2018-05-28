<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Quản lý bài viết</title>
</head>
<body>
	<div class="modal-dialog">
    
      <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Danh sách bài viết</h4>
            </div>
            <div class="modal-body">
                <table id="example" class="display" style="width:100%">
					<thead>
						<tr>
							<th>Tiêu đề</th>
			                <th>Thể loại</th>
			                <th>Thời gian đăng</th>
			                <th>Lượt xem</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>Tiger Nixon</td>
			                <td>System Architect</td>
			                <td>Edinburgh</td>
			                <td>61</td>
						</tr>
					</tbody>
				</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
      
    </div>
	
	<script type="text/javascript">
		$(document).ready(function() {
    		$('#example').DataTable();
		});
	</script>
	
</body>
</html>