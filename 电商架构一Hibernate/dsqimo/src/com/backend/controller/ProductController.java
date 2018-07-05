package com.backend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.frontend.entity.Product;
import com.frontend.service.ProductServiceImpl;

@Controller
public class ProductController {

	@Resource
	private ProductServiceImpl ps;
	
	@GetMapping("/backProductShow")
	public String backProductShow(HttpServletRequest request) {//查询商品然后展示数据
		this.ps.indexShow(request);
		return "admin-product-list";
	}
	
	@PostMapping("/backProductDeleteAll")
	public String backProductDeleteAll(HttpServletRequest request) {
		String []id=request.getParameterValues("check");
		this.ps.productDeleteAll(id);
		return "redirect:/backProductShow";
	}
	@PostMapping("/productAdd")
	public String backProductAdd(Product p) {
		
		this.ps.productAdd(p);
		return "redirect:/backProductShow";
	}
	@GetMapping("/productRevise")
	public String backProductGetById(Product p,HttpServletRequest request) {//查询单个商品准备，修改
		p=this.ps.productFind(p);
		request.setAttribute("pro", p);
		return "admin-product-revise";
	}
	@PostMapping("/productRevise")
	public String backProductRevise(Product p) {//修改
		this.ps.productRevise(p);
		return "redirect:/backProductShow";
	}
	@GetMapping("/searchProductName")
	public String searchProductName(Product p,HttpServletRequest request) {//查询单个商品准备，修改
		p=this.ps.finByName(p.getName());
		request.setAttribute("thispro", p);
		return "admin-product-one";
	}
}
