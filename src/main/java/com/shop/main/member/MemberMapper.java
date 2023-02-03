package com.shop.main.member;

import java.util.List;

public interface MemberMapper {

	public abstract List<Member> getId(Member m);

	public abstract int signup(Member m);

	public abstract int update(Member m);

	public abstract int delete(Member m);

	// 회원목록 회원 불러오기
	public abstract List<Member> getMember(Member m);

	// 회원목록 회원 검색하기
	public abstract List<Member> searchMember(MemberSelector mSel2);

}
