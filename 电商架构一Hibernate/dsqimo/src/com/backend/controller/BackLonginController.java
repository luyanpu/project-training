package com.backend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.backend.entity.BackUser;
import com.backend.service.BackLoginServiceImpl;

@Controller
public class BackLonginController {

	@Resource
	private BackLoginServiceImpl backLoginServiceImpl;
	@PostMapping("/backlogin")
	public String login(BackUser bu,HttpSession session) {
		
		BackUser user=this.backLoginServiceImpl.findByNameOrPassword(bu);
		if(user!=null) {
			session.setAttribute("backUser", user);
			return "redirect:/admin-index.jsp";
		}else {
			return "redirect:/loginFailed.jsp";
		}
		
	}
	@GetMapping("/adminCancel")
	public String amminCancel(HttpSession session) {
		session.setAttribute("backUser",null);
		return "redirect:admin-login.html";
	}
}
