package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;

@WebServlet("/AdminNotifies")
public class AdminNotifies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNotifies() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int mathongbao = Integer.parseInt(request.getParameter("mathongbao"));
		Connection c = new DAO().getConnection();
		try {
			// Set trang thái thông báo = 1
			String sql 		= "update notifies set trangthai = 1 where mathongbao = " + mathongbao;
			PreparedStatement pstmt 	= (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			// Thay đổi dữ liệu bài viết
			sql = "select * from posts_edit where trangthai = 0 and mabaiviet = " + mabaiviet;
			Statement stmt = (Statement) c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				sql = "update posts set tieude = '" + rs.getString("tieude") + "', noidungvantat = '" + rs.getString("noidungvantat") + "', noidungbaiviet = '" + rs.getString("noidungbaiviet") + "' where mabaiviet = " + mabaiviet;
				pstmt 	= (PreparedStatement) c.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			
			// Chấp nhận bài viết, set trang thái = 1 --> Đã duyệt
			sql = "update posts_edit set trangthai = 1 where trangthai = 0 and mabaiviet = " + mabaiviet;
			pstmt 	= (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			request.getSession().setAttribute("chapnhanchinhsua", "");
			response.sendRedirect("AdminNotification");
		} catch (Exception e) {
			throw new ServletException(e);
		}
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int mathongbao = Integer.parseInt(request.getParameter("mathongbao"));
		Connection c = new DAO().getConnection();
		try {
			// Set trang thái thông báo = 1
			String sql 		= "update notifies set trangthai = 1 where mathongbao = " + mathongbao;
			PreparedStatement pstmt 	= (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			// Từ chối bài viết, set trang thái = 2 --> Đã từ chối
			sql = "update posts_edit set trangthai = 2 where trangthai = 0 and mabaiviet = " + mabaiviet;
			pstmt 	= (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			request.getSession().setAttribute("tuchoichinhsua", "");
			response.sendRedirect("AdminNotification");
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
