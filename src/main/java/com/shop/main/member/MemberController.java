package com.shop.main.member;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet(Locale locale, Model model) {
//		System.out.println("회원가입이동");//이동이 되는지 확인하기위해서 작성
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
		mDAO.loginChk(req);
		return "main";
	}
	

	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logOut(HttpServletRequest req) {
		mDAO.logOut(req);
		mDAO.loginChk(req);
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
//	@RequestMapping(value="naverSave", method=RequestMethod.POST)
//	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {
//	System.out.println("#############################################");
//	System.out.println(n_age);
//	System.out.println(n_email);
//	System.out.println(n_gender);
//	System.out.println(n_id);
//	System.out.println(n_name);
//	System.out.println(n_nickName);
//	System.out.println("#############################################");
//
//	NaverDTO naver = new NaverDTO();
//	
//	
///*	여긴 왜 오류가 나는걸까
// * 
// * naver.setN_age(n_age);
////	naver.setN_email(n_email);
////	naver.setN_gender(n_gender);
////	naver.setN_id(n_id);
////	naver.setN_name(n_name);
////	naver.setN_nickName(n_nickName);
//	naver.setN_age(n_age);
//*/
//   
//	// ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
//	String result = "no";
//    
//	if(naver!=null) {
//		// naver가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
//		result = "ok";
//	}
//
//	return result;
//    
//	}
//	일단 안되는건 전부 주석으로 변경(1/11) 찬호
	
	
}
