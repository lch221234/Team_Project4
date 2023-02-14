package com.shop.main.company;

import java.util.List;

public interface CompanyMapper {
	public abstract int companyreg(Company c);
	
	public abstract List<Company> companylist(Company c);
	
	/* 업체 목록 */
	
	public abstract List<Company> getCompany1 (CompanySelector cSel);
	public abstract List<Company> getCompany2 (CompanySelector cSel);
	public abstract List<Company> getCompany3 (CompanySelector cSel);
	
	public abstract int getAllCompanyCount();
	public abstract int getAllCompanyCounts();
	
	public abstract int getSearchCompanyCount(CompanySelector cSel);
	
	public abstract int companyDel(Company c);
	public abstract int companyModify(Company c);
	
	
}
