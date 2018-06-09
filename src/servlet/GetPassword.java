package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;

@WebServlet("/GetPassword")
public class GetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/getpassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
	    
		String tendangnhap = request.getParameter("tendangnhap");
		String email = request.getParameter("email");
		
		Connection c = new DAO().getConnection();
		
		try {
			String sql = "select tendangnhap, users.manguoidung from accounts, users where accounts.manguoidung = users.manguoidung and tendangnhap = '" + tendangnhap + "' and email = '" + email + "'";
			Statement stmt = (Statement) c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			// Cập nhật lại mật khẩu và chuyển về trang trước
			if (rs.next()) {
				sql = "update accounts set matkhau = '123' where tendangnhap = '" + tendangnhap + "'";
				PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
				pstmt.executeUpdate();
				
				session.setAttribute("laymatkhauthanhcong", "");
				session.setAttribute("manguoidung", rs.getInt(2));
				session.setAttribute("username", rs.getString(1));
				
				if (session.getAttribute("url") != null) {
					response.sendRedirect("Login");
				} else {
					response.sendRedirect("Home");
				}
			}
			else {
				session.setAttribute("saithongtin", "");
				response.sendRedirect("GetPassword");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
