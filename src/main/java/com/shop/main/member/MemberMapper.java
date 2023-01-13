package com.shop.main.member;

import java.util.List;

public interface MemberMapper {
	
	public abstract List<Member> getId(Member m);
	public abstract int signup(Member m);
	public abstract int update(Member m);
	public abstract int delete(Member m);
// 로그인 할때 getId만 있어도 충분하여 삭제했습니다
	
}
