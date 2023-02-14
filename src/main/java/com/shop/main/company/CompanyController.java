package com.shop.main.company;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.main.TokenManager;
import com.shop.main.member.MemberDAO;

@Controller
public class CompanyController {
	@Autowired
	private CompanyDAO cDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	private boolean isFirstReq;
	
	public CompanyController() {
		isFirstReq = true;
	}
	
	// 업체등록 이동
	@RequestMapping(value = "companyEnroll.do", method = RequestMethod.GET)
	public String goCompanyRegistration(Company c, HttpServletRequest req) {
		cDAO.companyReg(c, req);
		return "admin/companyRegistration";
	}
	
	//업체목록 수정
	@RequestMapping(value = "company.info.go", method = RequestMethod.GET)
	public String goInfo(HttpServletRequest req) {
		return "admin/companyUpdate";
	}
	
	//업체목록 수정완료
	@RequestMapping(value = "company.update", method = RequestMethod.POST)
	public String companyUpdate(Company c, HttpServletRequest req) {
		return "admin/companyList";
	}
	
	//업체목록 검색
	@RequestMapping(value = "/company.search", method = RequestMethod.POST)
	public String companySearch(Company c, HttpServletRequest req) {
		mDAO.loginChk(req);
		cDAO.searchCompany(req);
		cDAO.getCompany1(c, 1, req);
		TokenManager.tokenManager(req);
		return "admin/companyList";
	}
	
	//업체목록 페이지 - 무한루
	@RequestMapping(value = "/company.page.change", method = RequestMethod.GET)
	public String companyPageChange(Company c, HttpServletRequest req) {
		mDAO.loginChk(req);
		int p = Integer.parseInt(req.getParameter("p"));
		cDAO.getCompany1(c, p, req);
		TokenManager.tokenManager(req);
		return "admin/companyList";
	}
	
	
	@RequestMapping(value = "company.Infosearch", method = RequestMethod.POST)
	public String companyInfoSearch(Company c, HttpServletRequest req) {
		mDAO.loginChk(req);
		cDAO.searchCompany2(req);
		cDAO.getSearchCompany(c, 1, req);
		TokenManager.tokenManager(req);
		return "admin/companyInfo";
	}
	
	@RequestMapping(value = "companyInfo.page.change", method = RequestMethod.GET)
	public String companyInfoPageChange(Company c, HttpServletRequest req) {
		mDAO.loginChk(req);
		int p = Integer.parseInt(req.getParameter("p"));
		cDAO.getSearchCompany(c, p, req);
		TokenManager.tokenManager(req);
		return "admin/companyInfo";
	}
	
	@RequestMapping(value = "company.Information", method = RequestMethod.GET)
	public String companyInfo(Company c, HttpServletRequest req) {
		if (isFirstReq) {
			cDAO.countAllCompanies();
			isFirstReq = false;
		}
		cDAO.searchClear2(req);
		cDAO.getSearchCompany(c, 1, req);
		TokenManager.tokenManager(req);
		return "admin/companyInfo";
	}
	
	@RequestMapping(value = "company.delete", method = RequestMethod.GET)
	public String companyDelete(Company c, HttpServletRequest req) {
		mDAO.loginChk(req);
		cDAO.getSearchCompany(c, 1, req);
		cDAO.CompanyDel(c, req);
		cDAO.getSearchCompany(c, 1, req);
		TokenManager.tokenManager(req);
		return "admin/companyInfo";
	}
	
	
	
	
	
	
	
	
	
}
