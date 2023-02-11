package com.shop.main;

public class SiteOption {

	private int vocMsgPerPage;
	private int ProductPerPage;
	private int MemberPerPage;
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}

	public SiteOption(int vocMsgPerPage, int productPerPage, int memberPerPage) {
		super();
		this.vocMsgPerPage = vocMsgPerPage;
		ProductPerPage = productPerPage;
		MemberPerPage = memberPerPage;
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
	
	
	
}
