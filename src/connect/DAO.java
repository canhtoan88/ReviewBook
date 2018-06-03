package connect;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;
public class DAO {
	public Connection getConnection() {
		Connection c = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/reviewsach?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8", "root", "canhtoan88");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
}
