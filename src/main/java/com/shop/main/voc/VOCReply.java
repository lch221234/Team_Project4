package com.shop.main.voc;

import java.math.BigDecimal;
import java.util.Date;

public class VOCReply {

	private BigDecimal vr_no;
	private BigDecimal vr_v_no;
	private String vr_owner;
	private String vr_txt;
	private Date vr_when;
	
	public VOCReply() {
		// TODO Auto-generated constructor stub
	}

	public VOCReply(BigDecimal vr_no, BigDecimal vr_v_no, String vr_owner, String vr_txt, Date vr_when) {
		super();
		this.vr_no = vr_no;
		this.vr_v_no = vr_v_no;
		this.vr_owner = vr_owner;
		this.vr_txt = vr_txt;
		this.vr_when = vr_when;
	}

	public BigDecimal getVr_no() {
		return vr_no;
	}

	public void setVr_no(BigDecimal vr_no) {
		this.vr_no = vr_no;
	}

	public BigDecimal getVr_v_no() {
		return vr_v_no;
	}

	public void setVr_v_no(BigDecimal vr_v_no) {
		this.vr_v_no = vr_v_no;
	}

	public String getVr_owner() {
		return vr_owner;
	}

	public void setVr_owner(String vr_owner) {
		this.vr_owner = vr_owner;
	}

	public String getVr_txt() {
		return vr_txt;
	}

	public void setVr_txt(String vr_txt) {
		this.vr_txt = vr_txt;
	}

	public Date getVr_when() {
		return vr_when;
	}

	public void setVr_when(Date vr_when) {
		this.vr_when = vr_when;
	}
	
	
	
	
	
	
	
	
	
}