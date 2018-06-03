package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import connect.DAO;
import models.FileUpload;

@WebServlet("/Writing")
public class Writing extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Writing() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("username");
		if (username != null)
			request.getRequestDispatcher("/WEB-INF/writing.jsp").forward(request, response);
		else response.sendRedirect("Home");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Định dạng kiểu gõ unicode
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();
	    
	    // Kiểm tra người viết bài là ai, nếu người dùng thì set chapnhan = false --> bài viết chưa được đăng
	    boolean chapnhan 	= true;
	    int manguoidung = (int) session.getAttribute("manguoidung");
	    System.out.println(manguoidung);
		if (manguoidung > 0) {
			chapnhan = false;
		}
		
		// Set mã bài viết
		int mabaiviet 	= 1;
		Connection c 	= new DAO().getConnection(); 
		try {
			String sql 		= "select max(mabaiviet) as maxmabaiviet from posts";
			Statement stmt 	= (Statement) c.createStatement();
			ResultSet rs	= stmt.executeQuery(sql);
			if (rs.next()) {
				mabaiviet 	= rs.getInt("maxmabaiviet") + 1; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Lấy dữ liệu người dùng nhập vào
		String tieude 			= "";
		int matheloai			= 0;
		String duongdanhinhanh	= "";
		String noidungvantat 	= "";
		String noidungbaiviet	= "";
		String url = "";
		
		// Kiểm tra dữ liệu là hình ảnh thì lưu vào thư mục
		boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
		if (isMultiPart) {
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
						else if (fileName.equals("matheloai")) {
							matheloai = Integer.parseInt(value);
						}
						else if (fileName.equals("noidungvantat")) {
							noidungvantat = value;
						}
						else if (fileName.equals("url3")) {
							url = value;
							System.out.println(url);
						}
						else {
							noidungbaiviet = value;
						}
					} else {
						String path = "F:\\Workspace-Spring\\ReviewBook\\WebContent\\assets\\img-save";
						
						// Lấy đuôi của file ảnh
						String fileName = item.getName();
						int viTriChamCuoi = fileName.lastIndexOf(".");
						String fileNameSave = mabaiviet + fileName.substring(viTriChamCuoi);//Dựa vào mã bài viết
						if (FileUpload.processFile(path, item, fileNameSave)) {
							// Lưu đường dẫn file ảnh
							duongdanhinhanh = "assets/img-save/" + fileNameSave;
						}
						else {
							// Do nothing
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
		
		// Lưu thông tin vào bảng posts
		try {
			// Update posts table
			String sql = "insert into posts values (" + mabaiviet + ", '" + tieude + "', " + matheloai + ", '" + duongdanhinhanh + "', '" + noidungvantat + "', '" + noidungbaiviet + "', curdate(), 0, " + chapnhan + ")";
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		// Lưu thông tin vào bảng posts_user ?? Khi được Admin chấp nhận
		try {
			// Update posts_user table
			String sql = "insert into posts_user values (" + mabaiviet + ", " + manguoidung + ")";
			PreparedStatement pstmt = (PreparedStatement) c.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		if (manguoidung > 0) {
			session.setAttribute("guibaithanhcong", "");
		} else session.setAttribute("dangbaithanhcong", "");
		
		response.sendRedirect(url);
	}

}
