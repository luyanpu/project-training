package com.backend.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.backend.dao.AtricleClassDaoImpl;
import com.backend.entity.ProductType;

@Service
@Transactional
public class AtricleClassServiceImpl {

	@Resource
	private AtricleClassDaoImpl atricleClassDaoImpl ;
	
	public List<ProductType> articleClass() {
		return this.atricleClassDaoImpl.productTypeShow();
	}

	public void articleClassAdd(ProductType pt) {
		this.atricleClassDaoImpl.productTypeAdd(pt);
	}

	public void articleClassDeleteAll(String[] id) {
		this.atricleClassDaoImpl.productTypeDeleteAll(id);
	}

}
