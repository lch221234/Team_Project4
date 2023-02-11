package com.shop.main.product;

public class Product {
	private int product_number;
	private int category_code;
	private String product_name;
	private int product_price;
	private int product_stock;
	private byte[] product_img;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int product_number, int category_code, String product_name, int product_price, int product_stock,
			byte[] product_img) {
		super();
		this.product_number = product_number;
		this.category_code = category_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_img = product_img;
	}

	public int getProduct_number() {
		return product_number;
	}

	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public byte[] getProduct_img() {
		return product_img;
	}

	public void setProduct_img(byte[] product_img) {
		this.product_img = product_img;
	}
	
	
	
	
	
	

}
