package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.UserProfile;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username 	= (String) session.getAttribute("username");
		if (username != null) {
			
			// Trả về trang trước
			String url = (String) session.getAttribute("url");
			session.removeAttribute("url");
			
			// Truy xuất thông tin người dùng rồi trả về trang chủ
			Connection c = new DAO().getConnection();
			String sql = "";
			try {
				sql = "select * from users, accounts where accounts.manguoidung = users.manguoidung and accounts.tendangnhap = '" + username + "'";
				Statement stmt = (Statement) c.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					String hoten 		= rs.getString("hoten");
					Boolean gioitinh 	= rs.getBoolean("gioitinh");
					String email 		= rs.getString("email");
					Date thoigiandangky = rs.getDate("thoigiandangky");
					String matkhau 		= rs.getString("matkhau");
					int manguoidung		= rs.getInt("manguoidung");
					int soluongbaiviet 	= 0;
					sql = "select count(*) as soluongbaiviet from posts_user where manguoidung = " + manguoidung;
					rs = stmt.executeQuery(sql);
					if (rs.next()) {
						soluongbaiviet = rs.getInt("soluongbaiviet");
					}
					
					UserProfile thongtinnguoidung = new UserProfile(hoten, gioitinh, email, thoigiandangky, soluongbaiviet, matkhau, manguoidung);
					session.setAttribute("thongtinnguoidung", thongtinnguoidung);
					response.sendRedirect(url); // Có thể sửa lại trở về trang đã click vào đăng nhập hoặc đăng ký tài khoản
				}
			} catch (Exception e) {
				throw new ServletException(e);
			}
			
		} else response.sendRedirect("Home");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");

		if (remember != null) {
			String username_holder = username;
			String password_holder = password;
			session.setAttribute("username_holder", username_holder);
			session.setAttribute("password_holder", password_holder);
			session.setAttribute("checked", "");
		} else {
			session.setAttribute("username_holder", "");
			session.setAttribute("password_holder", "");
			session.setAttribute("checked", null);
		}
		
		// Kiểm tra tính đúng đắn của tài khoản rồi trả về kết quả tương ứng
		
		Connection c = new DAO().getConnection();
		String sql = "";
		
		// Kiểm tra tên tài khoản
		try {
			sql = "select manguoidung, matkhau from accounts where tendangnhap = '" + username + "'";
			Statement stmt = (Statement) c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			String url = request.getParameter("url");
			
			if (!url.equals("http://localhost:8080/ReviewBook/Login") && !url.equals("http://localhost:8080/ReviewBook/GetPassword") && !url.equals("http://localhost:8080/ReviewBook/Signup")) {
				session.setAttribute("url", url);
			}
		
			if (rs.next() && rs.getString("matkhau").equals(password)) {
				session.setAttribute("username", username);
				session.setAttribute("manguoidung", rs.getInt("manguoidung"));
				session.setAttribute("dangnhapthanhcong", "");
		
				response.sendRedirect("Login");
			} else {
				if (remember != null) {
					session.setAttribute("username_holder", "");
					session.setAttribute("password_holder", "");
				}
					
				request.getRequestDispatcher("/WEB-INF/relogin.jsp").forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
