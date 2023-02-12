package com.shop.main;

public class SiteOption {

	private int vocMsgPerPage;
	private int ProductPerPage;
	private int MemberPerPage;
	private int ProductInfoPerPage;
	private int CompanyPerPage;

public SiteOption() {
	// TODO Auto-generated constructor stub
}

public SiteOption(int vocMsgPerPage, int productPerPage, int memberPerPage, int productInfoPerPage,
		int companyPerPage) {
	super();
	this.vocMsgPerPage = vocMsgPerPage;
	ProductPerPage = productPerPage;
	MemberPerPage = memberPerPage;
	ProductInfoPerPage = productInfoPerPage;
	CompanyPerPage = companyPerPage;
}

public int getVocMsgPerPage() {
	return vocMsgPerPage;
}

public void setVocMsgPerPage(int vocMsgPerPage) {
	this.vocMsgPerPage = vocMsgPerPage;
}

public int getProductPerPage() {
	return ProductPerPage;
}

public void setProductPerPage(int productPerPage) {
	ProductPerPage = productPerPage;
}

public int getMemberPerPage() {
	return MemberPerPage;
}

public void setMemberPerPage(int memberPerPage) {
	MemberPerPage = memberPerPage;
}

public int getProductInfoPerPage() {
	return ProductInfoPerPage;
}

public void setProductInfoPerPage(int productInfoPerPage) {
	ProductInfoPerPage = productInfoPerPage;
}

public int getCompanyPerPage() {
	return CompanyPerPage;
}

public void setCompanyPerPage(int companyPerPage) {
	CompanyPerPage = companyPerPage;
}


	
}

