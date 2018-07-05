package com.frontend.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.backend.entity.ProductType;
import com.frontend.dao.ProductDaoImpl;
import com.frontend.entity.Product;
import com.frontend.entity.ProductPage;

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
			request.setAttribute("countPage", psdi.countPage(6,pp));//产品的总页面
			request.setAttribute("thispage", pp.getThisPage());//当前是第几页
		}else {
			num=new Integer(thisnum.toString());
			ProductPage pp=new ProductPage(num);
			if(num<=0 || num> (this.psdi.countPage(6,pp))) {
				num=1;//现在的页数
				pp.setThisPage(num);//如果页码超了范围则默认为1
			}
			//查询第num页，每页显示6个
			List<Product> list=psdi.findProByPage((num-1)*6,6);
			request.setAttribute("prolist", list);
			request.setAttribute("count", psdi.count());
			request.setAttribute("countPage", psdi.countPage(6,pp));
			request.setAttribute("thispage", pp.getThisPage());
		}
		List<ProductType> protypelist=this.psdi.findProductType();
		request.setAttribute("pty", protypelist);
		
	}
	public void productDeleteAll(String[] id) {
		this.psdi.productDeleteAll(id);
	}
	public void productAdd(Product p) {
		this.psdi.productDeleteAll(p);
		
	}
	public void productRevise(Product p) {
		this.psdi.producRevise(p);
	}
	public Product productFind(Product p) {
		
		return this.psdi.producFindOne(p);
	}
	public void findByType(ProductType p,HttpServletRequest request) {
		 Set<Product> product=this.psdi.findProByType(p);
		//数字6代表每页最多显示6条数据
		 		Object thisnum=request.getParameter("pagenumber");
				int num=1;//现在的页数
				if(thisnum==null || thisnum.equals("")) {
					//查询第1页,每页显示6个
					ProductPage pp=new ProductPage(num);//初始化当前页码和每页的商品个数
					List<Product> list=psdi.findProByPageInGroup((num-1)*6,6,product);//数据库的分页查询
					request.setAttribute("prolist", list);//产品的list
					request.setAttribute("count", psdi.count());//产品的总数
					request.setAttribute("countPage", psdi.countPage(6,pp));//产品的总页面
					request.setAttribute("thispage", pp.getThisPage());//当前是第几页
				}else {
					num=new Integer(thisnum.toString());
					ProductPage pp=new ProductPage(num);
					if(num<=0 || num> (this.psdi.countPage(6,pp))) {
						num=1;//现在的页数
						pp.setThisPage(num);//如果页码超了范围则默认为1
					}
					//查询第num页，每页显示6个
					List<Product> list=psdi.findProByPageInGroup((num-1)*6,6,product);
					request.setAttribute("prolist", list);
					request.setAttribute("count", psdi.count());
					request.setAttribute("countPage", psdi.countPage(6,pp));
					request.setAttribute("thispage", pp.getThisPage());
				}
				//商品类型的查询
				List<ProductType> protypelist=this.psdi.findProductType();
				request.setAttribute("pty", protypelist);
		
	}
	public Product finByName(String name) {
		return this.psdi.findproByName(name);
		
	}
	public void findProByTypeId(int id,HttpServletRequest request) {
		Set<Product> proset=this.psdi.findproTypeByTypeId(id);
		Iterator<Product> it=proset.iterator();
		int size=proset.size();
		List<Integer> proidlist=new ArrayList<Integer>();
		while(it.hasNext()) {
		for(int i=0;i<size;i++) {
			proidlist.add(it.next().getId());
			}
		}
		//数字6代表每页最多显示6条数据
				Object thisnum=request.getParameter("pagenumber");
				int num=1;//现在的页数
				if(thisnum==null || thisnum.equals("")) {
					//查询第1页,每页显示6个
					ProductPage pp=new ProductPage(num);//初始化当前页码和每页的商品个数
					List<Product> list=psdi.findProByPage((num-1)*6,6,proidlist);//数据库的分页查询
					request.setAttribute("prolist", list);//产品的list
					request.setAttribute("count", psdi.count());//产品的总数
					request.setAttribute("countPage", psdi.countPage(6,pp));//产品的总页面
					request.setAttribute("thispage", pp.getThisPage());//当前是第几页
				}else {
					num=new Integer(thisnum.toString());
					ProductPage pp=new ProductPage(num);
					if(num<=0 || num> (this.psdi.countPage(6,pp))) {
						num=1;//现在的页数
						pp.setThisPage(num);//如果页码超了范围则默认为1
					}
					//查询第num页，每页显示6个
					List<Product> list=psdi.findProByPage((num-1)*6,6,proidlist);
					request.setAttribute("prolist", list);
					request.setAttribute("count", psdi.count());
					request.setAttribute("countPage", psdi.countPage(6,pp));
					request.setAttribute("thispage", pp.getThisPage());
				}
				List<ProductType> protypelist=this.psdi.findProductType();
				request.setAttribute("pty", protypelist);
	}
}
