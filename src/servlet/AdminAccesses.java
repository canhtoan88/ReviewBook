package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.AdminAccess;

@WebServlet("/AdminAccesses")
public class AdminAccesses extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAccesses() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection c = new DAO().getConnection();
		int soluongtruycap = 0;
		ArrayList<AdminAccess> thongtintruycap = new ArrayList<>();
		
		try {
			String sql 		= "select * from accesses order by ngaytruycap desc";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			while (rs.next()) {
				thongtintruycap.add(new AdminAccess(rs.getInt("id"), rs.getString("cookie"), rs.getDate("ngaytruycap"), rs.getTime("thoigiantruycap"), rs.getInt("luottruycap")));
			}
			sql = "select sum(luottruycap) from accesses";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				soluongtruycap = rs.getInt(1);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		request.setAttribute("thongtintruycap", thongtintruycap);
		request.setAttribute("soluongtruycap", soluongtruycap);
		request.getRequestDispatcher("/WEB-INF/admin_accesses.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
