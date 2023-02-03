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

	// 로그인  --성현
	public void login(Member m, HttpServletRequest req) {
		try {
			m.setM_id(req.getParameter("id_input"));
			m.setM_pw(req.getParameter("pw_input"));
			List<Member> mb = ss.getMapper(MemberMapper.class).getId(m);
			if (mb.size() != 0) {
				Member mbr = mb.get(0);
				if (mbr.getM_pw().equals(m.getM_pw())) {
					req.getSession().setAttribute("loginMember", mbr);
					req.getSession().setMaxInactiveInterval(15 * 60);
					req.setAttribute("result", "1"); // 로그인 잘못되었을때 뜰 수 있게 추가 (01/16) -장창호
				} else {
					req.setAttribute("result", "사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
				}
			} else {
				req.setAttribute("result", "계정을 찾을 수 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "시스템에 오류가 발생했습니다.");
		}
	}

	// 로그인체크 -- 성현
	public boolean loginChk(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			return true;
			
		} else {
			return false;
		}
	}
	
	// 로그아웃 -- 성현
	public void logOut(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

	// 회원가입 -- 성현
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
	
	// id 중복체크 -- 성현
	public Members doubleChk(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getId(m));
	}

	// addr에 정보담기 -- 성신
	public void divideAddress(HttpServletRequest req) {
		Member m = (Member)req.getSession().getAttribute("loginMember");
		String address = m.getM_address();
		String [] address2 = address.split("!");
		req.setAttribute("addr", address2);
	}
	
	// 회원정보수정  -- 성현
	public void update(Member m, HttpServletRequest req) {
		try {
			String u_address1 = req.getParameter("address_input1");
			String u_address2 = req.getParameter("address_input2");
			String u_address3 = req.getParameter("address_input3");
			String u_m_address = (u_address1 + "!" + u_address2 +"!"+ u_address3);
			
			m.setM_id(req.getParameter("id_input"));
			m.setM_pw(req.getParameter("pw_input"));
			m.setM_name(req.getParameter("user_input"));
			m.setM_address(u_m_address);
			m.setM_sex(req.getParameter("gender_radio"));
			
			ss.getMapper(MemberMapper.class).update(m);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 탈퇴 -- 성현
	public void delete(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		try {
			ss.getMapper(MemberMapper.class).delete(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 불러오기
		public void listMember(Member inputM, HttpServletRequest req) {
				List<Member> load = ss.getMapper(MemberMapper.class).getMember(inputM);
				req.setAttribute("list", load);
		}
		
		// 회원 검색하기
//		public void findMember(Member inputM, HttpServletRequest req) {
//			String search = (String) req.getSession().getAttribute("search"); // 검색어
//			if (search == null) { // 전체조회
//				search = "";
//			} else { // 검색
////				MemberSelector mSel = new MemberSelector(search);
//			}
	//
//			MemberSelector mSel2 = new MemberSelector(search);
	//
//			List<Member> load = ss.getMapper(MemberMapper.class).searchMember(mSel2);
//			req.setAttribute("list", load);
//		}
}
