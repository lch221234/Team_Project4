package com.shop.main.product;

import java.util.List;

public interface ProductMapper {
	public abstract List<Product> getProduct();
	public abstract int productReg(Product p);
	public abstract int getAllProductCount();
	public abstract int getSearchProductCount(ProductSelector pSel);
	public abstract List<Product> getSearchProduct(ProductSelector pSel);
	

}
