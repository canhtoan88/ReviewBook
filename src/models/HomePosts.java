package models;

import java.util.Date;

public class HomePosts {
	private int maBaiViet;
	private int maTheLoai;
	private String tieuDe;
	private String noiDungVanTat;
	private Date thoiGianDangBai;
	private String duongDanHinhAnh;
	
	public HomePosts(int maBaiViet, int maTheLoai, String tieuDe, String noiDungVanTat, Date thoiGianDangBai, String duongDanHinhAnh) {
		super();
		this.maBaiViet = maBaiViet;
		this.maTheLoai = maTheLoai;
		this.tieuDe = tieuDe;
		this.noiDungVanTat = noiDungVanTat;
		this.thoiGianDangBai = thoiGianDangBai;
		this.duongDanHinhAnh = duongDanHinhAnh;
	}
	
	public int getMaBaiViet() {
		return maBaiViet;
	}
	public void setMaBaiViet(int maBaiViet) {
		this.maBaiViet = maBaiViet;
	}
	public int getMaTheLoai() {
		return maTheLoai;
	}
	public void setMaTheLoai(int maTheLoai) {
		this.maTheLoai = maTheLoai;
	}
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	public String getNoiDungVanTat() {
		return noiDungVanTat;
	}
	public void setNoiDungVanTat(String noiDungVanTat) {
		this.noiDungVanTat = noiDungVanTat;
	}
	public Date getThoiGianDangBai() {
		return thoiGianDangBai;
	}
	public void setThoiGianDangBai(Date thoiGianDangBai) {
		this.thoiGianDangBai = thoiGianDangBai;
	}

	public String getDuongDanHinhAnh() {
		return duongDanHinhAnh;
	}

	public void setDuongDanHinhAnh(String duongDanHinhAnh) {
		this.duongDanHinhAnh = duongDanHinhAnh;
	}
}
