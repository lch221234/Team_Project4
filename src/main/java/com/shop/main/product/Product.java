package com.shop.main.product;

import java.math.BigDecimal;

public class Product {
	private BigDecimal product_number;
	private BigDecimal category_code;
	private String product_name;
	private BigDecimal product_price;
	private BigDecimal product_stock;
	private String product_img;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(BigDecimal product_number, BigDecimal category_code, String product_name, BigDecimal product_price,
			BigDecimal product_stock, String product_img) {
		super();
		this.product_number = product_number;
		this.category_code = category_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_img = product_img;
	}

	public BigDecimal getProduct_number() {
		return product_number;
	}

	public void setProduct_number(BigDecimal product_number) {
		this.product_number = product_number;
	}

	public BigDecimal getCategory_code() {
		return category_code;
	}

	public void setCategory_code(BigDecimal category_code) {
		this.category_code = category_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public BigDecimal getProduct_price() {
		return product_price;
	}

	public void setProduct_price(BigDecimal product_price) {
		this.product_price = product_price;
	}

	public BigDecimal getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(BigDecimal product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	

}
