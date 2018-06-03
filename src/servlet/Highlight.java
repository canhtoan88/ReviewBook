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
import models.HighlightPosts;

@WebServlet("/Highlight")
public class Highlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Highlight() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		ArrayList<HighlightPosts> baivietnoibat = new ArrayList<HighlightPosts>(); 
		try {
			int mabaiviet = (int)request.getAttribute("mabaiviet");
			String sql 		= "select * from posts where mabaiviet <> " + mabaiviet + " order by luotxem desc, thoigiandangbai asc limit 10";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				baivietnoibat.add(new HighlightPosts(rs.getInt("mabaiviet"), rs.getInt("matheloai"), rs.getString("tieude"), rs.getDate("thoigiandangbai"), rs.getInt("luotxem"), rs.getString("duongdanhinhanh")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String back = (String) request.getAttribute("back");
		request.getRequestDispatcher(back).include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
