package com.frontend.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.frontend.dao.CartDaoImpl;
import com.frontend.entity.Cart;
import com.frontend.entity.CartItem;
import com.frontend.entity.Product;
import com.frontend.entity.User;
import com.frontend.service.CartServiceImpl;
@Controller
public class OrderAndCartController {
	@Resource
	private CartServiceImpl cartServiceImpl;
	@Resource
	private CartDaoImpl cartDaoImpl;
	@GetMapping("/checkOut")
	public String checkOut(HttpSession session,HttpServletRequest request) {
		User u=(User)session.getAttribute("user");
		List<CartItem> list=this.cartServiceImpl.checkOut(u.getId(),session);
		request.setAttribute("cartitem", list);
		return "checkout";
	}
	@GetMapping("/delct")
	public String delCartItem(Product p,HttpSession session) {
		User user=(User)session.getAttribute("user");
		Cart cart=this.cartServiceImpl.findCartByUserId(user.getId());
		this.cartServiceImpl.deleteCartItem(p.getId(),cart.getId());
		return "redirect:/checkOut";
	}
	@PostMapping("/delsct")
	public String delCartItemByK(HttpServletRequest request) {
		String []k=request.getParameterValues("buyid");
		this.cartServiceImpl.deleteCartItemByk(k, request);
		return "redirect:/checkOut";
	}
}
