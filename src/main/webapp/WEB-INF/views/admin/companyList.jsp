<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 목록 페이지</title>
</head>
<link rel="stylesheet" href="resources/css/admin/companyList.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>업체 목록</span>
		</div>
		<div class="author_table_wrap">
			<div class="form_section">
				<div class="form_section">
					<!-- 표 크기, 글자 색 변경필요 (02.07) 장창호 -->
					<table class="company_table" border="1">
						<tr>
							<th class="th_column_1">업체 번호</th>
							<th class="th_column_2">업체 이름</th>
							<th class="th_column_3">등록 국가</th>
							<th class="th_column_4">업체 소개</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.company_number}</td>
								<td><a href="company.info.go">${list.company_name}</a></td>
								<td>${list.country_id}</td>
								<td>${list.company_introduce}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<form action="companyList.go">
					<select name="">
						<option value="menu">::보기::</option>
						<option value="name">이름</option>
						<option value="country">국가</option>
					</select> <input type="text" name="search"> <input type="submit"
						value="검색하기">
				</form>
			</div>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>