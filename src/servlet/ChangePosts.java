package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.TopicPosts;

@WebServlet("/ChangePosts")
public class ChangePosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePosts() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		Connection c = new DAO().getConnection();
		TopicPosts thongtinchinhsua = null;
		try {
			// Kiểm tra bài viết có đang trong trạng thái chờ duyệt chỉnh sửa không
			String sql = "select * from posts_edit where trangthai = 0 and mabaiviet = " + mabaiviet;
			Statement stmt = (Statement) c.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				request.getSession().setAttribute("dachinhsua", "");
				response.sendRedirect("PostsManage");
			} else {
				// Get date from posts to set into change posts
				sql = "select * from posts, categories where posts.matheloai = categories.matheloai and mabaiviet = " + mabaiviet;
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					thongtinchinhsua = new TopicPosts(mabaiviet, rs.getInt("matheloai"), rs.getString("tieude"), rs.getString("noidungvantat"), rs.getString("duongdanhinhanh"), rs.getString("noidungbaiviet"), rs.getString("tentheloai"));
				}
				request.setAttribute("thongtinchinhsua", thongtinchinhsua);
				request.getRequestDispatcher("/WEB-INF/changeposts.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int mabaiviet = Integer.parseInt(request.getParameter("mabaiviet"));
		String tieude = "";
		String noidungvantat = "";
		String noidungbaiviet = "";
		
		ServletFileUpload upload = new ServletFileUpload();
		try {
			FileItemIterator itr = upload.getItemIterator(request);
			while (itr.hasNext()) {
				FileItemStream item = itr.next();
				if (item.isFormField()) {
					String fileName = item.getFieldName();
					InputStream is = item.openStream();
					byte[] b = new byte[is.available()];
					is.read(b);
					String value = new String(b);
					if (fileName.equals("tieude")) {
						tieude = value;
					}
					else if (fileName.equals("noidungvantat")) {
						noidungvantat = value;
					}
					else {
						noidungbaiviet = value;
					}
				} 
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		Connection c = new DAO().getConnection();
		try {
			// Update posts_edit table
			String sql = "insert into posts_edit values (" + mabaiviet + ", '" + tieude + "', '" + noidungvantat + "', '" + noidungbaiviet + "', curdate(), 0)";
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
			
			// Set thông báo tới admin
			sql = "insert into notifies (mabaiviet, noidungthongbao, thoigianthongbao, trangthai) values (" + mabaiviet + ", 'Bài viết " + mabaiviet + " đã chỉnh sửa', curdate(), 0)";
			pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		request.getSession().setAttribute("chinhsuaok", "");
		response.sendRedirect("PostsManage");
	}

}
