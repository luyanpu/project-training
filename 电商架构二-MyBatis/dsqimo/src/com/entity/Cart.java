package com.entity;

import java.util.HashSet;
import java.util.Set;
import com.entity.CartItem;



public class Cart {
	
	private int id;
	private int userid;
	private Set<CartItem> cartItemSet = new HashSet<CartItem>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Set<CartItem> getCartItemSet() {
		return cartItemSet;
	}

	public void setCartItemSet(Set<CartItem> cartItemSet) {
		this.cartItemSet = cartItemSet;
	}


	
	
	
}