package com.shop.main.product;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDAO {

	@Autowired
	private SqlSession ss;
	
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
			p.setCategory_code(Integer.parseInt(mr.getParameter("p_c_c")));  // 실패 Nullpointerexception
			p.setProduct_price(Integer.parseInt(mr.getParameter("p_p")));
			p.setProduct_stock(Integer.parseInt(mr.getParameter("p_s")));
			
			String p_img = mr.getFilesystemName("p_i");
			String p_img_kor = URLEncoder.encode(p_img, "utf-8").replace("+", "");
			p.setProduct_img(p_img_kor);
			
			ss.getMapper(ProductMapper.class).productReg(p);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 상품 삭제
	public void ProductDel(Product p, HttpServletRequest req) {
		try {
			if (ss.getMapper(ProductMapper.class).productDel(p) == 1) {
				String d_p_i = p.getProduct_img();
				d_p_i = URLDecoder.decode(d_p_i, "utf-8");
				
				String path = req.getSession().getServletContext().getRealPath("resources/img");
				new File(path + "/" + d_p_i).delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 상품 수정 -- 미완성
	public void ProductUpdate(Product p, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			p.setProduct_name(mr.getParameter("p_n"));
			p.setCategory_code(Integer.parseInt(mr.getParameter("p_c_c")));
			p.setProduct_price(Integer.parseInt(mr.getParameter("p_p")));
			p.setProduct_stock(Integer.parseInt(mr.getParameter("p_s")));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}