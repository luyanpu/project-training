package com.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.LoginDaoImpl;
import com.entity.User;

@Service
@Transactional
public class LoginServiceImpl {

	@Resource
	private LoginDaoImpl loginDaoImpl;
	
	public User loginByNameAndPass(String name,String password) {
		return  this.loginDaoImpl.findByNameAndPass(name,password);
	}
	
	public User loginFindById(int id) {
		return this.loginDaoImpl.findById(id);
	}
}
