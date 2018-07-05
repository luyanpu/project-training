package com.dao;


import java.util.List;
import com.entity.Product;
import com.entity.ProductType;


public interface ProductDaoImpl {

	//分页查询
	public List<Product> findProByPage(int start, int maxNum);
	//查询数据表的商品总数
	public String count();
	//删除所有产品
	public void productDeleteAll(List<Product> list);
	//查询商品类型
	public List<ProductType> findProductType();
}
