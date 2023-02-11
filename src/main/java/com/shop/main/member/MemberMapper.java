package com.shop.main.member;

import java.util.List;

public interface MemberMapper {

	public abstract List<Member> getId(Member m);

	public abstract int signup(Member m);

	public abstract int update(Member m);

	public abstract int delete(Member m);

	/* 관리자 회원목록 */
	
	// 회원목록 회원 불러오기
	//public abstract List<Member> getMember(Member m);
	
	public abstract List<Member> getMember1 (MemberSelector mSel);
	public abstract List<Member> getMember2 (MemberSelector mSel);
	public abstract List<Member> getMember3 (MemberSelector mSel);
	public abstract List<Member> getMember4 (MemberSelector mSel);
	public abstract List<Member> getMember5 (MemberSelector mSel);

	public abstract int getAllMemberCount();
	
	public abstract int getSearchMemberCount(MemberSelector mSel);

}
