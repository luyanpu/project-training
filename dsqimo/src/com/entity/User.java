package com.entity;

import java.util.HashSet;
import java.util.Set;

public class User {
	
	private int id;
	private String name;
	private String password;
	private String email;
	private int state;
	private Set<Order> orderSet = new HashSet<Order>();
	public User() {
	}
	
	public User(String name, String password, String email,int state) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Set<Order> getOrderSet() {
		return orderSet;
	}

	public void setOrderSet(Set<Order> orderSet) {
		this.orderSet = orderSet;
	}
	
	
}
