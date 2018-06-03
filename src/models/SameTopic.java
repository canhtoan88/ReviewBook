package models;

public class SameTopic {
	private int maBaiViet;
	private int maTheLoai;
	private String duongDanHinhAnh;
	private String tieuDe;

	public SameTopic(int maBaiViet, int maTheLoai, String duongDanHinhAnh, String tieuDe) {
		super();
		this.maTheLoai = maTheLoai;
		this.maBaiViet = maBaiViet;
		this.duongDanHinhAnh = duongDanHinhAnh;
		this.tieuDe = tieuDe;
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

	public String getDuongDanHinhAnh() {
		return duongDanHinhAnh;
	}
	public void setDuongDanHinhAnh(String duongDanHinhAnh) {
		this.duongDanHinhAnh = duongDanHinhAnh;
	}
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
}
