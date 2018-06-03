package models;

import java.util.Date;

public class PostsData {
	private int maBaiViet;
	private String tieuDe;
	Date thoiGianDangBai;
	private String noiDungBaiViet;
	
	public PostsData(int maBaiViet, String tieuDe, Date thoiGianDangBai, String noiDungBaiViet) {
		super();
		this.maBaiViet = maBaiViet;
		this.tieuDe = tieuDe;
		this.thoiGianDangBai = thoiGianDangBai;
		this.noiDungBaiViet = noiDungBaiViet;
	}
	
	public int getMaBaiViet() {
		return maBaiViet;
	}

	public void setMaBaiViet(int maBaiViet) {
		this.maBaiViet = maBaiViet;
	}

	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	public Date getThoiGianDangBai() {
		return thoiGianDangBai;
	}
	public void setThoiGianDangBai(Date thoiGianDangBai) {
		this.thoiGianDangBai = thoiGianDangBai;
	}
	public String getNoiDungBaiViet() {
		return noiDungBaiViet;
	}
	public void setNoiDungBaiViet(String noiDungBaiViet) {
		this.noiDungBaiViet = noiDungBaiViet;
	}
}
