package com.backend.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.backend.dao.BackOrderDaoImpl;
import com.frontend.entity.Order;

@Service
@Transactional
public class BackOrderServiceImpl {

	@Resource
	private BackOrderDaoImpl dodi;
	public List<Order> findAllOrder(){
		return this.dodi.findAll();
	}
	public List<Order> findOrderByName(String name) {
		return this.dodi.findByName(name);
	}
}
