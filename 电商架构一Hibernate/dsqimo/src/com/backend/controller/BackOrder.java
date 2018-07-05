package com.backend.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.backend.service.BackOrderServiceImpl;
import com.frontend.entity.Order;

@Controller
public class BackOrder {

	@Resource
	private BackOrderServiceImpl bost;
	@GetMapping("/orderlist")
	public String orderAllList(HttpServletRequest request) {
		List<Order>list=this.bost.findAllOrder();
		request.setAttribute("orderlist", list);
		return "admin-order-list";
	}
	@GetMapping("/oneorderlist")
	public String orderList(Order o,HttpServletRequest request) {
		List<Order> list=this.bost.findOrderByName(o.getName());
		request.setAttribute("oneorder", list);
		return "admin-order-one";
	}
}
