package com.shop.main;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
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

}
