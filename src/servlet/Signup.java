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


@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Signup() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/resignup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Định dạng kiểu gõ unicode
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		int manguoidung = 0;
		
		// Lấy thông tin người dùng nhập vào
		String tendangnhap	= request.getParameter("tendangnhap");
		
		// Kết nối CSDL
		Connection c = new DAO().getConnection();
		String sql = "";
		
		// Kiểm tra tên tài khoản có tồn tại không
		try {
			String SQL = "select count(*) as sotaikhoan from accounts where tendangnhap = '" + tendangnhap + "'";
			Statement STMT = (Statement) c.createStatement();
			ResultSet RS = STMT.executeQuery(SQL);
			
			// Lưu lại url cả khi đăng ký sai
			String url = request.getParameter("url4");
			if (!url.equals("http://localhost:8080/ReviewBook/Signup") && !url.equals("http://localhost:8080/ReviewBook/GetPassword") && !url.equals("http://localhost:8080/ReviewBook/Signup")) {
				session.setAttribute("url", url);
			}
			
			// So sánh tendangnhap với từng tài khoản
			if (RS.next() && RS.getInt("sotaikhoan") > 0) {
				response.sendRedirect("Signup");
			}
			else {
				String matkhau		= request.getParameter("matkhau");
				String hoten 		= request.getParameter("hoten");
				int gioitinh 		= Integer.parseInt(request.getParameter("gioitinh"));
				String email		= request.getParameter("email");
				
				// Lấy mã người dùng lớn nhất
				try {
					sql = "select max(manguoidung) as maxmanguoidung from accounts";
					Statement stmt = (Statement) c.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					if (rs.next()) {
						manguoidung = rs.getInt("maxmanguoidung") + 1;
					}
				} catch (Exception e) {
					throw new ServletException(e);
				}
				
				// Lưu  thông tin đăng nhập vào bảng CSDL
				try {
					// Update accounts table
					sql = "insert into accounts values (" + manguoidung + ", '" + tendangnhap + "', '" + matkhau + "')";
					PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
					pstmt.executeUpdate();
				} catch (Exception e) {
					throw new ServletException(e);
				}
				try {
					// Update users table
					sql = "insert into users (manguoidung, hoten, gioitinh, email, thoigiandangky) values (" + manguoidung + ", '" + hoten + "', " + gioitinh + ", '" + email + "', curdate())";
					PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
					pstmt = (PreparedStatement) c.prepareStatement(sql);
					pstmt.executeUpdate();
				} catch (Exception e) {
					throw new ServletException(e);
				}
				
				session.setAttribute("dangkythanhcong", "");// Khi đăng ký thành công
				session.setAttribute("manguoidung", manguoidung);
				session.setAttribute("username", tendangnhap);
				
				response.sendRedirect("Login");
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
