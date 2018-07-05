package com.frontend.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.frontend.dao.CartDaoImpl;
import com.frontend.entity.Cart;
import com.frontend.entity.CartItem;
import com.frontend.entity.Product;
import com.frontend.entity.User;

@Service(value = "cartServiceImpl")
@Transactional
public class CartServiceImpl {
	@Resource
	private CartDaoImpl cartDaoImpl;
	@Resource
	private OrderServiceImpl orderServiceImpl;

	public void addProduct(int id, int uid, HttpSession session) {
		// 获取请求参数中产品的id值
		// 根据id值找到这个商品
		Product pro = this.cartDaoImpl.findProById(id);
		// 创建session
		Cart c = (Cart) session.getAttribute("cart");
		// 将商品添加进购物车,如果购物车不存在
		// 一种session失效，一种是用户第一次登陆没有数据库没有cart记录
		if (c == null) {
			// 用户第一次登陆没有数据库没有cart记录
			Cart cart = this.cartDaoImpl.findCartByUserId(uid);
			if (cart == null) {
				// 创建购物车
				c = new Cart();
				// 设置购物车的用户id
				c.setUserid(uid);
				this.cartDaoImpl.addCart(c);
			}else {//session失效
				c=cart;
			}
		}
		// 查出这个购物项进行商品数量的添加和总额计算
		// 有这个商品,没这个商品
		CartItem ci = this.cartDaoImpl.findCartItemById(c.getId(), pro.getId());
		if (ci == null) {// 这是新添加的商品
			// 创建购物项
			ci = new CartItem();
			// 设置产品的id
			ci.setProid(id);
			ci.setName(pro.getName());
			// 设置数量
			ci.setCount(1);
			// 设置价格
			ci.setTotal(ci.getCount() * pro.getPrice());
			// 设置购物项里的购物车id
			ci.setCart(c);
			this.cartDaoImpl.firstCartItem(ci);
		} else {// 购物项有这个商品
				// 更新数量
			ci.setCount(ci.getCount() + 1);
			// 更新商品价格
			ci.setTotal(ci.getCount() * pro.getPrice());
			this.cartDaoImpl.updateCartItem(ci);
		}
		// 更新缓存
		session.setAttribute("cart", c);
		System.out.println(session.getAttribute("cart"));
	}

	public List<CartItem> checkOut(int userid,HttpSession session) {
		Cart cart = this.findCartByUserId(userid);
		if(cart!=null) {
			session.setAttribute("cart",cart);
		}
		List<CartItem> list = this.cartDaoImpl.findCartItemByCartId(cart.getId());
		return list;
	}

	public void balanceProduct(String[] k, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String product = null;
		String count = null;
		for (String key : k) {
			CartItem ci = this.cartDaoImpl.findCartItemById(Integer.parseInt(key));
			Product p = this.cartDaoImpl.findProById(ci.getProid());// 得到这个物品
			int num = ci.getCount();
			if (product == null || count == null) {
				product = p.getName() + ",";
				count = num + ",";
			} else {
				product = p.getName() + "," + product;
				count = num + "," + count;
			}
			p.setCount(p.getCount() - num);// 数量减少
			this.cartDaoImpl.updatePro(p);// 更新操作
		}
		// 创建完成订单的操作
		// 得到用户
		User user = (User) session.getAttribute("user");
		// 得到时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date()).toString();
		// 得到用户的名字
		String name = user.getName();
		// 添加订单
		this.orderServiceImpl.addOrder(user, date, name, product, count);
		
		//清空被选中的货物
		this.deleteCartItemByk(k, request);
	}
	
	public void deleteCartItem(int pid,int cartid) {
		this.cartDaoImpl.deleteCartItem(pid, cartid);
	}

	public Cart findCartByUserId(int id) {
		return this.cartDaoImpl.findCartByUserId(id);
	}

	public void deleteCartItemByk(String[] k, HttpServletRequest request) {
		HttpSession session=request.getSession();
		User u=(User)session.getAttribute("user");
		Cart c=this.findCartByUserId(u.getId());//得到用户的id
		for(String pid:k) {
			CartItem ci = this.cartDaoImpl.findCartItemById(Integer.parseInt(pid));
			Product p = this.cartDaoImpl.findProById(ci.getProid());// 得到这个物品
			this.deleteCartItem(p.getId(), c.getId());
		}
	}
}
