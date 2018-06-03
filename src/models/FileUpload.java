package models;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.tomcat.util.http.fileupload.FileItemStream;

public class FileUpload {
	public static boolean processFile(String path, FileItemStream item, String fileNameSave) {
		try {
			File file = new File(path + File.separator);
			if (!file.exists()) {
				file.mkdirs();
			}
			File savedFile = new File(file.getAbsolutePath() + File.separator + fileNameSave);
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x = 0;
			byte[] b = new byte[1024];
			while ((x=is.read(b)) != -1) {
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
}
