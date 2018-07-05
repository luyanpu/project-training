package com.frontend.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.frontend.entity.User;
import com.frontend.service.LoginServiceImpl;
import com.frontend.service.RegistServiceImpl;

@Controller
@RequestMapping(value="/loginAction")
public class LoginController {
	@Resource 
	private RegistServiceImpl registServiceImpl;
	@Resource 
	private LoginServiceImpl loginServiceImpl;
	@PostMapping("/a")
	public String loginByLoginHtml(User u,HttpServletRequest request) {
		//if用户名和密码都正确，且通过登录
		User user=this.loginServiceImpl.loginByNameAndPass(u);
		if(user!=null && user.getState()==1) {
			//将这个用户存入session中
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			return "redirect:/indexshow";//重定向到showController控制器,/代表项目根目录
		}else {
			return "redirect:/loginFailed.jsp";
		}

	}
	@GetMapping("/b")
	public String loginByMail(HttpServletRequest request) {
		//@PathVariable int id,
		//修改这个用户的属性值
		int id=Integer.parseInt(request.getParameter("id"));
		this.registServiceImpl.editState(id);
		//查询这个人的信息
		User u=this.loginServiceImpl.loginFindById(id);
		HttpSession session=request.getSession();
		//将这个用户存入session中
		session.setAttribute("user",u);
		return "userSpace";//跳转到个人中心页面，添加用户图片信息 代表项目的根目录
	}
	@GetMapping("/c")
	public String loginCancell(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.setAttribute("user",null);
		return "redirect:/indexshow";
	}
}
