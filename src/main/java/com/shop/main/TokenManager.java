package com.shop.main;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class TokenManager {

	public static void tokenManager(HttpServletRequest req) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");
		String token = sdf.format(date);
		req.setAttribute("token", token);
	}
}
