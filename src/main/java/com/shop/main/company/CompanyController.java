package com.shop.main.company;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.main.member.Member;

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
	
	//업체목록 수정
	@RequestMapping(value = "company.info.go", method = RequestMethod.GET)
	public String goInfo(HttpServletRequest req) {
		return "admin/companyUpdate";
	}
	
	//업체목록 수정완료
	@RequestMapping(value = "company.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req) {
		return "admin/companyList";
	}

}
