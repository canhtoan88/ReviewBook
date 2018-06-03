package models;

import java.util.Date;

public class HighlightPosts {
	private int maBaiViet;
	private int maTheLoai;
	private String tieuDe;
	private Date thoiGianDangBai;
	private int luotXem;
	private String duongDanHinhAnh;
	private String tenTheLoai;
	private boolean trangThai;
	
	public HighlightPosts(int maBaiViet, int maTheLoai, String tenTheLoai, String tieuDe, Date thoiGianDangBai, int luotXem, boolean trangThai) {
		super();
		this.maBaiViet = maBaiViet;
		this.maTheLoai = maTheLoai;
		this.tenTheLoai = tenTheLoai;
		this.tieuDe = tieuDe;
		this.thoiGianDangBai = thoiGianDangBai;
		this.luotXem = luotXem;
		this.trangThai = trangThai;
	}

	public HighlightPosts(int maBaiViet, int maTheLoai, String tieuDe, Date thoiGianDangBai, int luotXem, String duongDanHinhAnh) {
		super();
		this.maBaiViet = maBaiViet;
		this.maTheLoai = maTheLoai;
		this.tieuDe = tieuDe;
		this.thoiGianDangBai = thoiGianDangBai;
		this.luotXem = luotXem;
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
	public Date getThoiGianDangBai() {
		return thoiGianDangBai;
	}
	public void setThoiGianDangBai(Date thoiGianDangBai) {
		this.thoiGianDangBai = thoiGianDangBai;
	}
	public int getLuotXem() {
		return luotXem;
	}
	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}

	public String getDuongDanHinhAnh() {
		return duongDanHinhAnh;
	}

	public void setDuongDanHinhAnh(String duongDanHinhAnh) {
		this.duongDanHinhAnh = duongDanHinhAnh;
	}

	public String getTenTheLoai() {
		return tenTheLoai;
	}

	public void setTenTheLoai(String tenTheLoai) {
		this.tenTheLoai = tenTheLoai;
	}

	public boolean getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
}
