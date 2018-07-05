package com.entity;

import java.util.HashSet;
import java.util.Set;

public class ProductType {


	private int id;
	private String name;
	private Set<Product> proSet=new HashSet<Product>();
	
	public ProductType() {
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
	
	public Set<Product> getProSet() {
			return proSet;
		}
	public void setProSet(Set<Product> proSet) {
			this.proSet = proSet;
		}

}
