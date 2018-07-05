package com.frontend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.frontend.entity.Product;
import com.frontend.entity.User;
import com.frontend.service.CartServiceImpl;


@Controller
@RequestMapping(value="/cartAction")
public class CartController {
	@Resource
	private CartServiceImpl cartServiceImpl;
	
	@GetMapping("/add")
	public String addProduct(Product p,HttpSession session) {
		//完成向购物车添加货物的工作
		User u=(User)session.getAttribute("user");
		this.cartServiceImpl.addProduct(p.getId(),u.getId(),session);
		return "redirect:/indexshow";
	}
	
	@PostMapping("/balance")
	public String balance(HttpServletRequest request) {
		String [] k=request.getParameterValues("buyid");
		//进行商品数量的减少,给用户添加订单,并清空购物车
		this.cartServiceImpl.balanceProduct(k,request);
		//跳转到支付成功页面
		return "redirect:/balanceSuccess.jsp";
	
	}
}
