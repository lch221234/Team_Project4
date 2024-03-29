package com.shop.main.product;

import java.util.List;

public interface ProductMapper {
	public abstract List<Product> getProduct2(ProductSelector pSel);
	public abstract int productReg(Product p);
	public abstract int getAllProductCount();
	public abstract int getAllProductCounts();
	public abstract int getSearchProductCount(ProductSelector pSel);
	public abstract int productDel(Product p);
	public abstract int productModify(Product p);
	public abstract List<Product> getTop();
	public abstract List<Product> getBottom();
	public abstract List<Product> getShoes();
	public abstract List<Product> getCap();
	public abstract List<Product> getAccessory();
	public abstract List<Product> getAllCategories();
	

}
