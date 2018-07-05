package com.backend.dao;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.backend.entity.AdminPage;
import com.backend.entity.BackUser;
import com.backend.entity.UserPage;
import com.frontend.entity.User;

@Repository
public class BackUserManagerDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	public List<User> findProByPage(int start, int maxNum) {
		Query<User> query=this.sessionFactory.getCurrentSession().createQuery("from User");
		query.setFirstResult(start);
		query.setMaxResults(maxNum);
		return query.list();
	}
	public List<BackUser> findAdminByPage(int start, int maxNum) {
		Query<BackUser> query=this.sessionFactory.getCurrentSession().createQuery("from BackUser");
		query.setFirstResult(start);
		query.setMaxResults(maxNum);
		return query.list();
	}
	/**
	 * 
	 * @return 数据总条数
	 */
	public int countUser() {
		//查询数据表的商品总数
		Query query=this.sessionFactory.getCurrentSession().createQuery("select count(id) from User");
		return new Integer(query.uniqueResult().toString());
	}
	
	public int countAdmin() {
		//查询数据表的商品总数
		Query query=this.sessionFactory.getCurrentSession().createQuery("select count(id) from BackUser");
		return new Integer(query.uniqueResult().toString());
	}
	public int countUserPage(int proNumOfEachPage,UserPage pp) {
		 	int i=countUser();
			if(i%proNumOfEachPage==0) {
				pp.setCountPage(i/proNumOfEachPage);
			}else {
				pp.setCountPage(i/proNumOfEachPage+1);
			}
			return pp.getCountPage();
	}
	public int countAdminPage(int proNumOfEachPage,AdminPage pp) {
	 	int i=countAdmin();
		if(i%proNumOfEachPage==0) {
			pp.setCountPage(i/proNumOfEachPage);
		}else {
			pp.setCountPage(i/proNumOfEachPage+1);
		}
		return pp.getCountPage();
}
	public void userAdd(User u) {
		u.setState(1);
		this.sessionFactory.getCurrentSession().save(u);
	}

	public void userDelete(User u) {
		this.sessionFactory.getCurrentSession().delete(u);
	}

	public void userState(User u) {
		User user=this.sessionFactory.getCurrentSession().get(User.class, new Integer(u.getId()));
		int i=user.getState();
		if(i==1) {
			user.setState(0);
		}else {
			user.setState(1);
		}
		this.sessionFactory.getCurrentSession().update(user);
	}

	public void userRevise(User u) {
		User user=this.sessionFactory.getCurrentSession().get(User.class, new Integer(u.getId()));
		user.setName(u.getName());
		user.setEmail(u.getEmail());
		this.sessionFactory.getCurrentSession().update(user);
	}

	public void userDeleteAll(String []values) {
		User u=new User();
		for(String id:values) {
			u=this.sessionFactory.getCurrentSession().get(User.class, new Integer(id));
			this.sessionFactory.getCurrentSession().delete(u);
		}
	}
	public void backUserDeleteAll(String[] values) {
		BackUser u=new BackUser();
		for(String id:values) {
			u=this.sessionFactory.getCurrentSession().get(BackUser.class, new Integer(id));
			this.sessionFactory.getCurrentSession().delete(u);
		}
	}
	public void adminAdd(BackUser bu) {
		this.sessionFactory.getCurrentSession().save(bu);
	}
	public User searchUser(String name) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where name=?");
		query.setParameter(0, name);
		return (User)query.uniqueResult();
	}
	public User searchUser(int id) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where id=?");
		query.setParameter(0, id);
		return (User)query.uniqueResult();
	}
}
