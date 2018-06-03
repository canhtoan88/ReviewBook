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
import models.HomePosts;

@WebServlet("/Found")
public class Found extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Found() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noidungtimkiem = request.getParameter("noidungtimkiem");
		
		Connection c = new DAO().getConnection();
		ArrayList<HomePosts> thongtintimkiem = new ArrayList<>();
		int soluongketqua = 0;
		if (noidungtimkiem.equals("")) {
			request.getSession().setAttribute("timkiemrong", "");
		} else {
			try {
				String sql = "select * from posts where tieude like '%" + noidungtimkiem + "%' order by thoigiandangbai desc";
				Statement stmt = (Statement) c.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) {
					thongtintimkiem.add(new HomePosts(rs.getInt(1), rs.getInt(3), rs.getString(2), rs.getString(5), rs.getDate(7), rs.getString(4)));
				}
				sql = "select count(*) from posts where tieude like '%" + noidungtimkiem + "%'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					soluongketqua = rs.getInt(1);
				}
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		request.setAttribute("noidungdatimkiem", noidungtimkiem);
		request.setAttribute("thongtintimkiem", thongtintimkiem);
		request.setAttribute("soluongketqua", soluongketqua);
		request.getRequestDispatcher("/WEB-INF/found.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
