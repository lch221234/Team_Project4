package com.shop.main.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.main.member.Member;
import com.shop.main.member.MemberDAO;
import com.shop.main.product.ProductController;
import com.shop.main.product.ProductDAO;
import com.shop.main.productcategory.ProductCategoryDAO;

@Controller
public class AdminController {
	@Autowired
	private ProductCategoryDAO pcDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private ProductDAO pDAO;
	@Autowired ProductController pCon;

	private boolean isFirstReq;
	
public AdminController() {
	isFirstReq = true;
}
	
	//메인화면 이동
	@RequestMapping(value = "admin.go", method = RequestMethod.GET)
	public String goAdmin() {
		return "admin/main";
	}
	//카테고리등록 이동
	@RequestMapping(value = "categoryRegistration.go", method = RequestMethod.GET)
	public String goCategoryRegistration(HttpServletRequest req) {
		pcDAO.getAllCategory(req);
		return "admin/categoryRegistration";
	}
	//상품등록 이동
	@RequestMapping(value = "productRegistration.go", method = RequestMethod.GET)
	public String goProductregistration() {
		return "admin/productRegistration";
	}
	//상품목록 이동
	@RequestMapping(value = "productList.go", method = RequestMethod.GET)
	public String goProductList(HttpServletRequest req) {
//		if (isFirstReq) {
//			pDAO.countAllProduct();
//			isFirstReq = false;
//		}
		pDAO.getProduct(req);
		return "admin/productList";
	}
	//업체등록 이동
	@RequestMapping(value = "companyRegistration.go", method = RequestMethod.GET)
	public String goCompanyRegistration() {
		return "admin/companyRegistration";
	}
	//업체목록 이동
	@RequestMapping(value = "companyList.go", method = RequestMethod.GET)
	public String gocompanyList(Model m){
//		List<Company> list = CompanyMapper.companylist(); //오류나서 주석
//		m.addAttribute("list", CompanyMapper.companylist());
		return "admin/companyList";
	}
	//회원관리 이동
	@RequestMapping(value = "memberList.go", method = RequestMethod.GET)
	public String gomemberList(Member inputM, HttpServletRequest req) {
		mDAO.listMember(inputM, req);
//		mDAO.findMember(inputM, req); 
		return "admin/memberList";
	}
//	// child.jsp 팝업창 띄우기
//	@RequestMapping("/admin/child")
//	public void child() throws Exception{
//		
//	}
	
}
