package com.frontend.dao;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.frontend.entity.User;

@Repository
@Transactional
public class RegistDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	public int save(User u) {
		this.sessionFactory.getCurrentSession().save(u);
		return u.getId();
		
		//hibernate insert不支持这么用
//		Query query=this.sessionFactory.getCurrentSession().createQuery("insert into User(name,password,email,state) values(?,?,?,?)");
//		query.setParameter(0, name);
//		query.setParameter(1, password);
//		query.setParameter(2, eMail);
//		query.setParameter(3, 0);
		//return 1;
	}
	public void updateState(int id) {
		/*
		 * 更新语句时事务声明放在Dao?
		 */
		Query query=this.sessionFactory.getCurrentSession().createQuery("update  User set state=? where id=?");
		query.setParameter(0, 1);
		query.setParameter(1, id);
		query.executeUpdate();
	}
	public User findByName(User u) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from User where name=?");
		query.setParameter(0, u.getName());
		return (User)query.uniqueResult();
	}
	
}
