package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;

@WebServlet("/EditComment")
public class EditComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mabinhluan = Integer.parseInt(request.getParameter("mabinhluan"));
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int matheloai = Integer.parseInt(request.getParameter("matheloai"));
		
		// Truy xuất nội dung bình luận từ mã bình luận
		Connection c = new DAO().getConnection();
		try {
			String sql = "select noidungbinhluan from comments where mabinhluan = " + mabinhluan;
			Statement stmt = (Statement) c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String noidungbinhluan = rs.getString(1);
				request.getSession().setAttribute("noidungbinhluan", noidungbinhluan);
				request.getSession().setAttribute("editmabinhluan", mabinhluan);
				response.sendRedirect("Reading?mabaiviet=" + mabaiviet + "&matheloai=" + matheloai + "#comment" + mabinhluan);
			} 
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int mabinhluan = Integer.parseInt(request.getParameter("mabinhluan"));
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int matheloai = Integer.parseInt(request.getParameter("matheloai"));
		String noidungbinhluan = request.getParameter("noidungbinhluan");
		
		Connection c = new DAO().getConnection();
		try {
			String sql = "update comments set noidungbinhluan = '" + noidungbinhluan + "' where mabinhluan = " + mabinhluan;
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			request.getSession().setAttribute("chinhsuabinhluan", "");
			response.sendRedirect("Reading?mabaiviet=" + mabaiviet + "&matheloai=" + matheloai + "#comment" + mabinhluan);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
