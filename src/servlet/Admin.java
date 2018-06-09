package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.AdminAllData;
import models.AdminInfo;

@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Admin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			Connection c = new DAO().getConnection();
			
			// Lấy số liệu tất cả dữ liệu
			int soluongtaikhoan = 0, taikhoanmoi 	= 0;
			int soluongbaiviet 	= 0, baivietmoi 	= 0;
			int soluongbinhluan = 0, binhluanmoi 	= 0;
			int soluongtruycap 	= 0, truycapmoi 	= 0;
			AdminAllData dulieutonghop = null;
			String sql = "";
			try {
				// 1. Lấy dữ liệu tài khoản
				sql = "select count(*) as soluongtaikhoan from accounts where manguoidung > 0";
				Statement stmt = (Statement) c.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					soluongtaikhoan = rs.getInt(1);
				}
				// Số lượng tài khoản mới
				sql = "select count(*) from users where manguoidung > 0 and thoigiandangky > (date_add(curdate(), interval '-3' day))";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					taikhoanmoi = rs.getInt(1);
				}
				
				// 2. Lấy dữ liệu bài viết
				sql = "select count(*) as soluongbaiviet from posts";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					soluongbaiviet = rs.getInt(1);
				}
				// Số lượng bài viết mới
				sql = "select count(thoigiandangbai) from posts where chapnhan = 0";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					baivietmoi = rs.getInt(1);
				}
				
				// 3. Lấy dữ liệu bình luận
				sql = "select count(*) as soluongbinhluan from comments";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					soluongbinhluan = rs.getInt(1);
				}
				// Số lượng bình luận mới
				sql = "select count(*) from comments where thoigianbinhluan > (date_add(curdate(), interval '-3' day))";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					binhluanmoi = rs.getInt(1);
				}
				
				// 4. Lấy dữ liệu truy cập
				sql = "select sum(luottruycap) as soluongtruycap from accesses";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					soluongtruycap = rs.getInt(1);
				}
				// Số lượng truy cập mới
				sql = "select count(*) from accesses where ngaytruycap > (date_add(curdate(), interval '-3' day))";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					truycapmoi = rs.getInt(1);
				}
				
				// Tổng hợp trong 1 đối tượng
				dulieutonghop = new AdminAllData(soluongtaikhoan, soluongbaiviet, soluongbinhluan, soluongtruycap, taikhoanmoi, baivietmoi, binhluanmoi, truycapmoi);
			} catch (Exception e) {
				throw new ServletException(e);
			}
			
			// Lấy dữ liệu tài khoản admin
			ArrayList<AdminInfo> thongtinadmin = new ArrayList<AdminInfo>();
			int soluongadmin = 0;
			try {
				sql = "select * from admin";
				Statement stmt = (Statement) c.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					thongtinadmin.add(new AdminInfo(rs.getInt("id"), rs.getString("hoten"), rs.getString("tendangnhap"), rs.getString("sodienthoai"), rs.getString("email")));
				}
				sql = "select count(*) from admin";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					soluongadmin = rs.getInt(1);
				}
			} catch (Exception e) {
				throw new ServletException(e);
			}
			
			request.setAttribute("soluongadmin", soluongadmin);
			request.setAttribute("thongtinadmin", thongtinadmin);
			request.setAttribute("dulieutonghop", dulieutonghop);
			request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
		}
		else
			request.getRequestDispatcher("WEB-INF/system.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection c = new DAO().getConnection();
		try {
			String sql = "select hoten, matkhau from admin where tendangnhap = '" + username + "'";
			Statement stmt = (Statement) c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next() && rs.getString("matkhau").equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("name", rs.getString(1));
				session.setAttribute("manguoidung", 0);
				response.sendRedirect("Admin");
			} else request.getRequestDispatcher("/WEB-INF/system.jsp").forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
