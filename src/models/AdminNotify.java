package models;

import java.util.Date;

public class AdminNotify {
	private int maThongBao;
	private int maBaiViet;
	private String noiDungThongBao;
	private Date thoiGianThongBao;
	private int trangThaiChinhSua;
	private boolean trangThai;
	
	public AdminNotify(int maThongBao, int maBaiViet, String noiDungThongBao, Date thoiGianThongBao, int trangThaiChinhSua, boolean trangThai) {
		super();
		this.maThongBao = maThongBao;
		this.maBaiViet = maBaiViet;
		this.noiDungThongBao = noiDungThongBao;
		this.thoiGianThongBao = thoiGianThongBao;
		this.trangThaiChinhSua = trangThaiChinhSua;
		this.trangThai = trangThai;
	}
	public int getMaThongBao() {
		return maThongBao;
	}
	public void setMaThongBao(int maThongBao) {
		this.maThongBao = maThongBao;
	}
	public int getMaBaiViet() {
		return maBaiViet;
	}
	public void setMaBaiViet(int maBaiViet) {
		this.maBaiViet = maBaiViet;
	}
	public String getNoiDungThongBao() {
		return noiDungThongBao;
	}
	public void setNoiDungThongBao(String noiDungThongBao) {
		this.noiDungThongBao = noiDungThongBao;
	}
	public Date getThoiGianThongBao() {
		return thoiGianThongBao;
	}
	public void setThoiGianThongBao(Date thoiGianThongBao) {
		this.thoiGianThongBao = thoiGianThongBao;
	}
	public int getTrangThaiChinhSua() {
		return trangThaiChinhSua;
	}
	public void setTrangThaiChinhSua(int trangThaiChinhSua) {
		this.trangThaiChinhSua = trangThaiChinhSua;
	}
	public boolean isTrangThai() {
		return trangThai;
	}
	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
}
