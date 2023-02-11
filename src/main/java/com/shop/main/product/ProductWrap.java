package com.shop.main.product;

import java.util.Base64;

public class ProductWrap extends Product {
	private String product_img_base64;

	public ProductWrap(Product product) {
		super(product.getProduct_number(), product.getCategory_code(), product.getProduct_name(),
				product.getProduct_price(), product.getProduct_stock(), null);

		byte[] imgBytes = product.getProduct_img();
		if (imgBytes == null) {
			// 예외처리.
			this.product_img_base64 = "";
			return;
		}
		this.product_img_base64 = Base64.getEncoder().encodeToString(imgBytes);
	}
	
	public String getProduct_img_base64() {
		return product_img_base64;
	}
}
