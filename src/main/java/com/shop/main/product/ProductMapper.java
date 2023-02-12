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
	

}
