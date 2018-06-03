package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import connect.DAO;

@WebServlet("/AddAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Connection c = new DAO().getConnection();
		try {
			// Delete admin's accounts from admin's table
			String sql = "delete from admin where id = " + id;
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		response.sendRedirect("Admin");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String hoten = request.getParameter("hoten");
		String tendangnhap = request.getParameter("tendangnhap");
		String matkhau = request.getParameter("matkhau");
		String sodienthoai = request.getParameter("sodienthoai");
		String email = request.getParameter("email");
		
		Connection c = new DAO().getConnection();
		try {
			// Update accounts table
			String sql = "insert into admin (hoten, tendangnhap, matkhau, sodienthoai, email) value ('" + hoten + "', '" + tendangnhap + "', '" + matkhau + "', '" + sodienthoai + "', '" + email + "')";
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		response.sendRedirect("Admin");
	}

}
