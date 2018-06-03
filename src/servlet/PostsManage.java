package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.HighlightPosts;

@WebServlet("/PostsManage")
public class PostsManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostsManage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		Connection c = new DAO().getConnection();

		if (username != null) {
			int manguoidung = (int) session.getAttribute("manguoidung");
			// Thông tin bài viết người dùng		
			ArrayList<HighlightPosts> baivietnguoidung = new ArrayList<HighlightPosts>();

			try {
				String sql 		= "select * from posts, categories, posts_user where posts.mabaiviet = posts_user.mabaiviet and posts.matheloai = categories.matheloai and manguoidung = " + manguoidung + " order by thoigiandangbai desc";
				Statement stmt 	= (Statement) c.createStatement();
				ResultSet rs	= stmt.executeQuery(sql);
				while (rs.next()) {
					String tieude = rs.getString("tieude");
					if (tieude.length() > 30) {
						tieude = tieude.substring(0, 27) + "...";
					}
					baivietnguoidung.add(new HighlightPosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), rs.getString("tentheloai"), tieude, rs.getDate("thoigiandangbai"), rs.getInt("luotxem"), rs.getBoolean("chapnhan")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("baivietnguoidung", baivietnguoidung);
			request.getRequestDispatcher("/WEB-INF/postsmanage.jsp").forward(request, response);
		} else response.sendRedirect("Home");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
