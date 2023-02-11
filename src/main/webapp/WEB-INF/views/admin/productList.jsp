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
				<!--
				ps.product_img (blob) - 바이너리 데이터
				현재 이미지 byte[]가 들어가있음.
				img에 base64를 통해 이미지를 그리는 친구가 존재하는데
				byte[] -> base64 (string)으로 인코딩해서
				태그를 추가해서 그려주면 짜잔하고 나옴
				여기까지 같이 할래 아니면 너가 이따 해볼래? 저기 밑에부분만 바꾸면되는거여?
				src="" <- 수정됨 그러면 내가 이거 해보려면 base64검색해보고 적용해보면되는건가?
				String string = Base64.getEncoder().encodeToString(ps.product_img);
				-->
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