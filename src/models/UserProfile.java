package models;

import java.util.Date;

public class UserProfile {
	private String tenDangNhap;
	private String hoTen;
	private boolean gioiTinh;
	private String email;
	private Date thoiGianDangKy;
	private int soLuongBaiViet;
	private String matKhau;
	private int maNguoiDung;
	
	public UserProfile(int maNguoiDung, String tenDangNhap, String hoTen, Date thoiGianDangKy) {
		super();
		this.maNguoiDung = maNguoiDung;
		this.tenDangNhap = tenDangNhap;
		this.hoTen = hoTen;
		this.thoiGianDangKy = thoiGianDangKy;
	}

	public UserProfile(String hoTen, boolean gioiTinh, String email, Date thoiGianDangKy, int soLuongBaiViet, String matKhau, int maNguoiDung) {
		super();
		this.hoTen = hoTen;
		this.gioiTinh = gioiTinh;
		this.email = email;
		this.thoiGianDangKy = thoiGianDangKy;
		this.soLuongBaiViet = soLuongBaiViet;
		this.matKhau = matKhau;
		this.maNguoiDung = maNguoiDung;
	}
	
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public boolean isGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getThoiGianDangKy() {
		return thoiGianDangKy;
	}
	public void setThoiGianDangKy(Date thoiGianDangKy) {
		this.thoiGianDangKy = thoiGianDangKy;
	}
	public int getSoLuongBaiViet() {
		return soLuongBaiViet;
	}
	public void setSoLuongBaiViet(int soLuongBaiViet) {
		this.soLuongBaiViet = soLuongBaiViet;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public int getMaNguoiDung() {
		return maNguoiDung;
	}
	public void setMaNguoiDung(int maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}
}
