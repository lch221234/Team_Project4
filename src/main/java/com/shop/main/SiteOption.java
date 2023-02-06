package com.shop.main;

public class SiteOption {

	private int vocMsgPerPage;
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}
	
	public SiteOption(int vocMsgPerPage) {
		super();
		this.vocMsgPerPage = vocMsgPerPage;
	}
	
	public int getVocMsgPerPage() {
		return vocMsgPerPage;
	}
	
	public void setVocMsgPerPage(int vocMsgPerPage) {
		this.vocMsgPerPage = vocMsgPerPage; 
	}
}
