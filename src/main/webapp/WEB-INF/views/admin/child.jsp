<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jQuery.js"></script>
<script type="text/javascript" src="../resources/js/do.js"></script>
<script type="text/javascript" src="../resources/js/go.js"></script>
<script type="text/javascript" src="../resources/js/do_jQuery.js"></script>
</head>
<body>
	<div>
		<form action="child">
			<div>카테고리 등록</div>
			<div class="categoryBox">
				<input class="category_name" name="c_n" autocomplete="off"
					id="cInput">
				<input type="hidden" name="token" value="${token }">
				<button class="c_Btn">등록하기</button>
			</div>
			<!-- <c:forEach var="c_n" items="${sessionScope.p_c.category_name}">
					<h2>${c_n }</h2>
				</c:forEach>
				<br>
				<b>${sessionScope.p_c.category_name }</b>
				<br>-->
			<b>${r }</b>
		</form>
		<c:forEach var="c_n" items="${p_c }">
			<b>${c_n.category_name }</b>
			<br>
		</c:forEach>
		<button onclick="closeChild();">나가기</button>
	</div>
</body>
</html>