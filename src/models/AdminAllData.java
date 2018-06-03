package models;

public class AdminAllData {
	private int soluongtaikhoan;
	private int soluongbaiviet;
	private int soluongbinhluan;
	private int soluongtruycap;
	private int taikhoanmoi;
	private int baivietmoi;
	private int binhluanmoi;
	private int truycapmoi;
	
	public AdminAllData(int soluongtaikhoan, int soluongbaiviet, int soluongbinhluan, int soluongtruycap) {
		super();
		this.soluongtaikhoan = soluongtaikhoan;
		this.soluongbaiviet = soluongbaiviet;
		this.soluongbinhluan = soluongbinhluan;
		this.soluongtruycap = soluongtruycap;
	}

	public AdminAllData(int soluongtaikhoan, int soluongbaiviet, int soluongbinhluan, int soluongtruycap,
			int taikhoanmoi, int baivietmoi, int binhluanmoi, int truycapmoi) {
		super();
		this.soluongtaikhoan = soluongtaikhoan;
		this.soluongbaiviet = soluongbaiviet;
		this.soluongbinhluan = soluongbinhluan;
		this.soluongtruycap = soluongtruycap;
		this.taikhoanmoi = taikhoanmoi;
		this.baivietmoi = baivietmoi;
		this.binhluanmoi = binhluanmoi;
		this.truycapmoi = truycapmoi;
	}
	
	public int getSoluongtaikhoan() {
		return soluongtaikhoan;
	}
	public void setSoluongtaikhoan(int soluongtaikhoan) {
		this.soluongtaikhoan = soluongtaikhoan;
	}
	public int getSoluongbaiviet() {
		return soluongbaiviet;
	}
	public void setSoluongbaiviet(int soluongbaiviet) {
		this.soluongbaiviet = soluongbaiviet;
	}
	public int getSoluongbinhluan() {
		return soluongbinhluan;
	}
	public void setSoluongbinhluan(int soluongbinhluan) {
		this.soluongbinhluan = soluongbinhluan;
	}
	public int getSoluongtruycap() {
		return soluongtruycap;
	}
	public void setSoluongtruycap(int soluongtruycap) {
		this.soluongtruycap = soluongtruycap;
	}
	public int getTaikhoanmoi() {
		return taikhoanmoi;
	}
	public void setTaikhoanmoi(int taikhoanmoi) {
		this.taikhoanmoi = taikhoanmoi;
	}
	public int getBaivietmoi() {
		return baivietmoi;
	}
	public void setBaivietmoi(int baivietmoi) {
		this.baivietmoi = baivietmoi;
	}
	public int getBinhluanmoi() {
		return binhluanmoi;
	}
	public void setBinhluanmoi(int binhluanmoi) {
		this.binhluanmoi = binhluanmoi;
	}
	public int getTruycapmoi() {
		return truycapmoi;
	}
	public void setTruycapmoi(int truycapmoi) {
		this.truycapmoi = truycapmoi;
	}
}
