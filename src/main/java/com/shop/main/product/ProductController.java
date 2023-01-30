package com.shop.main.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;
	
	//상품등록 이동
	@RequestMapping(value = "product.reg", method = RequestMethod.GET)
	public String regProduct(Product p, HttpServletRequest req) {
		pDAO.ProductReg(p, req);
		return "admin/productRegistration";
	}
}
