package com.backend.dao;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.backend.entity.ProductType;

@Repository
public class AtricleClassDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	public List<ProductType> productTypeShow() {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from ProductType");
		return query.list();
	}
	public void productTypeAdd(ProductType pt) {
		this.sessionFactory.getCurrentSession().save(pt);
	}
	public void productTypeDeleteAll(String[] check) {
		ProductType pt=new ProductType();
		
		for(String id:check) {
			pt.setId(Integer.parseInt(id));
			this.sessionFactory.getCurrentSession().delete(pt);
		}
		
	}

}
