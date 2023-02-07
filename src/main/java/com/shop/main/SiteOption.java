package com.shop.main;

public class SiteOption {

	private int vocMsgPerPage;
	private int ProductPerPage;
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}

	public SiteOption(int vocMsgPerPage, int productPerPage) {
		super();
		this.vocMsgPerPage = vocMsgPerPage;
		ProductPerPage = productPerPage;
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
	
}
