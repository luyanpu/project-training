package com.backend.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.backend.entity.BackUser;

@Repository
public class BackLoginDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	public BackUser findByNameOrPassword(BackUser u) {
		Query query =this.sessionFactory.getCurrentSession().createQuery("from BackUser where name=? and password=?");
		query.setParameter(0, u.getName());
		query.setParameter(1, u.getPassword());
		return (BackUser)query.uniqueResult();
		
	}
}
