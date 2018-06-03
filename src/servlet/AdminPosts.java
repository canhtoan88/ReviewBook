package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.TopicPosts;

@WebServlet("/AdminPosts")
public class AdminPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPosts() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		ArrayList<TopicPosts> thongtinbaiviet = new ArrayList<TopicPosts>();
		int soluongbaiviet = 0;
		int soluongchoduyet = 0;
		try {
			String sql 		= "select * from posts, posts_user, users, categories where posts.matheloai = categories.matheloai and posts.mabaiviet = posts_user.mabaiviet and posts_user.manguoidung = users.manguoidung order by chapnhan";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				String tieude = rs.getString("tieude");
				if (tieude.length() > 15) {
					tieude = (tieude.substring(0, 15)).trim() + "...";
				}
				thongtinbaiviet.add(new TopicPosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), tieude, rs.getDate("thoigiandangbai"), rs.getInt("luotxem"),rs.getString("hoten"), rs.getBoolean("chapnhan"), rs.getString("tentheloai")));
			}
			sql = "select count(*) as soluongbaiviet from posts where chapnhan = 1";
			rs	= stmt.executeQuery(sql);
			if (rs.next()) {
				soluongbaiviet = rs.getInt("soluongbaiviet");
			}
			sql = "select count(*) as soluongchoduyet from posts where chapnhan = 0";
			rs	= stmt.executeQuery(sql);
			if (rs.next()) {
				soluongchoduyet = rs.getInt("soluongchoduyet");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.setAttribute("soluongbaiviet", soluongbaiviet);
		request.setAttribute("soluongchoduyet", soluongchoduyet);
		request.setAttribute("thongtinbaiviet", thongtinbaiviet);
		request.getRequestDispatcher("/WEB-INF/admin_posts.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Code = 0 --> xóa, code = 1 --> duyệt
		boolean code = Boolean.parseBoolean(request.getParameter("code"));
		System.out.println(code);
		response.sendRedirect("AdminPosts");
	}

}
