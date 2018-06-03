package models;

import java.util.ArrayList;

public class ListHomePosts {
	private ArrayList<HomePosts> homePosts;
	private int maTheLoai;

	public ListHomePosts(ArrayList<HomePosts> homePosts, int maTheLoai) {
		super();
		this.homePosts = homePosts;
		this.maTheLoai = maTheLoai;
	}

	public ArrayList<HomePosts> getHomePosts() {
		return homePosts;
	}

	public void setHomePosts(ArrayList<HomePosts> homePosts) {
		this.homePosts = homePosts;
	}

	public int getMaTheLoai() {
		return maTheLoai;
	}

	public void setMaTheLoai(int maTheLoai) {
		this.maTheLoai = maTheLoai;
	}
}
