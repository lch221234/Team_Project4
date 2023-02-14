package com.shop.main.member;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.main.SiteOption;

@Service
public class MemberDAO {

	private int allMemberCount;
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private SiteOption so3;

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
			m.setM_grade(req.getParameter("member_grade"));
			m.setM_money(new BigDecimal(req.getParameter("money_input")));
			m.setM_point(new BigDecimal(req.getParameter("point_input")));
			
			if (ss.getMapper(MemberMapper.class).update(m)==1) {
				req.getSession().setAttribute("loginMember", m);
			}
			
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
	
	/* 회원 목록 */

	// 회원 불러오기
	//public void listMember(Member inputM, HttpServletRequest req) {
	//		List<Member> load = ss.getMapper(MemberMapper.class).getMember(inputM);
	//		req.setAttribute("list", load);
	//}
	
	// 회원 count
	public void countAllMember() {
		allMemberCount = ss.getMapper(MemberMapper.class).getAllMemberCount();
	}
	
	// 회원 목록 불러오기
	public void getMember1(Member m, int page, HttpServletRequest req) {
		
		
		req.setAttribute("curPage", page);
		
		String search = (String) req.getSession().getAttribute("search");
		String type = req.getParameter("type");
		
		int memberCount = 0;
		if(search == null) {
			memberCount = allMemberCount;
			search = "";
		} else {
			MemberSelector mSel2 = new MemberSelector(search, 0, 0);
			memberCount = ss.getMapper(MemberMapper.class).getSearchMemberCount(mSel2); 
		}
		
		int allPageCount = (int) Math.ceil((double) memberCount / so3.getMemberPerPage());
		req.setAttribute("allPageCount", allPageCount);
		
		int start = (page - 1) * so3.getMemberPerPage() + 1;
		int end = (page == allPageCount) ? memberCount : start + so3.getMemberPerPage() - 1;
		
		MemberSelector mSel = new MemberSelector(search, start, end);
		List<Member> members = null;
		if (type == null || type.equals("all")) {
			members = ss.getMapper(MemberMapper.class).getMember1(mSel);
		} else if (type.equals("m_name")) {
			m.setM_name(search);
			members = ss.getMapper(MemberMapper.class).getMember2(mSel);
		} else if (type.equals("m_address")) {
			m.setM_address(search);
			members = ss.getMapper(MemberMapper.class).getMember3(mSel);
		} else if (type.equals("m_grade")) {
			m.setM_grade(search);
			members = ss.getMapper(MemberMapper.class).getMember4(mSel);
		} else if (type.equals("m_sex")) {
			m.setM_sex(search);
			members = ss.getMapper(MemberMapper.class).getMember5(mSel);
		} 
		
		req.setAttribute("members", members);
	} 
	
	// 회원 검색 초기화
	public void searchClear(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}
	
	// 회원검색
	public void searchMember(HttpServletRequest req) {
		String search = req.getParameter("search");
		req.getSession().setAttribute("search", search);
	}
}
