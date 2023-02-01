package com.shop.main.productcategory;

import java.util.List;

public interface ProductCategoryMapper {
	public abstract List<ProductCategory> getCategory();
	public abstract int categoryReg(ProductCategory pc);
	public abstract int categoryDel(ProductCategory pc);
}
