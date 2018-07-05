package com.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.entity.ProductType;
import com.dao.ProductDaoImpl;
import com.entity.Product;
import com.entity.ProductPage;

@Service
@Transactional
public class ProductServiceImpl {
	@Resource
	private ProductDaoImpl psdi;//产品查询dao
	public void indexShow(HttpServletRequest request) {
		//数字6代表每页最多显示6条数据
		Object thisnum=request.getParameter("pagenumber");
		int num=1;//现在的页数
		if(thisnum==null || thisnum.equals("")) {
			//查询第1页,每页显示6个
			ProductPage pp=new ProductPage(num);//初始化当前页码和每页的商品个数
			List<Product> list=psdi.findProByPage((num-1)*6,6);//数据库的分页查询
			request.setAttribute("prolist", list);//产品的list
			request.setAttribute("count", psdi.count());//产品的总数
			request.setAttribute("countPage", countPage(6,pp));//产品的总页面
			request.setAttribute("thispage", pp.getThisPage());//当前是第几页
		}else {
			num=new Integer(thisnum.toString());
			ProductPage pp=new ProductPage(num);
			if(num<=0 || num> (countPage(6,pp))) {
				num=1;//现在的页数
				pp.setThisPage(num);//如果页码超了范围则默认为1
			}
			//查询第num页，每页显示6个
			List<Product> list=psdi.findProByPage((num-1)*6,6);
			request.setAttribute("prolist", list);
			request.setAttribute("count", psdi.count());
			request.setAttribute("countPage", countPage(6,pp));
			request.setAttribute("thispage", pp.getThisPage());
		}
		List<ProductType> protypelist=this.psdi.findProductType();
		request.setAttribute("pty", protypelist);
	}
	public void productDeleteAll(String[] check) {	
		List<Product> list = new ArrayList<Product>();
		for(String id:check) {
			Product p=new Product();
			p.setId(Integer.parseInt(id));
			list.add(p);
		}
		this.psdi.productDeleteAll(list);
	}
	public int countPage(int proNumOfEachPage,ProductPage pp) {
	 	int i=Integer.parseInt(psdi.count());
		if(i%proNumOfEachPage==0) {
			pp.setCountPage(i/proNumOfEachPage);
		}else {
			pp.setCountPage(i/proNumOfEachPage+1);
		}
		return pp.getCountPage();
	}
}
