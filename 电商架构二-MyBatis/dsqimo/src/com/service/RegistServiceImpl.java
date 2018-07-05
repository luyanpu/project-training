package com.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.RegistDaoImpl;
import com.entity.User;


@Service
@Transactional
public class RegistServiceImpl {
	
	@Resource
	private RegistDaoImpl registDaoImpl;
	
	
	public int regist(User u) {
		this.registDaoImpl.save(u);
		return u.getId();
	}
	public void editState(int id) {
		this.registDaoImpl.updateState(id);
	}
	public User checkName(User u) {
		return this.registDaoImpl.findByName(u);
		
	}
}
