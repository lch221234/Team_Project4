package com.shop.main.company;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyDAO {

	@Autowired
	private SqlSession ss;
	
	//업체 등록
	public void companyReg(Company c, HttpServletRequest req) {
		try {
			c.setCompany_name(req.getParameter("companyName"));
			c.setCountry_id(req.getParameter("nationId"));
			c.setCompany_introduce(req.getParameter("companyIntro"));
			if (ss.getMapper(CompanyMapper.class).companyreg(c) ==1) {
				req.setAttribute("r", "등록성공");
			}else {
				req.setAttribute("r", "등록실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
