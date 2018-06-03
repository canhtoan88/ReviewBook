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
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.TopicPosts;

@WebServlet("/Topic")
public class Topic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Topic() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int matheloai = Integer.parseInt(request.getParameter("matheloai"));
		ArrayList<TopicPosts> baiviettheochude = new ArrayList<TopicPosts>();
		// Xử lý lấy dữ liệu
		Connection c = new DAO().getConnection();
		try {
			String sql 		= "select * from posts where chapnhan = 1 and matheloai = " + matheloai + " order by thoigiandangbai desc limit 30";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				baiviettheochude.add(new TopicPosts(rs.getInt("mabaiviet"), rs.getString("tieude"), rs.getDate("thoigiandangbai"), rs.getString("noidungvantat"), rs.getString("duongdanhinhanh")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("matheloai", matheloai);
		request.setAttribute("baiviettheochude", baiviettheochude);
		request.getRequestDispatcher("WEB-INF/topic.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
