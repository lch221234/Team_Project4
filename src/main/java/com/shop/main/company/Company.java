package com.shop.main.company;

import java.math.BigDecimal;

public class Company {
	/* 업체 아이디 */
	private BigDecimal company_number;

	/* 업체 이름 */
	private String company_name;

	/* 국가 id */
	private String country_id;

	/* 업체 소개 */
	private String company_introduce;

	public Company() {
		// TODO Auto-generated constructor stub
	}

	public Company(BigDecimal company_number, String company_name, String country_id, String company_introduce) {
		super();
		this.company_number = company_number;
		this.company_name = company_name;
		this.country_id = country_id;
		this.company_introduce = company_introduce;
	}

	public BigDecimal getCompany_number() {
		return company_number;
	}

	public void setCompany_number(BigDecimal company_number) {
		this.company_number = company_number;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCountry_id() {
		return country_id;
	}

	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}

	public String getCompany_introduce() {
		return company_introduce;
	}

	public void setCompany_introduce(String company_introduce) {
		this.company_introduce = company_introduce;
	}



	
	
}
