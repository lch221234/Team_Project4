package com.shop.main.productlist;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.main.TokenManager;
import com.shop.main.member.MemberDAO;

@Controller
public class productlistController {
	
	private boolean isFirstReq;
	
	public productlistController() {
		isFirstReq = true;
	}
	
	/*전체상품*/
	@RequestMapping(value = "productAll.go", method = RequestMethod.GET)
	public String productAllGet(Locale locale, Model model) {
		return "/product/productAll";
	}
	
	/*상의상품*/
	@RequestMapping(value = "productTop.go", method = RequestMethod.GET)
	public String productTopGet(Locale locale, Model model) {
		return "/product/productTop";
	}
	
	/*하의상품*/
	@RequestMapping(value = "productBottom.go", method = RequestMethod.GET)
	public String productBottomGet(Locale locale, Model model) {
		return "/product/productBottom";
	}
	
	/*신발상품*/
	@RequestMapping(value = "productShoes.go", method = RequestMethod.GET)
	public String productShoesGet(Locale locale, Model model) {
		return "/product/productShoes";
	}
	
	/*모자상품*/
	@RequestMapping(value = "productHeadwear.go", method = RequestMethod.GET)
	public String productHeadwearGet(Locale locale, Model model) {
		return "/product/productHeadwear";
	}
	
	/*악세서리상품*/
	@RequestMapping(value = "productAccessory.go", method = RequestMethod.GET)
	public String productAccessoryGet(Locale locale, Model model) {
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
	public String productShoesViewGet(Locale locale, Model model) {
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
	
}
