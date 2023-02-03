<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="stylesheet"
	href="resources/css/admin/productRegistration.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
</head>
<body>
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 등록</span>
		</div>
		<div>
			<form action="product.reg" enctype="multipart/form-data"
				method="post">
				<input class="category_code" name="p_c_c"> 카테고리 코드 <input
					class="product_name" name="p_n"> 이름 <input
					class="product_price" name="p_p"> 가격 <input
					class="product_stock" name="p_s"> 재고 <input
					class="product_img" name="p_i" type="file">
				<button>등록하기</button>
			</form>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>