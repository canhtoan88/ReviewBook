package models;

import java.util.Date;

public class CommentPosts {
	private int maBinhLuan;
	private int maNguoiDung;
	private String hoTen;
	private Date thoiGianBinhLuan;
	private String noiDungBinhLuan;
	
	public CommentPosts(int maBinhLuan, int maNguoiDung, String hoTen, Date thoiGianBinhLuan, String noiDungBinhLuan) {
		super();
		this.maBinhLuan = maBinhLuan;
		this.maNguoiDung = maNguoiDung;
		this.hoTen = hoTen;
		this.thoiGianBinhLuan = thoiGianBinhLuan;
		this.noiDungBinhLuan = noiDungBinhLuan;
	}
	
	public int getMaBinhLuan() {
		return maBinhLuan;
	}

	public void setMaBinhLuan(int maBinhLuan) {
		this.maBinhLuan = maBinhLuan;
	}

	public int getMaNguoiDung() {
		return maNguoiDung;
	}
	public void setMaNguoiDung(int maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public Date getThoiGianBinhLuan() {
		return thoiGianBinhLuan;
	}
	public void setThoiGianBinhLuan(Date thoiGianBinhLuan) {
		this.thoiGianBinhLuan = thoiGianBinhLuan;
	}
	public String getNoiDungBinhLuan() {
		return noiDungBinhLuan;
	}
	public void setNoiDungBinhLuan(String noiDungBinhLuan) {
		this.noiDungBinhLuan = noiDungBinhLuan;
	}
	
}
