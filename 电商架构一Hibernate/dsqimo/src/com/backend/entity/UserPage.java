package com.backend.entity;

import java.util.ArrayList;
import org.springframework.stereotype.Component;
import com.frontend.entity.User;
@Component
/**
 * 
 * @author lenovo
 * 每页商品的页码类
 * thispage:当前页码
 * countPage:页码总数
 * list:
 */
public class UserPage {
	private ArrayList<User> list=new ArrayList<User>();
	private int thisPage=0;
	private int countPage=1;
	public UserPage() {}
	public UserPage(int thisPage) {
		super();
		this.thisPage = thisPage;
	}
	public ArrayList<User> getList() {
		return list;
	}
	public void setList(ArrayList<User> list) {
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
