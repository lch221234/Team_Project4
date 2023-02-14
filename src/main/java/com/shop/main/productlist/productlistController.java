package com.shop.main.productlist;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.spi.MDCAdapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.main.TokenManager;
import com.shop.main.member.Member;
import com.shop.main.member.MemberDAO;
import com.shop.main.product.Product;
import com.shop.main.product.ProductDAO;

@Controller
public class productlistController {
	
	@Autowired
	private ProductDAO pDAO;
	@Autowired
	private MemberDAO mDAO;
	
	private boolean isFirstReq;
	
	public productlistController() {
		isFirstReq = true;
	}
	
	/*전체상품*/
	@RequestMapping(value = "productAll.go", method = RequestMethod.GET)
	public String productAllGet(HttpServletRequest req) {
		pDAO.getAllCategories(req);
		return "/product/productAll";
	}
	
	/*상의상품*/
	@RequestMapping(value = "productTop.go", method = RequestMethod.GET)
	public String productTopGet(HttpServletRequest req) {
		pDAO.getTop(req);
		return "/product/productTop";
	}
	
	/*하의상품*/
	@RequestMapping(value = "productBottom.go", method = RequestMethod.GET)
	public String productBottomGet(HttpServletRequest req) {
		pDAO.getBottom(req);
		return "/product/productBottom";
	}
	
	/*신발상품*/
	@RequestMapping(value = "productShoes.go", method = RequestMethod.GET)
	public String productShoesGet(HttpServletRequest req) {
		pDAO.getShoes(req);
		return "/product/productShoes";
	}
	
	/*모자상품*/
	@RequestMapping(value = "productHeadwear.go", method = RequestMethod.GET)
	public String productHeadwearGet(HttpServletRequest req) {
		pDAO.getCap(req);
		return "/product/productHeadwear";
	}
	
	/*악세서리상품*/
	@RequestMapping(value = "productAccessory.go", method = RequestMethod.GET)
	public String productAccessoryGet(HttpServletRequest req) {
		pDAO.getAccessory(req);
		return "/product/productAccessory";
	}
	
	/*전체상품 상세보기*/
	@RequestMapping(value = "productAll.view", method = RequestMethod.GET)
	public String productAllViewGet(Locale locale, Model model) {
		return "/product/productAllView";
	}
	
	/*상의상품 상세보기*/
	@RequestMapping(value = "productTop.view", method = RequestMethod.GET)
	public String productTopViewGet(Locale locale, Model model) {
		return "/product/productTopView";
	}
	
	/*하의상품 상세보기*/
	@RequestMapping(value = "productBottom.view", method = RequestMethod.GET)
	public String productBottomViewGet(Locale locale, Model model) {
		return "/product/productBottomView";
	}
	
	/*신발상품 상세보기*/
	@RequestMapping(value = "productShoes.view", method = RequestMethod.GET)
	public String productShoesViewGet(Product p, HttpServletRequest req) {
		
		return "/product/productShoesView";
	}
	
	/*모자상품 상세보기*/
	@RequestMapping(value = "productHeadwear.view", method = RequestMethod.GET)
	public String productHeadwearViewGet(Locale locale, Model model) {
		return "/product/productHeadwearView";
	}
	
	/*악세서리상품 상세보기*/
	@RequestMapping(value = "productAccessory.view", method = RequestMethod.GET)
	public String productAccessoryViewGet(Locale locale, Model model) {
		return "/product/productAccessoryView";
	}
	
	@RequestMapping(value = "productAll.Buy", method = RequestMethod.GET)
	public String productAllBuy(Member m, HttpServletRequest req) {
		pDAO.productBuy(m, req);
		pDAO.getAllCategories(req);
		return "/product/productAll";
	}
	@RequestMapping(value = "productTop.Buy", method = RequestMethod.GET)
	public String productTopBuy(Member m, HttpServletRequest req) {
		pDAO.productBuy(m, req);
		pDAO.getTop(req);
		return "/product/productTop";
	}
	@RequestMapping(value = "productBottom.Buy", method = RequestMethod.GET)
	public String productBottomBuy(Member m, HttpServletRequest req) {
		pDAO.productBuy(m, req);
		pDAO.getBottom(req);
		return "/product/productBottom";
	}
	@RequestMapping(value = "productShoes.Buy", method = RequestMethod.GET)
	public String productShoesBuy(Member m, HttpServletRequest req) {
		pDAO.productBuy(m, req);
		pDAO.getShoes(req);
		return "/product/productShoes";
	}
	@RequestMapping(value = "productCap.Buy", method = RequestMethod.GET)
	public String productCapBuy(Member m, HttpServletRequest req) {
		pDAO.productBuy(m, req);
		pDAO.getCap(req);
		return "/product/productHeadwear";
	}
	@RequestMapping(value = "productAc.Buy", method = RequestMethod.GET)
	public String productAcBuy(Member m, HttpServletRequest req) {
		pDAO.productBuy(m, req);
		pDAO.getAccessory(req);
		return "/product/productAccessory";
	}
	
}
