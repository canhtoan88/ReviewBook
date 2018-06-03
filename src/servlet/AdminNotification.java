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
import models.AdminNotify;
import models.TopicPosts;

@WebServlet("/AdminNotification")
public class AdminNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNotification() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		ArrayList<AdminNotify> thongtinthongbao = new ArrayList<>();
		TopicPosts thongtinchinhsua = null;
		int soluongthongbao = 0;
		try {
			String sql 		= "select * from notifies, posts_edit where notifies.mabaiviet = posts_edit.mabaiviet order by notifies.trangthai asc, mathongbao asc";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				thongtinthongbao.add(new AdminNotify(rs.getInt("mathongbao"), rs.getInt("mabaiviet"), rs.getString("noidungthongbao"), rs.getDate("thoigianthongbao"), rs.getInt("posts_edit.trangthai"), rs.getBoolean("notifies.trangthai")));
			}
			sql = "select count(*) from notifies where trangthai = 0";
			rs	= stmt.executeQuery(sql);
			if (rs.next()) {
				soluongthongbao = rs.getInt(1);
			}
			
			if (request.getParameter("mabaiviet") != null) {
				int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
				sql = "select * from posts, categories, posts_edit where posts_edit.mabaiviet = posts.mabaiviet and posts.matheloai = categories.matheloai and trangthai = 0 and posts_edit.mabaiviet = " + mabaiviet;
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					thongtinchinhsua = new TopicPosts(mabaiviet, rs.getInt("matheloai"), rs.getString("posts_edit.tieude"), rs.getString("posts_edit.noidungvantat"), rs.getString("duongdanhinhanh"), rs.getString("posts_edit.noidungbaiviet"), rs.getString("tentheloai"));
				}
				request.setAttribute("thongtinchinhsua", thongtinchinhsua);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("soluongthongbao", soluongthongbao);
		request.setAttribute("thongtinthongbao", thongtinthongbao);
		request.getRequestDispatcher("/WEB-INF/admin_notifies.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
