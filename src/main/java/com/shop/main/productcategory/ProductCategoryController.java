package com.shop.main.productcategory;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductCategoryController {
	
	@Autowired
	private ProductCategoryDAO pcDAO;

	@RequestMapping(value = "admin/child", method = RequestMethod.GET)
	public String RegCategory(ProductCategory pc, HttpServletRequest req) {
		pcDAO.categoryReg(pc, req);
		pcDAO.getCategory(pc, req);
		return "admin/child";
	}
		
}
