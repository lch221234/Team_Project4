package com.shop.main.company;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyDAO {

	@Autowired
	private SqlSession ss;

	// 업체 등록
	public void companyReg(Company c, HttpServletRequest req) {
		try {
			c.setCompany_name(req.getParameter("company_name"));
			c.setCountry_id(req.getParameter("country_id"));
			c.setCompany_introduce(req.getParameter("company_introduce"));
			if (ss.getMapper(CompanyMapper.class).companyreg(c) == 1) {
				req.setAttribute("r", "등록성공");
			} else {
				req.setAttribute("r", "등록실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 업체 목록
//	public void companyList(Company c, HttpServletRequest req) {
//	}

	// 회원 불러오기
	public void listCompany(Company c, HttpServletRequest req) {
		List<Company> load = ss.getMapper(CompanyMapper.class).companylist(c);
		req.setAttribute("list", load);
	}
}
