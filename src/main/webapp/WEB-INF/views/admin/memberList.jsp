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
				<label>멤버 리스트</label>
				<!-- DB에 있는 모든 멤버 가져오기 -->
				<table border="1">
					<tr>
						<td>ID</td>
						<td>이름</td>
						<td>주소</td>
						<td>등급</td>
						<td>성별</td>
					</tr>
					<c:forEach var='li' items="${list}">
						<tr>
							<td>${li.m_id}</td>
							<td>${li.m_name}</td>
							<td>${li.m_address}</td>
							<td>${li.m_grade}</td>
							<td>${li.m_sex}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<form action="memberList.go">
				<select name="ch1">
					<option value="menu">::보기::</option>
					<option value="name">이름</option>
					<option value="address">주소</option>
					<option value="sex">성별</option>
				</select> <input type="text" name="search"> <input type="submit"
					value="검색하기">
			</form>
			<!-- DB에서 이름과 등급으로 검색된 멤버들 결과 가져오기 -->
			<!-- 멤버리스트 불러온 곳에서 검색된 결과 보여주고 싶음  -->
	</div>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>