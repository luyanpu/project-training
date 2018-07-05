package com.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.entity.User;

public interface RegistDaoImpl {

	public int save(User u);
	@Update("update  User set state=${1} where id=#{id}")
	public void updateState(int id);
	@Select("select * from User where name=#{name}")
	public User findByName(User u);
	
}
