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

@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Comment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Xóa comment
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int matheloai = Integer.parseInt(request.getParameter("matheloai"));
		int mabinhluan = Integer.parseInt(request.getParameter("mabinhluan"));
		
		Connection c = new DAO().getConnection();
		try {
			// Update accounts table
			String sql = "delete from comments where mabinhluan = " + mabinhluan;
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.getSession().setAttribute("xoabinhluanthanhcong", "");
		response.sendRedirect("Reading?mabaiviet="+mabaiviet+"&matheloai="+matheloai+"#commentArea");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		int matheloai = Integer.parseInt(request.getParameter("matheloai"));
		int manguoidung = (int) request.getSession().getAttribute("manguoidung");
		String noidungbinhluan = request.getParameter("noidungbinhluan");
		
		// Lưu bình luận
		Connection c = new DAO().getConnection();
		try {
			// Update accounts table
			String sql = "insert into comments (manguoidung, mabaiviet, noidungbinhluan, thoigianbinhluan) values (" + manguoidung + ", " + mabaiviet + ", '" + noidungbinhluan + "', curdate())";
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.getSession().setAttribute("binhluanthanhcong", "");
		response.sendRedirect("Reading?mabaiviet="+mabaiviet+"&matheloai="+matheloai+"#commentArea");
	}

}
