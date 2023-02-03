package com.shop.main.productcategory;

import java.util.List;

public class ProductCategories {
	private List<ProductCategory> productCategory;
	
	public ProductCategories() {
		// TODO Auto-generated constructor stub
	}

	public ProductCategories(List<ProductCategory> productCategory) {
		super();
		this.productCategory = productCategory;
	}

	public List<ProductCategory> getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(List<ProductCategory> productCategory) {
		this.productCategory = productCategory;
	}
	
}
