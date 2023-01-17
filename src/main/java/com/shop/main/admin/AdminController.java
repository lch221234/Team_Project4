package com.shop.main.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value = "admin.go", method = RequestMethod.GET)
	public String goAdmin() {
		return "admin/main";
	}
}
