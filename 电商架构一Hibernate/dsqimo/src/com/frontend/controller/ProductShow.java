package com.frontend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.backend.entity.ProductType;
import com.frontend.service.ProductServiceImpl;

@Controller
public class ProductShow {

	@Resource
	private ProductServiceImpl ps;
	
	@GetMapping("/indexshow")
	public String indexShow(HttpServletRequest request) {//查询商品然后在index.jsp展示数据
		this.ps.indexShow(request);
		return "/index";
	}
	@PostMapping("/search")
	public String searchPro(ProductType p,HttpServletRequest request) {//p里面存的是typeid
		//查询并进行分页，有点乱 因为分页和查询弄在了一起 乱
		System.out.println(p.getId());
		this.ps.findProByTypeId(p.getId(),request);
		return "/index";
	}
}
