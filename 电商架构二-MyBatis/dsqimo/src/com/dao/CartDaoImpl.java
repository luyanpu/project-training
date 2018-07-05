package com.dao;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

import com.entity.Cart;
import com.entity.CartItem;
import com.entity.Product;


public interface CartDaoImpl {

	
	public Product findProById(int id);
	public Cart findCartByUserId(int userid);
	public void updatePro(Product p);
	public CartItem findCartItemByCartIdAndProid(int cartid, int proid);
	public CartItem findCartItemById(int id);
	public List<CartItem> findCartItemByCartId(int cartid);
	public void deleteAllCartItem(int cartid);
	public void deleteCartItem(int proid, int cartid);
	public void addCart(Cart c);
	public void updateCartItem(CartItem ci);
	public int firstCartItem(CartItem ci);
	
}
