package com.shop.main.company;

public class CompanySelector {
	private String search;
	private int start;
	private int end;
	
	
	public CompanySelector() {
		// TODO Auto-generated constructor stub
	}


	public CompanySelector(String search, int start, int end) {
		super();
		this.search = search;
		this.start = start;
		this.end = end;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
	
	
}
