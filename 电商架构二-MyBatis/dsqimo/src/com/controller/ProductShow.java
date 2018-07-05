package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.service.ProductServiceImpl;

@Controller
public class ProductShow {

	@Resource
	private ProductServiceImpl ps;
	
	@GetMapping("/indexshow")
	public String indexShow(HttpServletRequest request) {//查询商品然后在index.jsp展示数据
		this.ps.indexShow(request);
		return "/index";
	}
}
