<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voice of Customer</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/do.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
</head>
<body>


	
	
	
	<!-- 찾기 -->
	<c:if test="${sessionScope.loginMember != null }"> <!-- 로그인을 해야만 뜨게 -->
		<div>
		<form action="voc.search" name="vocSearchForm"
			onsubmit="return vocSearchCheck();" method="post">
			<div id="vocSearch">
				<input name="search" maxlength="10" autocomplete="off"
				placeholder="찾기">
			</div>
			<div>
				<button>찾기</button>
			</div>
		</form>
			
	<!-- 문의글 등록 -->
			<div>
				<form action="voc.write" name="vocWriteForm"
					onsubmit="return vocWriteCheck();" method="post">
					<input name="token" value="${token }" type="hidden">
					<div id="vocWrite">
						<span><textarea name="v_txt" placeholder="글을 입력하세요"
							maxlength="500"></textarea></span>
						<span><button>등록</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	
	<!-- 문의글 -->
	<c:forEach var="vm" items="${msgs }">
		<div id="vm" style="box-shadow: 5px 5px 5px ${vm.v_color};">
			<div class="vmOwner" align="center" style="color: ${vm.v_color};">${vm.m_id }</div>
			<div class="vmDate" align="right">
				<fmt:formatDate value="${vm.v_when }" type="both" dateStyle="long" timeStyle="short" /></div>
			<div>${vm.v_txt }</div>
			
	<!-- 댓글 -->
			<div id="vmReplyArea">
				<c:forEach var="vr" items="${vm.v_replys }">
					<c:choose>
						<c:when test="${vr.vr_owner == sessionScope.loginMember.m_id }">
							<span class="vmReplyID" style="color:${vm.v_color};">${vr.vr_owner }</span>
						</c:when>
						<c:otherwise>
							<span class="vmReplyID" style="color:${vm.v_color};">${vr.vr_owner }</span>
						</c:otherwise>
					</c:choose>
					${vr.vr_txt }(<fmt:formatDate value="${vr.vr_when }" type="both"
						dateStyle="short" timeStyle="short" />)
					<c:if test="${vm.m_id == sessionScope.loginMember.m_id}">
						<button onclick="vocReplyUpdate(${vr.vr_no});">수정</button>
						<button onclick="vocReplyDelete(${vr.vr_no});">삭제</button>
					</c:if>
				<br>
			
				</c:forEach>
	<!-- 댓글등록 -->
				<c:if test="${sessionScope.loginMember != null }">
					<hr color="${vm.v_color }">
					<form action="voc.reply.write" method="post"
						onsubmit="return vocReplyWriteCheck(this);">
						<input name="token" value="${token }" type="hidden">
						<input name="vr_v_no" value="${vm.v_no }" type="hidden">
						<span class="vmReplyID" style="color:${vm.v_color}">
							${sessionScope.loginMember.m_id }
						</span>
						<input name="vr_txt" style="border-bottom:${vm.v_color} solid 2px;"
							maxlength="250" placeholder="댓글을 입력하세요" autocomplete="off">
						<button style="color: ${vm.v_color};">등록</button>
					</form>
				</c:if>
				
	<!-- 문의글 수정/삭제 -->
				<div>
					<c:if test="${vm.m_id == sessionScope.loginMember.m_id}">
					<button onclick="vocMsgUpdate(${vm.v_no }, '${vm.v_txt }');"
						style="color: ${vm.v_color};">수정</button>
					<button onclick="vocMsgDelete(${vm.v_no});"
						style="color: ${vm.v_color};">삭제</button>
					</c:if>
				</div>
			</div>
		
		
		</div>
	</c:forEach>
	
	<!-- 제일 하단에 조그맣게 '>' 이 시작됨. css 필요(위치, 크기, 색깔) -->
	<c:if test="${curPage != 1 }">
		<div id="vocL">
			<span onclick="vocPageChange(${curPage - 1});" style="cursor:pointer;">&lt; Prev</span>
		</div>
	</c:if>
	
	<c:if test="${curPage != allPageCount }">
		<div id="vocR">
			<span onclick="vocPageChange(${curPage + 1});" style="cursor:pointer;">Next &gt;</span>
		</div>
	</c:if>
</body>
</html>