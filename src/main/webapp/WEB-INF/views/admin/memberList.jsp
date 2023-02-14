<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
<link rel="stylesheet" href="resources/css/admin/memberList.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>회원 관리</span>
		</div>
		<!-- 회원 목록 뜨게 해보기 -->
		<div class="admin_content_main">
			<div class="form_section">
				<div class="form_section">
					<!-- DB에 있는 모든 멤버 가져오기 -->
					<table border="1" class="member_table">
						<tr>
							<td>ID</td>
							<td>이름</td>
							<td>주소</td>
							<td>등급</td>
							<td>성별</td>
						</tr>
						<c:forEach var='li' items="${members}">
							<!-- el명 변경 - 성신 -->
							<tr>
								<td><a href="admin.member.info.go">${li.m_id}</a></td>
								<td>${li.m_name}</td>
								<td>${li.m_address}</td>
								<td>${li.m_grade}</td>
								<td>${li.m_sex}</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<!-- 회원목록 페이지 이동 - 성신 -->
				<c:if test="${curPage != 1 }">
					<div id="vocL">
						<span onclick="memberPageChange(${curPage -1});"
							style="cursor: pointer;">&lt; Prev</span>
					</div>

				</c:if>
				<c:if test="${curPage != allPageCount }">
					<div id="vocR">
						<span onclick="memberPageChange(${curPage + 1});"
							style="cursor: pointer;">Next &gt;</span>
					</div>
				</c:if>

				<!-- 회원 검색 - 성신 -->
				<c:if test="${sessionScope.loginMember != null }">
					<form action="member.search" name="memberSearchForm" method="post">
						<div class="search_input">
							<select name="type">
								<option value="all">::보기::</option>
								<option value="m_name">이름</option>
								<option value="m_address">주소</option>
								<option value="m_grade">등급</option>
								<option value="m_sex">성별</option>
							</select> <input type="text" name="search" autocomplete="off"
								maxlength="20" placeholder="회원 검색">
							<!-- <input type="button" style="cursor: pointer; width: 50px; height: 20px;">  -->
							<button class="search_btn">검색</button>
						</div>
					</form>
				</c:if>

			</div>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>