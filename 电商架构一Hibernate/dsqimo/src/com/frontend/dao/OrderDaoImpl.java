package com.frontend.dao;

import javax.annotation.Resource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.frontend.entity.Order;
import com.frontend.entity.User;

@Repository
public class OrderDaoImpl {
	
	@Resource
	private SessionFactory sessionFactory;
	
	public void savaOrder(User user,String date,String name,String product,String count) {
		Order o=new Order();
		o.setCount(count);
		o.setDate(date);
		o.setDate(date);
		o.setName(name);
		o.setState(1);//订单为完成状态
		o.setProduct(product);
		Session session=this.sessionFactory.getCurrentSession();
		User u=session.get(User.class, new Integer(user.getId()));
		//u.getOrderSet().add(o);//ordertable的userID 为空
		o.setUser(u);//也可以
		session.save(o); 
	}
}
