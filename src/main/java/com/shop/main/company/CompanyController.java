package com.shop.main.company;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompanyController {
	@Autowired
	private CompanyDAO cDAO;

	// 업체등록 이동
	@RequestMapping(value = "companyEnroll.do", method = RequestMethod.GET)
	public String goCompanyRegistration(Company c, HttpServletRequest req) {
		cDAO.companyReg(c, req);
		return "admin/companyRegistration";
	}

}
