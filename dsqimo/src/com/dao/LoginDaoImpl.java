package com.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import com.entity.User;

public interface LoginDaoImpl {

	@Select("select * from user where name=#{param1} and password=#{param2}")
	public User findByNameAndPass(String name,String password);

	@Select("select * from user where id=#{id}")
	public User findById(int id);
}
