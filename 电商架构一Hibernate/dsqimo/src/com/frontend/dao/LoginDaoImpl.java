package com.frontend.dao;


import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.frontend.entity.User;

@Repository
public class LoginDaoImpl {

	@Resource
	private  SessionFactory sessionFactory;
	public User findByNameAndPass(User u) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where name=? and password=?");
		query.setParameter(0, u.getName());
		query.setParameter(1, u.getPassword());
		return (User)query.uniqueResult();
		
		
	}
	
	public User findById(int id) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where id=?");
		query.setParameter(0, id);
		return (User)query.uniqueResult();
	}
}
