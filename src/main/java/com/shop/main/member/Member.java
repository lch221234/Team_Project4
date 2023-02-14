package com.shop.main.member;

import java.math.BigDecimal;

public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_address;
	private String m_grade;
	private String m_sex;
	private BigDecimal m_money;
	private BigDecimal m_point;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_pw, String m_name, String m_address, String m_grade, String m_sex,
			BigDecimal m_money, BigDecimal m_point) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_grade = m_grade;
		this.m_sex = m_sex;
		this.m_money = m_money;
		this.m_point = m_point;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public BigDecimal getM_money() {
		return m_money;
	}

	public void setM_money(BigDecimal m_money) {
		this.m_money = m_money;
	}

	public BigDecimal getM_point() {
		return m_point;
	}

	public void setM_point(BigDecimal m_point) {
		this.m_point = m_point;
	}
	
	
}
