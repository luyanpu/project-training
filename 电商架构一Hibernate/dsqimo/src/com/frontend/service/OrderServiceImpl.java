package com.frontend.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.frontend.dao.OrderDaoImpl;
import com.frontend.entity.User;

@Service
@Transactional
public class OrderServiceImpl {

	@Resource
	private OrderDaoImpl orderDaoImpl;
	
	public void addOrder(User user,String date,String name,String product,String count) {
		
		this.orderDaoImpl.savaOrder( user, date, name, product, count);
	}
}
