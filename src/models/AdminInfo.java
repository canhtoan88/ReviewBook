package models;

public class AdminInfo {
	private int id;
	private String hoTen;
	private String tenDangNhap;
	private String soDienThoai;
	private String email;
	
	public AdminInfo(int id, String hoTen, String tenDangNhap, String soDienThoai, String email) {
		super();
		this.id = id;
		this.hoTen = hoTen;
		this.tenDangNhap = tenDangNhap;
		this.soDienThoai = soDienThoai;
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
