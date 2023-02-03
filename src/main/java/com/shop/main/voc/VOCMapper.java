package com.shop.main.voc;

import java.util.List;

public interface VOCMapper {

	public abstract int deleteMsg1(VOCMsg vm);

	public abstract int deleteReply1(VOCReply vr);
	
	public abstract int getAllMsgCount1();
	
	public abstract List<VOCMsg> getMsg1(VOCSelector vSel);
	
	public abstract List<VOCReply> getReply1(VOCMsg vm);
	
	public abstract int getSearchMsgCount1(VOCSelector vSel);
	
	public abstract int writeMsg1(VOCMsg vm);
	
	public abstract int writeReply1(VOCReply vr);
	
	public abstract int updateMsg1(VOCMsg vm);
	
	public abstract int updateReply1(VOCReply vr);
		
	
}
