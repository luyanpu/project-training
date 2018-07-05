package com.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.OrderDaoImpl;
import com.entity.Order;
import com.entity.User;

@Service
@Transactional
public class OrderServiceImpl {

	@Resource
	private OrderDaoImpl orderDaoImpl;
	
	public void addOrder(User user,String date,String name,String product,String count) {
		Order order=new Order();
		order.setCount(count);
		order.setDate(date);
		order.setName(name);
		order.setProduct(product);
		order.setUser(user);
		this.orderDaoImpl.savaOrder( order);
	}
}
