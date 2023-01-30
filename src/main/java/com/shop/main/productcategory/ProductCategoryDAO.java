package com.shop.main.productcategory;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class ProductCategoryDAO {

	@Autowired
	private SqlSession ss;
	
	//카테고리 등록
	public void categoryReg(ProductCategory pc, HttpServletRequest req) {
		try {
			pc.setCategory_name(req.getParameter("c_n"));
			ss.getMapper(ProductCategoryMapper.class).categoryReg(pc);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 카테고리 갖고오기
	public void getCategory(ProductCategory pc, HttpServletRequest req) {
		try {
			pc.setCategory_name(req.getParameter("c_n"));
			List<ProductCategory> pdc = ss.getMapper(ProductCategoryMapper.class).getCategory(pc);
			if (pdc.size() != 0) {
				ProductCategory pdcg = pdc.get(0);
				req.getSession().setAttribute("p_c", pdcg);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
	