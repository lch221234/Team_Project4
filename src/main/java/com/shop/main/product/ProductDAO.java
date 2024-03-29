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
import com.shop.main.member.Member;
import com.shop.main.member.MemberMapper;

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
			String path= req.getSession().getServletContext().getRealPath("resources/img");
			MultipartRequest mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
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
			p.setCategory_code(new BigDecimal(mr.getParameter("p_c_c")));  // 실패 Nullpointerexception
			p.setProduct_price(new BigDecimal(mr.getParameter("p_p")));
			p.setCompany_number(new BigDecimal(mr.getParameter("c_n")));
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
			allProductCounts = ss.getMapper(ProductMapper.class).getAllProductCounts();	// 맵퍼에 따로 만들어줘야함
		}
		
		// 상품 검색
		public void searchProduct(HttpServletRequest req) {
			req.getSession().setAttribute("search", req.getParameter("search"));
		}
		// 수정상품 검색
		public void searchProduct2(HttpServletRequest req) {
			req.getSession().setAttribute("search2", req.getParameter("productSearch")); // 여기서 search2로 들어갔으니까
		}
		
		// 상품 검색 초기화
		public void searchClearPD(HttpServletRequest req) {
			req.getSession().setAttribute("search", null);
		}
		
		// 수정상품 검색 초기화	
		public void searchClearPD2(HttpServletRequest req) {
			req.getSession().setAttribute("search2", null);	// 초기화도 search2로 들어가야되기 때문에 새로 파야함 - 성신
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
			req.setAttribute("allProductCount", allProductCount);
			
			int start = (page -1) * so4.getProductInfoPerPage() + 1;
			int end = (page == allProductCount) ? productCount : start + so4.getProductInfoPerPage() -1;
			ProductSelector pSel = new ProductSelector(search, start, end);
			List<Product> products = ss.getMapper(ProductMapper.class).getProduct2(pSel);
			List<ProductWrap> productWrapss = new ArrayList<ProductWrap>(products.size());
			for (Product p : products) {
				productWrapss.add(new ProductWrap(p));
			}
			req.setAttribute("productssss", productWrapss);
		}
		
		public void productBuy(Member m, HttpServletRequest req) {
			int money = Integer.parseInt(req.getParameter("have_money"));
			int payment_money = 0;
			double get_point = Double.parseDouble(req.getParameter("have_point"));
			try {
				String [] price = req.getParameterValues("product_price");
				if (price != null) {
					for (String s : price) {
						payment_money+= Integer.parseInt(s);
						get_point+= Integer.parseInt(s)*0.1;
					}
					int result = (money - payment_money);
						if (result >=0) {
							Member m2 = (Member)req.getSession().getAttribute("loginMember");
							m.setM_id(req.getParameter("getId"));
							m.setM_pw(m2.getM_pw());
							m.setM_name(m2.getM_name());
							m.setM_address(m2.getM_address());
							m.setM_sex(m2.getM_sex());
							m.setM_grade(m2.getM_grade());
							m.setM_money(new BigDecimal(money-(payment_money)));
							m.setM_point(new BigDecimal(get_point));
							if (ss.getMapper(MemberMapper.class).update(m)==1) {
								req.getSession().setAttribute("loginMember", m);
						}	
					} else if (result < 0) {
						req.setAttribute("r", "잔액부족");
					}
				} else if (price == null) {
					System.out.println("null");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
//		// 상품 삭제
		public void ProductDel(Product p, HttpServletRequest req) {
			try {
				String [] value = req.getParameterValues("RowCheck");
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
		
		// 상품 수정 -- 미완성(사진 고민중)
		public void ProductUpdate(Product p, HttpServletRequest req) {
			try {
				p.setProduct_number(new BigDecimal(req.getParameter("RowCheck")));
				p.setProduct_name(req.getParameter("product_name"));
				p.setCategory_code(new BigDecimal(req.getParameter("category_code")));
				p.setProduct_price(new BigDecimal(req.getParameter("product_price")));
				p.setProduct_stock(new BigDecimal(req.getParameter("product_stock")));
				
				ss.getMapper(ProductMapper.class).productModify(p);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 카테고리별 상품 가져오기
		public void getAllCategories(HttpServletRequest req) {
			List<Product> products = ss.getMapper(ProductMapper.class).getAllCategories();
			List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
			for (Product p : products) {
				productWraps.add(new ProductWrap(p));
			}
			req.setAttribute("getAll", productWraps);
				
		}
		
		public void getTop(HttpServletRequest req) {
			try {
				List<Product> products = ss.getMapper(ProductMapper.class).getTop();
				List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
			      for (Product p : products) {
			         productWraps.add(new ProductWrap(p));
			      }

			      req.setAttribute("getTop", productWraps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getBottom(HttpServletRequest req) {
			try {
				List<Product> products = ss.getMapper(ProductMapper.class).getBottom();
				List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
			      for (Product p : products) {
			         productWraps.add(new ProductWrap(p));
			      }

			      req.setAttribute("getBottom", productWraps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getShoes(HttpServletRequest req) {
			try {
				List<Product> products = ss.getMapper(ProductMapper.class).getShoes();
				List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
			      for (Product p : products) {
			         productWraps.add(new ProductWrap(p));
			      }

			      req.setAttribute("getShoes", productWraps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getCap(HttpServletRequest req) {
			try {
				List<Product> products = ss.getMapper(ProductMapper.class).getCap();
				List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
			      for (Product p : products) {
			         productWraps.add(new ProductWrap(p));
			      }

			      req.setAttribute("getCap", productWraps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getAccessory(HttpServletRequest req) {
			try {
				List<Product> products = ss.getMapper(ProductMapper.class).getAccessory();
				List<ProductWrap> productWraps = new ArrayList<ProductWrap>(products.size());
			      for (Product p : products) {
			         productWraps.add(new ProductWrap(p));
			      }

			      req.setAttribute("getAccessory", productWraps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
