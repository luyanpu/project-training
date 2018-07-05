package com.backend.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.frontend.entity.Order;

@Repository
public class BackOrderDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	public List<Order> findAll(){
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Order");
		return query.list();
		
	}
	public List<Order> findByName(String name) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Order where name=?");
		query.setParameter(0, name);
		return query.list();
	}
}
