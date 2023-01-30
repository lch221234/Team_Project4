package com.shop.main.company;

import java.util.Date;

public class Company {
	/* 업체 아이디 */
	private int companyNumber;

	/* 업체 이름 */
	private String companyName;

	/* 국가 id */
	private String nationId;

	/* 업체 국가 */
	private String nationName;

	/* 업체 소개 */
	private String companyIntro;

	/* 등록 날짜 */
	private Date regDate;

	/* 수정 날짜 */
	private Date updateDate;
	
	public Company() {
		// TODO Auto-generated constructor stub
	}

	public Company(int companyNumber, String companyName, String nationId, String nationName, String companyIntro,
			Date regDate, Date updateDate) {
		super();
		this.companyNumber = companyNumber;
		this.companyName = companyName;
		this.nationId = nationId;
		this.nationName = nationName;
		this.companyIntro = companyIntro;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	public int getCompanyNumber() {
		return companyNumber;
	}

	public void setCompanyNumber(int companyNumber) {
		this.companyNumber = companyNumber;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getNationId() {
		return nationId;
	}

	public void setNationId(String nationId) {
		this.nationId = nationId;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getCompanyIntro() {
		return companyIntro;
	}

	public void setCompanyIntro(String companyIntro) {
		this.companyIntro = companyIntro;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
