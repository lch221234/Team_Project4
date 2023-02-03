package com.shop.main.member;

public class MemberSelector {
	private String search;
	
	public MemberSelector() {
		// TODO Auto-generated constructor stub
	}

	public MemberSelector(String search) {
		super();
		this.search = search;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	// 회원목록에서 검색한 회원 불러오려고 만들었습니다. (02.01) 장창호
}
