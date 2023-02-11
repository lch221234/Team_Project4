package com.shop.main.productcategory;

public class ProductCategory {
	private int category_code;
	private String category_name;
	public ProductCategory(int category_code, String category_name) {
		super();
		this.category_code = category_code;
		this.category_name = category_name;
	}
	
	public ProductCategory() {
		// TODO Auto-generated constructor stub
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
}
