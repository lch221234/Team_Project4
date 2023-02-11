package com.shop.main.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.main.TokenManager;
import com.shop.main.member.MemberDAO;

@Controller
public class ProductController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private ProductDAO pDAO;
	
	private boolean isFirstReq;
	
	public ProductController() {
		isFirstReq = true;
	}
	
/* 상품목록*/
	@RequestMapping(value = "/product.go", method = RequestMethod.GET)
	public String product(HttpServletRequest req) {
		if (isFirstReq) {
			pDAO.countAllProduct();
			isFirstReq = false;
		}
		mDAO.loginChk(req);
		pDAO.searchClearPD(req);
		pDAO.getProduct2(1, req);
		TokenManager.tokenManager(req);
		return "admin/productList";
	}

	//상품등록 이동
	@RequestMapping(value = "/product.reg", method = RequestMethod.POST)
	public String regProduct(Product p, HttpServletRequest req) {
		pDAO.ProductReg(p, req);
		return "admin/productRegistration";
	}
	
	
	@RequestMapping(value = "/product.search", method = RequestMethod.POST)
	public String productSearch(Product p, HttpServletRequest req) {
		mDAO.loginChk(req);
		pDAO.searchProduct(req);
		pDAO.getProduct2(1, req);
		TokenManager.tokenManager(req);
		return "admin/productList";
	}
	
	// 이건 페이지 잘 넘어가집니다
	@RequestMapping(value = "/product.page.change", method = RequestMethod.GET)
	public String productPageChange(HttpServletRequest req) {
		mDAO.loginChk(req);
		int p = Integer.parseInt(req.getParameter("p"));
		pDAO.getProduct2(p, req);
		TokenManager.tokenManager(req);
		return "admin/productList";
	}
	
	@RequestMapping(value = "/product.Information", method = RequestMethod.GET)
	public String productInfo(HttpServletRequest req) {
		mDAO.loginChk(req);
		pDAO.getProduct2(1, req);
		TokenManager.tokenManager(req);
		return "admin/productInfo";
	}
	
	@RequestMapping(value = "product.delete")
	public String productDelete(Product p, HttpServletRequest req) {
		mDAO.loginChk(req);
		pDAO.getProduct2(1, req);
		pDAO.ProductDel(p, req);
		pDAO.getProduct2(1, req);
		TokenManager.tokenManager(req);
		return "admin/productInfo";
	}
	
	@RequestMapping(value = "product.update")
	public String productUpdate(Product p, HttpServletRequest req) {
		mDAO.loginChk(req);
		pDAO.getProduct2(1, req);
		pDAO.ProductUpdate(p, req);
		pDAO.getProduct2(1, req);
		TokenManager.tokenManager(req);
		return "admin/productInfo";
	}
	
}
