<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
<link rel="stylesheet" href="resources/css/admin/productList.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
</head>
<body>
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 목록</span>
		</div>

		<div>
			<input type="button" onclick="productInfo();" value="수정|삭제">
		</div>
		<div>
			<c:forEach var="ps" items="${productsss }">
				<div>${ps.product_name }</div>
				<div>${ps.product_price }</div>
				<div>
					<img src="data:image/jpeg;base64,${ps.product_img_base64}"
						style="width: 150px; height: 150px;">
				</div>
				<div>-----------------------------</div>
			</c:forEach>
		</div>
		<div>
			<form action="product.search" method="post">
				<input autocomplete="off" name="search">
				<button>검색</button>
			</form>
		</div>
		<c:if test="${curPage != 1 }">
			<div id="vocL">
				<span onclick="productPageChange(${curPage - 1});"
					style="cursor: pointer;">&lt; Prev</span>
			</div>
		</c:if>

		<c:if test="${curPage != allProductCount }">
			<div id="vocR">
				<span onclick="productPageChange(${curPage + 1});"
					style="cursor: pointer;">Next &gt;</span>
			</div>
		</c:if>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>