package com.admin.main;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class AdminController {
	// 이부분오류 고쳐지면 주석 삭제
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String adminMainGet(Locale locale, Model model) {
		return "/admin/main";
	}
	
	
}
