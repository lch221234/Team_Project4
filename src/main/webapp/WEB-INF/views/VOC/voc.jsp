<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voice of Customer</title>
<link rel="stylesheet" href="resources/css/voc/voc.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/do.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<!-- gnb영역 -->
			<div class="top_gnb_area">
				<ul class="list">
					<c:choose>
						<c:when test="${sessionScope.loginMember != null}">
							<li><a href="/main">메인 페이지</a></li>
							<li><a onclick="logout();">로그아웃</a></li>
							<li><a href="voc.go">고객센터</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/main">메인 페이지</a></li>
							<li><a href="/main/login">로그인</a></li>
							<li><a href="/main/join">회원가입</a></li>
							<li><a href="voc.go">고객센터</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!-- 제목영역 -->
			<div class="search_top_wrap">
				<span>고객센터</span>

			</div>
			<!-- 콘텐츠영역 -->
			<div class="search_wrap">
				<!-- 네비영역 -->
				<div class="search_navi_wrap">
					<!-- 찾기 -->
					<c:if test="${sessionScope.loginMember != null }">
						<!-- 로그인을 해야만 뜨게 -->
						<!-- 찾기 css추가용으로 추가 (02.06) -찬호 -->
						<div class="search_voc_wrap">
							<span>작성글 찾기</span>

						</div>

						<div>
							<form action="voc.search" name="vocSearchForm"
								onsubmit="return vocSearchCheck();" method="post">

								<div id="vocSearch" class="vocSearch">
									<input name="search" class="search" maxlength="10"
										autocomplete="off" placeholder="검색어를 입력하세요">
								</div>
								<div>
									<button class="search_btn">검색</button>
								</div>
							</form>
							<!-- 질문하기 css추가용으로 추가 (02.06) -찬호 -->
							<div class="qa_voc_wrap">
								<span>질문 하기</span>

							</div>
							<!-- 문의글 등록 -->
							<div>
								<form action="voc.write" name="vocWriteForm"
									onsubmit="return vocWriteCheck();" method="post">
									<input name="token" value="${token }" type="hidden">
									<div id="vocWrite">
										<span><textarea name="v_txt" class="v_txt"
												placeholder="글을 입력하세요" maxlength="500"></textarea></span> <span><button
												class="reg_btn">등록</button> </span>
									</div>
								</form>
							</div>
						</div>
					</c:if>
					<!-- 문의내역 css추가용 추가 (02.06) -찬호 -->
					<div class="show_voc_wrap">
						<span>문의내역</span>
					</div>
					<!-- 문의글 -->
					<c:forEach var="vm" items="${msgs }">
						<div id="vm" style="box-shadow: 0px 0px 1px ${vm.v_color};">
							<div class="vmOwner" align="center" style="color: ${vm.v_color};">${vm.m_id }</div>
							<div class="vmDate" align="right">
								<fmt:formatDate value="${vm.v_when }" type="both"
									dateStyle="long" timeStyle="short" />
							</div>
							<div class="vmtxt">${vm.v_txt }</div>

							<!-- 댓글 -->
							<div id="vmReplyArea">
								<c:forEach var="vr" items="${vm.v_replys }">
									<c:choose>
										<c:when
											test="${vr.vr_owner == sessionScope.loginMember.m_id }">
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
										<input name="token" value="${token }" type="hidden"> <input
											name="vr_v_no" value="${vm.v_no }" type="hidden"> <span
											class="vmReplyID" style="color:${vm.v_color}">
											${sessionScope.loginMember.m_id } </span> <input name="vr_txt"
											style="border-bottom:${vm.v_color} solid 2px;"
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
							<span onclick="vocPageChange(${curPage - 1});"
								style="cursor: pointer;">&lt; Prev</span>
						</div>
					</c:if>

					<c:if test="${curPage != allPageCount }">
						<div id="vocR">
							<span onclick="vocPageChange(${curPage + 1});"
								style="cursor: pointer;">Next &gt;</span>
						</div>
					</c:if>
				</div>




				<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>