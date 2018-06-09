package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.HighlightPosts;
import models.HomePosts;
import models.ListHomePosts;

@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Home() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection c = new DAO().getConnection();
		
		// Lấy giữ liệu bài viết nổi bật
		ArrayList<HighlightPosts> baivietnoibat = new ArrayList<HighlightPosts>(); 
		try {
			String sql 		= "select * from posts where chapnhan = 1 order by luotxem desc, thoigiandangbai asc limit 10";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				String tieude = rs.getString("tieude");
				if (tieude.length() > 30) {
					tieude = tieude.substring(0, 27) + "...";
				}
				baivietnoibat.add(new HighlightPosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), tieude, rs.getDate("thoigiandangbai"), rs.getInt("luotxem"), rs.getString("duongdanhinhanh")));
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		// Lấy dữ liệu bài viết theo chủ đề
		ArrayList<HomePosts> baivietmoinhat = new ArrayList<>();
		// Có 4 chủ đề nên chạy 4 lần - số lần chạy thứ i đại diện cho thể loại i
		for (int i = 1; i <= 4; i++) {
			try {
				String sql 		= "select * from posts where chapnhan = 1 and matheloai = " + i + " order by mabaiviet desc limit 1";
				Statement stmt 	= (Statement) c.createStatement();
				ResultSet rs	= stmt.executeQuery(sql);
				if (rs.next()) {
					String tieude = rs.getString("tieude");
					if (tieude.length() > 33) {
						tieude = tieude.substring(0, 27) + "...";
					}
					String noidungvantat = rs.getString("noidungvantat");
					if (noidungvantat.length() > 40) {
						noidungvantat = noidungvantat.substring(0, 35) + "...";
					}
					baivietmoinhat.add(new HomePosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), tieude, noidungvantat, rs.getDate("thoigiandangbai"), rs.getString("duongdanhinhanh")));
				}
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		// Những bài viết mới tiếp theo theo từng chủ đề
		ArrayList<ListHomePosts> dsbaiviettieptheo = new ArrayList<>();
		for (int i = 1; i <= 4; i++) {
			ArrayList<HomePosts> baiviettieptheotungchude = new ArrayList<>();
			try {
				String sql 		= "select * from posts where matheloai = " + i + " and mabaiviet < (select mabaiviet from posts where matheloai = " + i + " order by mabaiviet desc limit 1) order by mabaiviet desc limit 4";
				Statement stmt 	= (Statement) c.createStatement();
				ResultSet rs	= stmt.executeQuery(sql);
				while (rs.next()) {
					String tieude = rs.getString("tieude");
					if (tieude.length() > 33) {
						tieude = tieude.substring(0, 27) + "...";
					}
					String noidungvantat = rs.getString("noidungvantat");
					if (noidungvantat.length() > 40) {
						noidungvantat = noidungvantat.substring(0, 35) + "...";
					}
					baiviettieptheotungchude.add(new HomePosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), tieude, noidungvantat, rs.getDate("thoigiandangbai"), rs.getString("duongdanhinhanh")));
				}
				dsbaiviettieptheo.add(new ListHomePosts(baiviettieptheotungchude, i));
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		// Quản lý truy cập
		if (request.getCookies() != null) {
			Cookie[] cookie = request.getCookies();
			for (Cookie ck : cookie) {
				try {
					String sql 		= "select thoigiantruycap, id from accesses where ngaytruycap = curdate() and cookie = '" + ck.getValue() + "'";
					Statement stmt 	= (Statement) c.createStatement();
					ResultSet rs	= stmt.executeQuery(sql);
					if (rs.next()) {
						int id = rs.getInt(2);
						sql = "select luottruycap from accesses where id = " + id + " and time_to_sec(TIMEDIFF(curtime(), '" + rs.getTime(1) + "')) > 1800";
						rs	= stmt.executeQuery(sql);
						if (rs.next()) {
							sql = "update accesses set luottruycap = " + (rs.getInt(1) + 1) + ", thoigiantruycap = curtime() where id = " + id;
							PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
							pstmt.executeUpdate();
						}
					} else {
						sql = "insert into accesses (cookie, ngaytruycap, thoigiantruycap, luottruycap) values ('" + ck.getValue() + "', curdate(), curtime(), 1)";
						PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
						pstmt.executeUpdate();
					}
				} catch (Exception e) {
					throw new ServletException(e);
				}
			}
		} else response.sendRedirect("Home");
		
		session.setAttribute("baivietmoinhat", baivietmoinhat);
		session.setAttribute("dsbaiviettieptheo", dsbaiviettieptheo);
		session.setAttribute("baivietnoibat", baivietnoibat);
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
