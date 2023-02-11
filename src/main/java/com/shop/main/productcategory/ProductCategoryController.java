package com.shop.main.productcategory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.main.TokenManager;

@Controller
public class ProductCategoryController {
	
	@Autowired
	private ProductCategoryDAO pcDAO;

	@RequestMapping(value = "admin/child", method = RequestMethod.GET)
	public String RegCategory(ProductCategory pc, HttpServletRequest req) {
		pcDAO.getAllCategory(req);
		pcDAO.categoryReg(pc, req);
		pcDAO.getAllCategory(req);
		TokenManager.tokenManager(req);
		return "admin/child";
	}
	
	@RequestMapping(value = "/admin.getCategory", method = RequestMethod.GET, produces ="application/json; charset=utf-8" )
	public @ResponseBody ProductCategories getCategory(HttpServletResponse res, HttpServletRequest req) {
		res.addHeader("Access-Control-Allow-Orign", "*");
		return pcDAO.getCategoryJSON(req);
	}
	
	@RequestMapping(value = "admin.delCategory", method = RequestMethod.GET)
	public String DelCategory(ProductCategory pc, HttpServletRequest req) {
		pcDAO.categoryDel(pc, req);
		pcDAO.getAllCategory(req);
		return "admin/categoryRegistration";
	}
		
}
