package com.shop.main.company;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.main.SiteOption;

@Service
public class CompanyDAO {
	
	private int allCompanyCount;
	private int allCompanyCounts;

	@Autowired
	private SqlSession ss;
	
	@Autowired
	private SiteOption so5;
	
	@Autowired
	private SiteOption so6;

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



	
	// 업체목록  count
	public void countAllCompany() {
		allCompanyCount = ss.getMapper(CompanyMapper.class).getAllCompanyCount();
	}
	

	
	// 업체목록 불러오기
	public void getCompany1(Company c, int page, HttpServletRequest req) {
		
		req.setAttribute("curPage5", page);
				
		String search = (String) req.getSession().getAttribute("search");
		String type = req.getParameter("type");

		int companyCount = 0;
		
		if (search == null) {
			companyCount = allCompanyCount;
			search = "";
		} else {
			CompanySelector cSel2 = new CompanySelector(search, 0, 0);
			companyCount = ss.getMapper(CompanyMapper.class).getSearchCompanyCount(cSel2);
		}
		
		int allPageCount = (int) Math.ceil((double) companyCount / so5.getMemberPerPage());
		req.setAttribute("allPageCount", allPageCount);
		
		int start = (page - 1) * so5.getCompanyPerPage() + 1;
		int end = (page == allPageCount) ? companyCount : start + so5.getCompanyPerPage() -1;
		
		CompanySelector cSel = new CompanySelector(search, start, end);
		List<Company> companies = null;	// 왜 null이지
		if (type == null || type.equals("all")) {
			companies = ss.getMapper(CompanyMapper.class).getCompany1(cSel);
		} else if (type.equals("company_name")) {
			c.setCompany_name(search);
			companies = ss.getMapper(CompanyMapper.class).getCompany2(cSel);
		} else if (type.equals("country_id")) {
			c.setCountry_id(search);
			companies = ss.getMapper(CompanyMapper.class).getCompany3(cSel);
		}
		req.setAttribute("companies", companies);
	}
	
	// 업체 검색 초기화
	public void searchClear(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}
	
	// 업체 검색
	public void searchCompany(HttpServletRequest req) {
		String search = req.getParameter("companySearch");
		req.getSession().setAttribute("search", search);
	}
	
	/* 수정업체목록 */
	
	// 수정업체 검색
	public void searchCompany2(HttpServletRequest req) {
		req.getSession().setAttribute("search2", req.getParameter("companyInfoSearch"));
	}
	
	// 수정업체 초기화
	public void searchClear2(HttpServletRequest req) {
		req.getSession().setAttribute("search2", null);
	}
	
	// 수정업체 count
	public void countAllCompanies() {
		allCompanyCounts = ss.getMapper(CompanyMapper.class).getAllCompanyCounts();
	}
	
	public void getSearchCompany(Company c, int page, HttpServletRequest req) {
		
		req.setAttribute("curPage6", page);
		
		String search = (String) req.getSession().getAttribute("search2");
		
		int companyCounts = 0;
		
		if (search == null) {
			companyCounts = allCompanyCounts;
			search = "";
		} else {
			CompanySelector cSel2 = new CompanySelector(search, 0, 0);
			companyCounts = ss.getMapper(CompanyMapper.class).getSearchCompanyCount(cSel2);
		}
		int allPageCount = (int) Math.ceil((double) companyCounts / so6.getCompanyInfoPerPage());
		req.setAttribute("allPageCount", allPageCount);
		
		int start = (page -1) * so6.getCompanyInfoPerPage() + 1;
		int end = (page == allPageCount) ? companyCounts : start + so6.getCompanyInfoPerPage() -1;
		
		CompanySelector cSel = new CompanySelector(search, start, end);
		List<Company> companies = ss.getMapper(CompanyMapper.class).getCompany1(cSel);
		req.setAttribute("companyInfos", companies);
	}
	
	public void CompanyDel(Company c, HttpServletRequest req) {
		try {
			String[] value = req.getParameterValues("RowCheck");
			if (value != null) {
				for (String s : value) {
					c.setCompany_number(new BigDecimal(s));
					if (ss.getMapper(CompanyMapper.class).companyDel(c) == 1) {
						allCompanyCount--;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void CompanyUpdate(Company c, HttpServletRequest req) {
		try {
			c.setCompany_number(new BigDecimal(req.getParameter("RowCheck")));
			c.setCompany_name(req.getParameter("company_name"));
			c.setCountry_id(req.getParameter("country_id"));
			c.setCompany_introduce(req.getParameter("company_introduce"));
			
			ss.getMapper(CompanyMapper.class).companyModify(c);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
