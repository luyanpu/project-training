package com.entity;

import java.util.HashSet;
import java.util.Set;
import com.entity.ProductType;



public class Product {

	private  int id;
	private String name;
	private double price;
	private double salePrice;
	private int count;
	private Set<ProductType> proTypeSet=new HashSet<ProductType>();
	public Product() {
		
	}
	public Product(String name, double price, double salePrice,int count) {
		super();
		this.name = name;
		this.price = price;
		this.salePrice = salePrice;
		this.count=count;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}
	public int getCount() {
		
		return this.count;
	}
	public void setCount(int count) {
		this.count=count;
	}
	
	public Set<ProductType> getProTypeSet() {
		return proTypeSet;
	}
	public void setProTypeSet(Set<ProductType> proTypeSet) {
		this.proTypeSet = proTypeSet;
	}
}
