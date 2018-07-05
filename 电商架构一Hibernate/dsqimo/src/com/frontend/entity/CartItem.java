package com.frontend.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="cartitem")
public class CartItem {
	
	private int id;
	private int proid;
	private String name;
	private int count;
	private double total;
	private Cart cart;
	@Id
    @GeneratedValue(generator="ciid")
    @GenericGenerator(name = "ciid", strategy = "native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="proid")
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="total")
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public void setCount(int count) {
		this.count=count;
	}
	@Column(name="count")
	public int getCount() {
		return this.count;
	}
	@ManyToOne
    @JoinColumn(name="cartid")
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
