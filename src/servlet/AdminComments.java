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
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.CommentPosts;

@WebServlet("/AdminComments")
public class AdminComments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminComments() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		int soluongbinhluan = 0;
		ArrayList<CommentPosts> thongtinbinhluan = new ArrayList<>();
		
		try {
			String sql 		= "select * from comments, users where users.manguoidung = comments.manguoidung";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				String noidungbinhluan = rs.getString("noidungbinhluan");
				if (noidungbinhluan.length() > 40) {
					noidungbinhluan = noidungbinhluan.substring(0, 37) + "...";
				}
				thongtinbinhluan.add(new CommentPosts(rs.getInt("mabinhluan"), rs.getInt("manguoidung"), rs.getString("hoten"), rs.getDate("thoigianbinhluan"), noidungbinhluan));
			}
			sql = "select count(*) from comments";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				soluongbinhluan = rs.getInt(1);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.setAttribute("thongtinbinhluan", thongtinbinhluan);
		request.setAttribute("soluongbinhluan", soluongbinhluan);
		request.getRequestDispatcher("/WEB-INF/admin_comments.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mabinhluan = Integer.parseInt(request.getParameter("mabinhluan"));
		
		Connection c = new DAO().getConnection();
		try {
			// Update accounts table
			String sql = "delete from comments where mabinhluan = " + mabinhluan;
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		response.sendRedirect("AdminComments");
	}

}
