package models;

import java.sql.Time;
import java.util.Date;

public class AdminAccess {
	private int maTruyCap;
	private String cookie;
	private Date ngayTruyCap;
	private Time thoiGianTruyCap;
	private int luotTruyCap;
	
	public AdminAccess(int maTruyCap, String cookie, Date ngayTruyCap, Time thoiGianTruyCap, int luotTruyCap) {
		super();
		this.maTruyCap = maTruyCap;
		this.cookie = cookie;
		this.ngayTruyCap = ngayTruyCap;
		this.thoiGianTruyCap = thoiGianTruyCap;
		this.luotTruyCap = luotTruyCap;
	}
	public int getMaTruyCap() {
		return maTruyCap;
	}
	public void setMaTruyCap(int maTruyCap) {
		this.maTruyCap = maTruyCap;
	}
	public String getCookie() {
		return cookie;
	}
	public void setCookie(String cookie) {
		this.cookie = cookie;
	}
	public Date getNgayTruyCap() {
		return ngayTruyCap;
	}
	public void setNgayTruyCap(Date ngayTruyCap) {
		this.ngayTruyCap = ngayTruyCap;
	}
	public Time getThoiGianTruyCap() {
		return thoiGianTruyCap;
	}
	public void setThoiGianTruyCap(Time thoiGianTruyCap) {
		this.thoiGianTruyCap = thoiGianTruyCap;
	}
	public int getLuotTruyCap() {
		return luotTruyCap;
	}
	public void setLuotTruyCap(int luotTruyCap) {
		this.luotTruyCap = luotTruyCap;
	}
}
