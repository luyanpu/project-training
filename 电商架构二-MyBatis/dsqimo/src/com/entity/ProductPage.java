package com.entity;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.entity.Product;

@Component
/**
 * 
 * @author lenovo
 * 每页商品的页码类
 * thispage:当前页码
 * countPage:页码总数
 * list:
 */
public class ProductPage {
	private ArrayList<Product> list=new ArrayList<Product>();
	private int thisPage=0;
	private int countPage=1;
	
	
	public ProductPage() {
		
	}
	public ProductPage(int num) {
		this.thisPage=num;
	}
	public int getThisPage() {
		return this.thisPage;
	}
	public void setThisPage(int num) {
		this.thisPage=num;
	}
	public int setCountPage(int num) {
		return this.countPage=num;
	}
	public int getCountPage() {
		return this.countPage;
	}
	public ArrayList<Product> getList() {
		return list;
	}
	public void setList(ArrayList<Product> list) {
		this.list = list;
	}
	
}
