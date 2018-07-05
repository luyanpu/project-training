package com.frontend.dao;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.frontend.entity.Cart;
import com.frontend.entity.CartItem;
import com.frontend.entity.Product;


@Repository
public class CartDaoImpl {

	@Resource
	private SessionFactory sessionFactory;
	
	public Product findProById(int id) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Product p where p.id=?");
		query.setParameter(0,id);
		return (Product)query.uniqueResult();
	}

	public void updatePro(Product p) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(p);//进行更新操作
	}

	public int firstCartItem(CartItem ci) {
		this.sessionFactory.getCurrentSession().save(ci);
		return ci.getId();
		
	}

	public void addCart(Cart c) {
		this.sessionFactory.getCurrentSession().save(c);
	}

	public CartItem findCartItemById(int cartid, int proid) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from CartItem where proid=? and cartid=?");
		query.setParameter(0, proid);
		query.setParameter(1, cartid);
		return (CartItem)query.uniqueResult();
	}

	public void updateCartItem(CartItem ci) {
		this.sessionFactory.getCurrentSession().update(ci);
	}

	public Cart findCartByUserId(int userid) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from Cart where userid=?");
		query.setParameter(0, userid);
		Cart c=(Cart)query.uniqueResult();
		return c;
	}

	public List<CartItem> findCartItemByCartId(int cartid) {
		Query query=this.sessionFactory.getCurrentSession().createQuery("from CartItem where cartid=?");
		query.setParameter(0, cartid);
		List<CartItem> list=query.list();
		return list;
	}

	public CartItem findCartItemById(int id) {
		Query<CartItem> query=this.sessionFactory.getCurrentSession().createQuery("from CartItem where id=?");
		query.setParameter(0, id);
		return query.uniqueResult();
		
	}

	public void deleteAllCartItem(int id) {
		Session session=this.sessionFactory.getCurrentSession();
		Query<CartItem> query=session.createQuery("from CartItem where cartid=?");
		query.setParameter(0, id);
		//得到购物项集合
		List<CartItem> list=query.list();
		for(CartItem c:list) {
			session.delete(c);
		}
	}

	public void deleteCartItem(int pid, int id) {
		Session session=this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("from CartItem where proid=? and cartid=?");
		query.setParameter(0, pid);
		query.setParameter(1, id);
		CartItem ci=(CartItem) query.uniqueResult();
		session.delete(ci);
	}
}
