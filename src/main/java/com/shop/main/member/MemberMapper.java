package com.shop.main.member;

import java.util.List;

public interface MemberMapper {
	
	public abstract List<Member> getId(Member m);
	public abstract int signup(Member m);
	public abstract int update(Member m);
	public abstract int delete(Member m);
	
}
