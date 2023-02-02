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

			<div class="author_table_wrap">
				<table class="company_table">
						<tr>
							<th class="th_column_1">업체 번호</td>
							<th class="th_column_2">업체 이름</td>
							<th class="th_column_3">등록 국가</td>
							<th class="th_column_4">업체 소개</td>
						</tr>
					<!--<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.company_number}"></c:out></td>
							<td><c:out value="${list.company_name}"></c:out></td>
							<td><c:out value="${list.country_id}"></c:out></td>
							<td><c:out value="${list.company_introduce}"></c:out></td>
						</tr>
					</c:forEach>-->
				</table>
			</div>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>