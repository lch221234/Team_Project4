package com.shop.main.member;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet(Locale locale, Model model) {
//		System.out.println("회원가입이동"); //이동이 되는지 확인하기위해서 작성
		return "/member/join";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginGet(Locale locale, Model model) {
//		System.out.println("로그인이동");
		return "/member/login";
	}
	
	@RequestMapping(value = "member.SuccessJoin", method = RequestMethod.POST)
	public String joinSuccess(Member m, HttpServletRequest req) {
		mDAO.signup(m, req);
		return "main";
	}
	
	@RequestMapping(value = "member.SuccessLogin", method = RequestMethod.POST)
	public String loginSuccess(Member m, HttpServletRequest req) {
		mDAO.login(m, req);
		// 로그인 틀렸을때도 넘어가지는거 고쳐봤습니다.(01/16) -장창호
		if(mDAO.loginChk(req)) { // DAO에서 로그인체크가 true면 main으로 반환
			return "main";			
		} else {
			return "/member/login"; // false면 다시 login화면
		}
	}
	
	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logOut(HttpServletRequest req) {
		mDAO.logOut(req);
		mDAO.loginChk(req);
		return "main";
	}
	
	@RequestMapping(value = "member.info.go", method = RequestMethod.GET)
	public String goInfo(HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			mDAO.divideAddress(req);
			return "/member/info";
		} 
		return "main";
	}
	
	@RequestMapping(value = "member.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req) {
		mDAO.loginChk(req);
		mDAO.divideAddress(req);
		mDAO.update(m, req);
		mDAO.logOut(req);  // 로그아웃 안하면 main.jsp에 수정 전 정보로 표시돼서  다시 로그인 하도록 자동 로그아웃 설정했습니다  --성현
		return "main";
	}
	
	@RequestMapping(value = "/member.delete", method = RequestMethod.GET)
	public String memberDelete(Member m, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			mDAO.delete(req);
			mDAO.logOut(req);
			mDAO.loginChk(req);
		}
		return "main";
	}	
		
//	// 여기서부터  네이버로그인 callback (shin)
//	
//	
//	@RequestMapping(value="callBack", method=RequestMethod.GET)	
//	public String callBack(){
//		return "member/callBack";
//	}
//	
//	

	
	
}
