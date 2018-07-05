package com.frontend.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import com.frontend.entity.CartItem;


@Entity
@Table(name="cart")
public class Cart {
	
	private int id;
	private int userid;
	private Set<CartItem> cartItemSet = new HashSet<CartItem>();
	@Id
    @GeneratedValue(generator="cid")
    @GenericGenerator(name = "cid", strategy = "native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="userid")
	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	@OneToMany(mappedBy="cart", targetEntity=CartItem.class)
	public Set<CartItem> getCartItemSet() {
		return cartItemSet;
	}

	public void setCartItemSet(Set<CartItem> cartItemSet) {
		this.cartItemSet = cartItemSet;
	}


	
	
	
}