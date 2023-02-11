package com.shop.main.voc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.main.TokenManager;
import com.shop.main.member.MemberDAO;

@Controller
public class VOCController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private VOCDAO vDAO;
	
	private boolean isFirstReq;
	
public VOCController() {
	isFirstReq = true;
}

	@RequestMapping(value = "/voc.go", method = RequestMethod.GET)
	public String voc(HttpServletRequest req) {
		if (isFirstReq) {	
			vDAO.countAllMsg1();
			isFirstReq = false;	
		}
		mDAO.loginChk(req);
		vDAO.searchClear1(req);
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}

	@RequestMapping(value = "/voc.delete", method = RequestMethod.GET)
	public String vocDelete(VOCMsg vm, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			vDAO.deleteMsg1(vm, req);
		}
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}
	
	@RequestMapping(value = "/voc.page.change", method = RequestMethod.GET)
	public String vocPageChange(HttpServletRequest req) {
		mDAO.loginChk(req);
		int p = Integer.parseInt(req.getParameter("p"));
		vDAO.getMsg1(p, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}

	@RequestMapping(value = "/voc.reply.delete", method = RequestMethod.GET)
	public String vocReplyDelete(VOCReply vr, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			vDAO.deleteReply1(vr, req);
		}
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}

	
	@RequestMapping(value = "/voc.reply.write", method = RequestMethod.POST)
	public String vocReplyWrite(VOCReply vr, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			vDAO.writeReply1(vr, req);
		}
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}
	
	@RequestMapping(value = "/voc.search", method = RequestMethod.POST)
	public String vocSearch(HttpServletRequest req) {
		mDAO.loginChk(req);
		vDAO.searchMsg1(req);
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}
	
	
	
	@RequestMapping(value = "/voc.update", method = RequestMethod.GET)
	public String voc(VOCMsg vm, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			vDAO.updateMsg1(vm, req);
		}
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}
	
	@RequestMapping(value = "/voc.reply.update", method = RequestMethod.GET)
	public String voc(VOCReply vr, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			vDAO.updateReply1(vr, req);
		}
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	}
	
	@RequestMapping(value = "/voc.write", method = RequestMethod.POST)
	public String vocWrite(VOCMsg vm, HttpServletRequest req) {
		if (mDAO.loginChk(req)) {
			vDAO.writeMsg1(vm, req);
		}
		vDAO.getMsg1(1, req);
		TokenManager.tokenManager(req);
		return "VOC/voc";
	} 


}
