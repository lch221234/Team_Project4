package com.shop.main.voc;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.main.SiteOption;
import com.shop.main.member.Member;

@Service
public class VOCDAO {
	private int allMsgCount;
	private String[] colors;
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private SiteOption so;
	
	public VOCDAO() { // writeMsg method에서 활용! 랜덤칼라 별로면 안해도 됨
		colors = new String[] { "#F44336", "#43A047", "#FF9800", "#795548", "#E91E63", "#009688"};
	}
	
	public void countAllMsg1() {
		allMsgCount = ss.getMapper(VOCMapper.class).getAllMsgCount1();
	}
	
	public void deleteMsg1(VOCMsg vm, HttpServletRequest req) {
		try {
			if (ss.getMapper(VOCMapper.class).deleteMsg1(vm) == 1) {
				allMsgCount--;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
	}
	
	public void deleteReply1(VOCReply vr, HttpServletRequest req) {
		try {
			ss.getMapper(VOCMapper.class).deleteReply1(vr);
				
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public void getMsg1(int page, HttpServletRequest req) {
		req.setAttribute("curPage", page);
		
		String search = (String) req.getSession().getAttribute("search");	// 검색어
		int msgCount = 0;
		if(search == null) {	// 전체조회
			msgCount = allMsgCount;
			search = "";
		} else {	// 검색
			VOCSelector vSel2 = new VOCSelector(search, 0, 0);
			msgCount = ss.getMapper(VOCMapper.class).getSearchMsgCount1(vSel2);
		}
	
		
		int allPageCount = (int) Math.ceil((double) msgCount / so.getVocMsgPerPage());
		req.setAttribute("allPageCount", allPageCount);
		
		int start = (page - 1) * so.getVocMsgPerPage() + 1;
		int end = (page == allPageCount) ? msgCount : start + so.getVocMsgPerPage() - 1;
		
		VOCSelector vSel = new VOCSelector(search, start, end);
		List<VOCMsg> vocMsgs = ss.getMapper(VOCMapper.class).getMsg1(vSel);
		
		// reply부분 
		for (VOCMsg vocMsg : vocMsgs) {
			vocMsg.setV_replys(ss.getMapper(VOCMapper.class).getReply1(vocMsg));
		}
		req.setAttribute("msgs", vocMsgs);
	}
	
	public void searchClear1(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}
	
	public void searchMsg1(HttpServletRequest req) {
		String search = req.getParameter("search");
		req.getSession().setAttribute("search", search);
	}
	
	public void updateMsg1(VOCMsg vm, HttpServletRequest req) {
		try {
			ss.getMapper(VOCMapper.class).updateMsg1(vm);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void updateReply1(VOCReply vr, HttpServletRequest req) {		
		try {
			ss.getMapper(VOCMapper.class).updateReply1(vr);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void writeMsg1(VOCMsg vm, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			
			String st2 = (String) req.getSession().getAttribute("st");
			
			if (st2 != null && token.equals(st2)) {
				return;
			}
			
			Member m = (Member) req.getSession().getAttribute("loginMember");
			vm.setM_id(m.getM_id()); 	// 로그인  한 사람과 글쓴 사람이 동일
			vm.setV_color(colors[new Random().nextInt(colors.length)]);
			String txt = vm.getV_txt();
			txt = txt.replace("\r\n", "<br>");
			vm.setV_txt(txt);
			
			if (ss.getMapper(VOCMapper.class).writeMsg1(vm) == 1) {
				req.getSession().setAttribute("st", token);
				allMsgCount++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
	
	public void writeReply1(VOCReply vr, HttpServletRequest req) {
		try {
			String token = req.getParameter("token");
			String st2 = (String) req.getSession().getAttribute("st");
			if(st2 != null && token.equals(st2)) {
				return;
			}
			
			Member m = (Member)req.getSession().getAttribute("loginMember");
			vr.setVr_owner(m.getM_id());
			
			if (ss.getMapper(VOCMapper.class).writeReply1(vr) == 1) {
				req.getSession().setAttribute("st", token);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	
	
	
	
	
	
}
