package com.shop.main.productcategory;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.main.product.Product;

@Service
public class ProductCategoryDAO {

	@Autowired
	private SqlSession ss;
	
	// 카테고리 삭제
	public void categoryDel(ProductCategory pc, HttpServletRequest req) {
		try {
			if (ss.getMapper(ProductCategoryMapper.class).categoryDel(pc)==1) {
				req.setAttribute("r", "성공");
			} else {
				req.setAttribute("r", "tlfvo");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 카테고리 등록
	public void categoryReg(ProductCategory pc, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String token2 = (String) req.getSession().getAttribute("token2");
			
			if (token2 != null && token.equals(token2)) {
				return;
			}
			
			pc.setCategory_name(req.getParameter("c_n"));
			if (ss.getMapper(ProductCategoryMapper.class).categoryReg(pc) == 1) {
				req.getSession().setAttribute("token2", token);
			} 
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}
	
	// 카테고리 전체 가져오기
	public void getAllCategory(HttpServletRequest req) {
		try {
			req.setAttribute("p_c", ss.getMapper(ProductCategoryMapper.class).getCategory());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 카테고리 JSON으로 갖고오기
	public ProductCategories getCategoryJSON(HttpServletRequest req) {
		return new ProductCategories(ss.getMapper(ProductCategoryMapper.class).getCategory());
// 	sessionScope 오류로 인하여 getJSON으로 파싱
//		try {
//			pc.setCategory_name(req.getParameter("c_n"));
//			List<ProductCategory> pdc = ss.getMapper(ProductCategoryMapper.class).getCategory(pc);
//			if (pdc.size() != 0) {
//				req.getSession().setAttribute("p_c", pdc.get(0)); << 0번째 NEW ARRIVAL 출력
//				
//				for (int i = 0; i < pdc.size(); i++) {
//					req.getSession().setAttribute("p_c", pdc.get(i)); // 마지막 SHOES 출력
//				}
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
