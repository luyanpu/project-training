package com.backend.entity;

import java.util.ArrayList;
public class AdminPage {
	private ArrayList<BackUser> list=new ArrayList<BackUser>();
	private int thisPage=0;
	private int countPage=1;
	public AdminPage() {}
	public AdminPage(int thisPage) {
		super();
		this.thisPage = thisPage;
	}
	public ArrayList<BackUser> getList() {
		return list;
	}
	public void setList(ArrayList<BackUser> list) {
		this.list = list;
	}
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
}
