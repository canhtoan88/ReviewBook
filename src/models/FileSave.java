package models;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

public class FileSave {
	public void SaveFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
						response.getWriter().println(fileName + ": " + value);
					} else {
						String path = "F:\\Workspace-Spring\\ReviewBook\\WebContent\\assets\\img-save";
						String fileNameSave = "";//Dựa vào mã bài viết
						if (FileUpload.processFile(path, item, fileNameSave)) {
							String fileName = item.getName();
							response.getWriter().println("Successed " + fileName);
						}
						else response.getWriter().println("Failed");
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
	}
}
