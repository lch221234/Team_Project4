package com.shop.main.product;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.main.SiteOption;

@Service
public class ProductDAO {
	private int allProductCount;
	private int allProductCounts;

	@Autowired
	private SqlSession ss;

	@Autowired
	private SiteOption so2;

	@Autowired
	private SiteOption so4;

	// 상품 등록
	public void ProductReg(Product p, HttpServletRequest req) {
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/img");
			MultipartRequest mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
//			p.setProduct_name(req.getParameter("p_n"));
//			BigDecimal p_c_c = new BigDecimal(req.getParameter("p_c_c"));
//			p.setCategory_code(p_c_c);
//			p.setCategory_code(new BigDecimal(req.getParameter("p_c_c"))); // 실패 DB Nullpoint
//			p.setProduct_price(new BigDecimal(req.getParameter("p_p")));
//			p.setProduct_stock(new BigDecimal(req.getParameter("p_s")));

//			p.setCategory_code(new BigDecimal(req.getParameter("p_c_c").trim())); // 실패 DB Nullpoint
//			p.setProduct_price(new BigDecimal(req.getParameter("p_p").trim()));
//			p.setProduct_stock(new BigDecimal(req.getParameter("p_s").trim()));

//			p.setCategory_code(new Integer(req.getParameter("p_c_c")));
//			p.setProduct_price(new Integer(req.getParameter("p_p")));
//			p.setProduct_stock(new Integer(req.getParameter("p_s")));
//			
//			p.setCategory_code(Integer.parseInt(req.getParameter("p_c_c").trim())); // 실패 DB
//			p.setProduct_price(Integer.parseInt(req.getParameter("p_p").trim()));
//			p.setProduct_stock(Integer.parseInt(req.getParameter("p_s").trim()));
			p.setProduct_name(mr.getParameter("p_n"));
			p.setCategory_code(new BigDecimal(mr.getParameter("p_c_c"))); // 실패 Nullpointerexception
			p.setProduct_price(new BigDecimal(mr.getParameter("p_p")));
			p.setProduct_stock(new BigDecimal(mr.getParameter("p_s")));
			File img = mr.getFile("p_i");
			if (img == null) {
				// 예외처리
			}
			byte[] imgBytes = new byte[(int) img.length()];
			FileInputStream stream = new FileInputStream(img);
			stream.read(imgBytes);
			stream.close();

			p.setProduct_img(imgBytes);

			ss.getMapper(ProductMapper.class).productReg(p);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 상품 개수
	public void countAllProduct() {
		allProductCount = ss.getMapper(ProductMapper.class).getAllProductCount();
	}

	public void countAllProducts() {
		allProductCounts = ss.getMapper(ProductMapper.class).getAllProductCount();
	}

	// 상품 검색
	public void searchProduct(HttpServletRequest req) {
		req.getSession().setAttribute("search", req.getParameter("search"));
	}

	// 상품 검색
	public void searchProduct2(HttpServletRequest req) {
		req.getSession().setAttribute("search2", req.getParameter("productSearch"));
	}

	// 상품 검색 초기화
	public void searchClearPD(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}

	// 검색한 상품 가져오기
	public void getProduct2(int page, HttpServletRequest req) {
		req.setAttribute("curPage", page);
		int productCount = 0;
		String search = (String) req.getSession().getAttribute("search");
		if (search == null) {
			productCount = allProductCount;
			search = "";
		} else {
			ProductSelector pSel2 = new ProductSelector(search, 0, 0);
			productCount = ss.getMapper(ProductMapper.class).getSearchProductCount(pSel2);
		}
		int allPageCount = (int) Math.ceil((double) productCount / so2.getProductPerPage());
		req.setAttribute("allProductCount", allPageCount);

		int start = (page - 1) * so2.getProductPerPage() + 1;
		int end = (page == allPageCount) ? productCount : start + so2.getProductPerPage() - 1;

		ProductSelector pSel = new ProductSelector(search, start, end);
		List<Product> products = ss.getMapper(ProductMapper.class).getProduct2(pSel);
		List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
		for (Product p : products) {
			productWraps.add(new ProductWrap(p));
		}

		req.setAttribute("productsss", productWraps);
	}

	// 상품 수정 삭제 하는곳에서 검색하기
	public void getSearchProuct(int page, HttpServletRequest req) {
		req.setAttribute("curPage2", page);
		String search = (String) req.getSession().getAttribute("search2");
		int productCount = 0;
		if (search == null) {
			productCount = allProductCount;
			search = "";
		} else {
			ProductSelector pSel2 = new ProductSelector(search, 0, 0);
			productCount = ss.getMapper(ProductMapper.class).getSearchProductCount(pSel2);
		}
		int allProductCount = (int) Math.ceil((double) productCount / so4.getProductInfoPerPage());
		req.setAttribute("allProductInfoCount", allProductCount);

		int start = (page - 1) * so4.getProductInfoPerPage() + 1;
		int end = (page == allProductCount) ? productCount : start + so4.getProductInfoPerPage() - 1;
		ProductSelector pSel = new ProductSelector(search, start, end);
		List<Product> products = ss.getMapper(ProductMapper.class).getProduct2(pSel);
		req.setAttribute("productssss", products);
	}

//		// 상품 삭제
	public void ProductDel(Product p, HttpServletRequest req) {
		try {
			String[] value = req.getParameterValues("RowCheck");
			if (value != null) {
				for (String s : value) {
					p.setProduct_number(new BigDecimal(s));
					if (ss.getMapper(ProductMapper.class).productDel(p) == 1) {
						allProductCount--;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//		// 상품 수정 -- 미완성(사진 고민중)
//		public void ProductUpdate(Product p, HttpServletRequest req) {
//			try {
//				String [] p_n = req.getParameterValues("product_name");
//				if (p_n != null) {
//					for (String s : p_n) {
//						p.setProduct_name(s);
//					}
//				}
//				ss.getMapper(ProductMapper.class).productModify(p);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}

}
