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
import models.UserProfile;

@WebServlet("/AdminAccounts")
public class AdminAccounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminAccounts() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		ArrayList<UserProfile> thongtinnguoidung = new ArrayList<UserProfile>();
		int soluongtaikhoan = 0;
		try {
			String sql 		= "select * from accounts, users where accounts.manguoidung = users.manguoidung";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				thongtinnguoidung.add(new UserProfile(rs.getInt("manguoidung"), rs.getString("tendangnhap"), rs.getString("hoten"), rs.getDate("thoigiandangky")));
			}
			sql = "select count(*) as soluongtaikhoan from accounts";
			rs	= stmt.executeQuery(sql);
			if (rs.next()) {
				soluongtaikhoan = rs.getInt("soluongtaikhoan");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		request.setAttribute("soluongtaikhoan", soluongtaikhoan);
		request.setAttribute("thongtinnguoidung", thongtinnguoidung);
		request.getRequestDispatcher("/WEB-INF/admin_accounts.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		int manguoidung = Integer.parseInt(request.getParameter("manguoidung"));
		try {
			String sql 		= "delete from users where manguoidung = " + manguoidung;
			((PreparedStatement) c.prepareStatement(sql)).executeUpdate();
			sql = "delete from accounts where manguoidung = " + manguoidung;
			((PreparedStatement) c.prepareStatement(sql)).executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("AdminAccounts");
	}

}
