package com.shop.main.business;

import java.util.Date;

public class Business {
	/* 업체 아이디 */
	private int businessNumber;

	/* 업체 이름 */
	private String businessName;

	/* 국가 id */
	private String nationId;

	/* 업체 국가 */
	private String nationName;

	/* 업체 소개 */
	private String businessIntro;

	/* 등록 날짜 */
	private Date regDate;

	/* 수정 날짜 */
	private Date updateDate;
	
	public Business() {
		// TODO Auto-generated constructor stub
	}

	public Business(int businessNumber, String businessName, String nationId, String nationName, String businessIntro,
			Date regDate, Date updateDate) {
		super();
		this.businessNumber = businessNumber;
		this.businessName = businessName;
		this.nationId = nationId;
		this.nationName = nationName;
		this.businessIntro = businessIntro;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	public int getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(int businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
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

	public String getBusinessIntro() {
		return businessIntro;
	}

	public void setBusinessIntro(String businessIntro) {
		this.businessIntro = businessIntro;
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
