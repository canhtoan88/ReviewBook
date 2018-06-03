package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import connect.DAO;

@WebServlet("/AdminChangePosts")
public class AdminChangePosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminChangePosts() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Xét duyệt những bài chờ duyệt
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		
		Connection c = new DAO().getConnection();
		try {
			// Update accounts table
			String sql = "update posts set chapnhan = 1 where mabaiviet = " + mabaiviet;
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		request.getSession().setAttribute("thembaiviet", "");
		response.sendRedirect("AdminPosts");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Xóa bài viết
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		
		Connection c = new DAO().getConnection();
		try {
			// Delete posts from posts's table
			String sql = "delete from posts where mabaiviet = " + mabaiviet;
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			// Delete posts from posts_user's table
			sql = "delete from posts_user where mabaiviet = " + mabaiviet;
			pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			// Delete posts from posts_edit's table
			sql = "delete from posts_edit where mabaiviet = " + mabaiviet;
			pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			// Delete posts from comments's table
			sql = "delete from comments where mabaiviet = " + mabaiviet;
			pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.getSession().setAttribute("xoabaivietthanhcong", "");
		int manguoidung = (int) request.getSession().getAttribute("manguoidung");
		if(manguoidung > 0) {
			response.sendRedirect("PostsManage");
		} else {
			request.getSession().setAttribute("xoabaiviet", "");
			response.sendRedirect("AdminPosts");
		}
	}

}
