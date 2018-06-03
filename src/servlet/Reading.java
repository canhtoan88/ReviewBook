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

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.HighlightPosts;
import models.PostsData;
import models.SameTopic;
import models.CommentPosts;

@WebServlet("/Reading")
public class Reading extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Reading() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int matheloai = Integer.parseInt(request.getParameter("matheloai"));
		int manguoidung = -1;
		if (request.getSession().getAttribute("manguoidung") != null) {
			manguoidung = (int)request.getSession().getAttribute("manguoidung");
		} 
		
		boolean chapnhan = true;
		PostsData thongtinbaiviet = null;
		ArrayList<SameTopic> baivietcungchude = new ArrayList<SameTopic>();
		
		// Lấy dữ liệu bài viết
		Connection c = new DAO().getConnection();
		try {
			String sql 		= "select * from posts where mabaiviet = " + mabaiviet;
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			if (rs.next()) {
				chapnhan = rs.getBoolean("chapnhan");
				thongtinbaiviet = new PostsData(mabaiviet, rs.getString("tieude"), rs.getDate("thoigiandangbai"), rs.getString("noidungbaiviet"));
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		// Truy vấn những bài viết cùng chủ đề
		try {
			String sql 		= "select mabaiviet, matheloai, duongdanhinhanh, tieude from posts where matheloai = " + matheloai + " and chapnhan = 1 and mabaiviet <> " + mabaiviet + " order by thoigiandangbai desc limit 8";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				String tieude = rs.getString("tieude");
				if (tieude.length() > 30) {
					tieude = tieude.substring(0, 30) + "...";
				}
				baivietcungchude.add(new SameTopic(rs.getInt("maBaiViet"), rs.getInt("maTheLoai"), rs.getString("duongdanhinhanh"), tieude));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Truy vấn bài viết nổi bật (nhiều lượt xem nhất)
		ArrayList<HighlightPosts> baivietnoibat = new ArrayList<HighlightPosts>(); 
		try {
			String sql 		= "select * from posts where chapnhan = 1 and mabaiviet <> " + mabaiviet + " order by luotxem desc, thoigiandangbai asc limit 10";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				String tieude = rs.getString("tieude");
				if (tieude.length() > 30) {
					tieude = tieude.substring(0, 27) + "...";
				}
				baivietnoibat.add(new HighlightPosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), tieude, rs.getDate("thoigiandangbai"), rs.getInt("luotxem"), rs.getString("duongdanhinhanh")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Nội dung bình luận
		ArrayList<CommentPosts> thongtinbinhluan = new ArrayList<CommentPosts>();
		int soluongbinhluan = 0;
		try {
			String sql 		= "select * from comments, users where users.manguoidung = comments.manguoidung and mabaiviet = " + mabaiviet;
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				thongtinbinhluan.add(new CommentPosts(rs.getInt("mabinhluan"), rs.getInt("manguoidung"), rs.getString("hoten"), rs.getDate("thoigianbinhluan"), rs.getString("noidungbinhluan")));
			}
			sql = "select count(*) from comments where mabaiviet = " + mabaiviet;
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				soluongbinhluan = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("thongtinbinhluan", thongtinbinhluan);
		request.setAttribute("soluongbinhluan", soluongbinhluan);
		request.setAttribute("matheloai", matheloai);
		request.setAttribute("baivietcungchude", baivietcungchude);
		request.setAttribute("baivietnoibat", baivietnoibat);
		request.setAttribute("thongtinbaiviet", thongtinbaiviet);

		if (chapnhan) {
			// Update lượt xem cho bài viết.
			try {
				String sql 		= "select manguoidung from posts_user where mabaiviet = " + mabaiviet;
				Statement stmt 	= (Statement) c.createStatement();
				ResultSet rs	= stmt.executeQuery(sql);
				if (rs.next() && (rs.getInt("manguoidung") != manguoidung)) {
					try {
						sql = "select luotxem from posts where mabaiviet = " + mabaiviet;
						rs	= stmt.executeQuery(sql);
						int luotxem 	= 0;
						if (rs.next()) {
							 luotxem = rs.getInt("luotxem") + 1;
						}
						sql = "update posts set luotxem = " + luotxem + " where mabaiviet = " + mabaiviet;
						PreparedStatement pstmt 	= (PreparedStatement) c.prepareStatement(sql);
						pstmt.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
			request.getRequestDispatcher("/WEB-INF/reading.jsp").forward(request, response);
		} else {
			if (manguoidung == 0) {
				request.getRequestDispatcher("/WEB-INF/reading.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("Home");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
