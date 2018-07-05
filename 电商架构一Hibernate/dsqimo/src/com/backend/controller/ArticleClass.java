package com.backend.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.backend.entity.ProductType;
import com.backend.service.AtricleClassServiceImpl;

@Controller

public class ArticleClass {

	@Resource
	private AtricleClassServiceImpl articleClassServiceImpl;
	
	@GetMapping("/articleClass")
	public String articleClass(HttpServletRequest request) {
		List<ProductType> list=this.articleClassServiceImpl.articleClass();
		request.setAttribute("producttypelist",list);
		return "admin-article-class";
	}
	@PostMapping("/articleClassAdd")
	public String articleClassAdd(ProductType pt) {
		this.articleClassServiceImpl.articleClassAdd(pt);
		return "redirect:/articleClass";
	}
	
	@PostMapping("/articleClassDeleteAll")
	public String articleClassDeleteAll(HttpServletRequest request) {
		
		String[] id=request.getParameterValues("check");
		this.articleClassServiceImpl.articleClassDeleteAll(id);
		return "redirect:/articleClass";
	}
}
