package com.shop.main.product;

public class ProductSelector {
	private String search;
	private int start;
	private int end;
	
	public ProductSelector() {
		// TODO Auto-generated constructor stub
	}

	public ProductSelector(String search, int start, int end) {
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
