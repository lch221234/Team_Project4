package com.shop.main.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	
	@Autowired
	private SqlSession ss;
	
	// 로그인
	public void login(Member m, HttpServletRequest req) {
		try {
			List<Member> mb = ss.getMapper(MemberMapper.class).getId(m);
			if (mb.size() != 0) {
				Member mbr = mb.get(0);
				if (mbr.getM_pw().equals(m.getM_pw())) {
					
				}
			}
		} catch (Exception e) {
		}
	}
	
	
	// 회원가입
	public void signup(Member m, HttpServletRequest req) {
		try {	

			String address1 = req.getParameter("address_input1");
			String address2 = req.getParameter("address_input2");
			String address3 = req.getParameter("address_input3");
			String m_address = (address1 + "!" + address2 + "!" + address3);
			
			m.setM_id(req.getParameter("id_input"));
			m.setM_pw(req.getParameter("pw_input"));
			m.setM_name(req.getParameter("user_input"));
			m.setM_address(m_address);
			m.setM_sex(req.getParameter("gender_radio"));
			
			ss.getMapper(MemberMapper.class).signup(m);
						
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
