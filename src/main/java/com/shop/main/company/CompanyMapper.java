package com.shop.main.company;

import java.util.List;

public interface CompanyMapper {
	public abstract int companyreg(Company c);
	public abstract List<Company> companylist();
}
