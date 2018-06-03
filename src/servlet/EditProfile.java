package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import connect.DAO;

@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditProfile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Định dạng kiểu gõ unicode
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
	    String tendangnhap = (String) session.getAttribute("username");
	    String key = request.getParameter("name");
	    // Kết nối CSDL
		Connection c = new DAO().getConnection();
		
	    if (key.equals("gioitinh")) {
	    	int gioitinh = Integer.parseInt(request.getParameter(key));
	    	try {
		    	String sql = "update accounts, users set gioitinh = " + gioitinh + " where accounts.manguoidung = users.manguoidung and tendangnhap = '" + tendangnhap + "'";
				PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
	    }
	    else {
	    	try {
	    		String value = request.getParameter(key);
		    	String sql = "update accounts, users set " + key + " = '" + value + "' where accounts.manguoidung = users.manguoidung and tendangnhap = '" + tendangnhap + "'";
				PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
	    }
	    
	    String url = request.getParameter("url2");
		session.setAttribute("url", url);
		
		session.setAttribute("chinhsuathanhcong", "");
		
	    response.sendRedirect("Login");
	}

}
