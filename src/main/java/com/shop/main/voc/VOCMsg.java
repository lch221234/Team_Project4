package com.shop.main.voc;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class VOCMsg {

	// member
	private String m_id;
	private String m_name;
	
	// voc
	private BigDecimal v_no;
	private String v_txt;
	private Date v_when;
	private String v_color;
	
	private List<VOCReply> v_replys; // 댓글들
	
	public VOCMsg() {
		// TODO Auto-generated constructor stub
	}

	public VOCMsg(String m_id, String m_name, BigDecimal v_no, String v_txt, Date v_when, String v_color,
			List<VOCReply> v_replys) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.v_no = v_no;
		this.v_txt = v_txt;
		this.v_when = v_when;
		this.v_color = v_color;
		this.v_replys = v_replys;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public BigDecimal getV_no() {
		return v_no;
	}

	public void setV_no(BigDecimal v_no) {
		this.v_no = v_no;
	}

	public String getV_txt() {
		return v_txt;
	}

	public void setV_txt(String v_txt) {
		this.v_txt = v_txt;
	}

	public Date getV_when() {
		return v_when;
	}

	public void setV_when(Date v_when) {
		this.v_when = v_when;
	}

	public String getV_color() {
		return v_color;
	}

	public void setV_color(String v_color) {
		this.v_color = v_color;
	}

	public List<VOCReply> getV_replys() {
		return v_replys;
	}

	public void setV_replys(List<VOCReply> v_replys) {
		this.v_replys = v_replys;
	}
	
	
	
	
	
}