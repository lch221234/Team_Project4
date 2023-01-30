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
			c.setCompanyName(req.getParameter("companyName"));
			c.setNationId(req.getParameter("nationId"));
			c.setCompanyIntro(req.getParameter("companyIntro"));
			
			ss.getMapper(CompanyMapper.class).companyreg(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
