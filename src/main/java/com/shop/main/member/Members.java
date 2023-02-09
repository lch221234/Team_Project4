package com.shop.main.member;

import java.util.List;

public class Members {
	private List<Member> members;
	
	public Members() {
		// TODO Auto-generated constructor stub
	}

	public Members(List<Member> members) {
		super();
		this.members = members;
	}

	public List<Member> getMember() {
		return members;
	}

	public void setMember(List<Member> members) {
		this.members = members;
	}
	
	
}

