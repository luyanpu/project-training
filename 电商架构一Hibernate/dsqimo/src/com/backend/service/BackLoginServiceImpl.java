package com.backend.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.backend.dao.BackLoginDaoImpl;
import com.backend.entity.BackUser;

@Service
@Transactional
public class BackLoginServiceImpl {

	@Resource
	private BackLoginDaoImpl backLoginDaoImpl;
	
	public BackUser findByNameOrPassword(BackUser bu) {
		 return this.backLoginDaoImpl.findByNameOrPassword(bu);
	}
}
