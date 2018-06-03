package models;

import java.util.Date;

public class TopicPosts {
	private int maBaiViet;
	private int maTheLoai;
	private String tieuDe;
	private Date thoiGianDangBai;
	private String noiDungVanTat;
	private String duongDanHinhAnh;
	private int luotXem;
	private String hoTen;
	private boolean chapnhan;
	private String noidungbaiviet;
	private String tentheloai;
	
	public TopicPosts(int maBaiViet, int maTheLoai, String tieuDe, String noiDungVanTat, String duongDanHinhAnh,
			String noidungbaiviet, String tentheloai) {
		super();
		this.maBaiViet = maBaiViet;
		this.maTheLoai = maTheLoai;
		this.tieuDe = tieuDe;
		this.noiDungVanTat = noiDungVanTat;
		this.duongDanHinhAnh = duongDanHinhAnh;
		this.noidungbaiviet = noidungbaiviet;
		this.tentheloai = tentheloai;
	}

	public TopicPosts(int maBaiViet, int maTheLoai, String tieuDe, Date thoiGianDangBai, int luotXem, String hoTen, boolean chapnhan, String tentheloai) {
		super();
		this.maBaiViet = maBaiViet;
		this.maTheLoai = maTheLoai;
		this.tieuDe = tieuDe;
		this.thoiGianDangBai = thoiGianDangBai;
		this.luotXem = luotXem;
		this.hoTen = hoTen;
		this.chapnhan = chapnhan;
		this.tentheloai = tentheloai;
	}

	public TopicPosts(int maBaiViet, String tieuDe, Date thoiGianDangBai, String noiDungVanTat, String duongDanHinhAnh) {
		super();
		this.maBaiViet = maBaiViet;
		this.tieuDe = tieuDe;
		this.thoiGianDangBai = thoiGianDangBai;
		this.noiDungVanTat = noiDungVanTat;
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
	public String getNoiDungVanTat() {
		return noiDungVanTat;
	}
	public void setNoiDungVanTat(String noiDungVanTat) {
		this.noiDungVanTat = noiDungVanTat;
	}
	public String getDuongDanHinhAnh() {
		return duongDanHinhAnh;
	}
	public void setDuongDanHinhAnh(String duongDanHinhAnh) {
		this.duongDanHinhAnh = duongDanHinhAnh;
	}

	public int getLuotXem() {
		return luotXem;
	}

	public void setLuotXem(int luotXem) {
		this.luotXem = luotXem;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public boolean isChapnhan() {
		return chapnhan;
	}

	public void setChapnhan(boolean chapnhan) {
		this.chapnhan = chapnhan;
	}

	public String getNoidungbaiviet() {
		return noidungbaiviet;
	}

	public void setNoidungbaiviet(String noidungbaiviet) {
		this.noidungbaiviet = noidungbaiviet;
	}

	public String getTentheloai() {
		return tentheloai;
	}

	public void setTentheloai(String tentheloai) {
		this.tentheloai = tentheloai;
	}
}
