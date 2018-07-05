package com.backend.service;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.backend.dao.BackUserManagerDaoImpl;
import com.backend.entity.AdminPage;
import com.backend.entity.BackUser;
import com.backend.entity.UserPage;
import com.frontend.entity.User;

@Service
@Transactional
public class BackUserManagerService {

	@Resource
	private BackUserManagerDaoImpl bsmdi;
	
	public void userShow(HttpServletRequest request) {
		//return this.backUserManagerDaoImpl.selectUser();
		//数字6代表每页最多显示6条数据
				Object thisnum=request.getParameter("pagenumber");
				int num=1;//现在的页数
				if(thisnum==null || thisnum.equals("")) {
					//查询第1页,每页显示6个
					UserPage pp=new UserPage(num);//初始化当前页码和每页的商品个数
					List<User> list=bsmdi.findProByPage((num-1)*6,6);//数据库的分页查询
					request.setAttribute("userlist", list);//产品的list
					request.setAttribute("count", bsmdi.countUser());//产品的总数
					request.setAttribute("countPage", bsmdi.countUserPage(6,pp));//产品的总页面
					request.setAttribute("thispage", pp.getThisPage());//当前是第几页
				}else {
					num=new Integer(thisnum.toString());
					UserPage pp=new UserPage(num);
					if(num<=0 || num> (this.bsmdi.countUserPage(6,pp))) {
						num=1;//现在的页数
						pp.setThisPage(num);//如果页码超了范围则默认为1
					}
					//查询第num页，每页显示6个
					List<User> list=bsmdi.findProByPage((num-1)*6,6);
					request.setAttribute("userlist", list);
					request.setAttribute("count", bsmdi.countUser());
					request.setAttribute("countPage", bsmdi.countUserPage(6,pp));
					request.setAttribute("thispage", pp.getThisPage());
				}
	}

	public void adminShow(HttpServletRequest request) {
		//return this.backUserManagerDaoImpl.selectUser();
		//数字3代表每页最多显示3条数据
				Object thisnum=request.getParameter("pagenumber");
				int num=1;//现在的页数
				if(thisnum==null || thisnum.equals("")) {
					//查询第1页,每页显示3个
					AdminPage pp=new AdminPage(num);//初始化当前页码和每页的商品个数
					List<BackUser> list=bsmdi.findAdminByPage((num-1)*3,3);//数据库的分页查询
					request.setAttribute("adminlist", list);//产品的list
					request.setAttribute("count", bsmdi.countAdmin());//产品的总数
					request.setAttribute("countPage", bsmdi.countAdminPage(3,pp));//产品的总页面
					request.setAttribute("thispage", pp.getThisPage());//当前是第几页
				}else {
					num=new Integer(thisnum.toString());
					AdminPage pp=new AdminPage(num);
					if(num<=0 || num> (this.bsmdi.countAdminPage(3,pp))) {
						num=1;//现在的页数
						pp.setThisPage(num);//如果页码超了范围则默认为1
					}
					//查询第num页，每页显示6个
					List<BackUser> list=bsmdi.findAdminByPage((num-1)*3,3);
					request.setAttribute("adminlist", list);
					request.setAttribute("count", bsmdi.countAdmin());
					request.setAttribute("countPage", bsmdi.countAdminPage(3,pp));
					request.setAttribute("thispage", pp.getThisPage());
				}
	}
	public void userAdd(User u) {
		this.bsmdi.userAdd(u);
	}

	public void userDelete(User u) {
		this.bsmdi.userDelete(u);
	}

	public void userState(User u) {
		this.bsmdi.userState(u);
	}

	public void userRevise(User u) {
		this.bsmdi.userRevise(u);
	}

	public void userDeleteAll(String [] values) {
		
		this.bsmdi.userDeleteAll(values);
	}

	public void backUserDeleteAll(String[] values) {
		this.bsmdi.backUserDeleteAll(values);
	}

	public void adminAdd(BackUser bu) {
		this.bsmdi.adminAdd(bu);
		
	}

	public User searchUser(String name) {
		return this.bsmdi.searchUser(name);
	}

	public User searchUser(int id) {
		return this.bsmdi.searchUser(id);
	}
}
